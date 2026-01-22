import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/widgets/note_card.dart';
import '../controllers/notes_controller.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesController = Get.put(NotesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: notesController.notesList.length,
          itemBuilder: (context, index) {
            final note = notesController.notesList[index];
            return NoteCard(
              note: note,
              index: index,
              onDelete: () => _showDeleteDialog(context, index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addNote);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int index) {
    Get.dialog(
      AlertDialog(
        title: const Text('Hapus Note'),
        content: const Text('Apakah Anda yakin ingin menghapus note ini?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Batal')),
          TextButton(
            onPressed: () {
              final controller = Get.find<NotesController>();
              controller.deleteNote(index);
              Get.back();
              Get.snackbar(
                'Success',
                'Note berhasil dihapus',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.redAccent,
                colorText: Colors.white,
              );
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
