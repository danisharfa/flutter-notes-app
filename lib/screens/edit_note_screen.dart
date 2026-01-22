import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notes_controller.dart';
import '../models/note.dart';
import '../routes/app_routes.dart';

class EditNoteScreen extends StatefulWidget {
  final Note note;
  final int index;

  const EditNoteScreen({super.key, required this.note, required this.index});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: contentController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                decoration: const InputDecoration(
                  labelText: 'Content',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final title = titleController.text.trim();
                    final content = contentController.text.trim();

                    if (title.isEmpty || content.isEmpty) {
                      Get.snackbar(
                        'Validation',
                        'Title dan Content wajib diisi',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    final updatedNote = Note(
                      title: title,
                      content: content,
                      date: widget.note.date,
                    );

                    final controller = Get.find<NotesController>();
                    controller.updateNote(widget.index, updatedNote);
                    Get.offNamed(AppRoutes.home);
                  },
                  child: const Text('Update Note'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
