import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/note.dart';
import '../routes/app_routes.dart';

class DetailScreen extends StatelessWidget {
  final Note note;
  final int index;

  const DetailScreen({super.key, required this.note, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(
                AppRoutes.editNote,
                arguments: note,
                parameters: {'index': index.toString()},
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.date),
            const SizedBox(height: 8),
            Text(note.content),
          ],
        ),
      ),
    );
  }
}