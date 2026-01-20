import 'package:flutter/material.dart';
import '../models/note_model.dart';
import 'edit_note_screen.dart';

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
            onPressed: () async {
              final updatedNote = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditNoteScreen(note: note, index: index),
                ),
              );

              if (updatedNote != null && updatedNote is Note) {
                notes[index] = updatedNote;
                Navigator.pop(context, true);
              }
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
