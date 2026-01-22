import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/note.dart';
import '../routes/app_routes.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final int index;
  final VoidCallback onDelete;

  const NoteCard({
    super.key,
    required this.note,
    required this.index,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.detail,
          arguments: note,
          parameters: {'index': index.toString()},
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          title: Text(note.title),
          subtitle: Row(
            children: [
              Text(note.date),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  note.content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}