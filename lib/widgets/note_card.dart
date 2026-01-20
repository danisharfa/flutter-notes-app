import 'package:flutter/material.dart';
import 'package:notes_app/screens/detail_screen.dart';
import '../models/note_model.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final int index;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  const NoteCard({
    super.key,
    required this.note,
    required this.index,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(note: note, index: index),
          ),
        );

        if (result == true) {
          onUpdate();
        }
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
