import 'package:get/get.dart';
import 'package:notes_app/controllers/notes_controller.dart';

class NotesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NotesController>(() => NotesController());
  }
}