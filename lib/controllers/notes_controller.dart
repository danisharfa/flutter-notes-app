import 'package:get/get.dart';
import 'package:notes_app/models/note.dart';

class NotesController extends GetxController {
  final notesList = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    notesList.assignAll(notes);
  }

  void addNote(Note note) {
    notesList.insert(0, note);
  }

  void deleteNote(int index) {
    notesList.removeAt(index);
  }

  void updateNote(int index, Note updatedNote) {
    notesList[index] = updatedNote;
  }

  int get totalNotes => notesList.length;
}
