import 'package:get/get.dart';
import '../screens/home_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/add_note_screen.dart';
import '../screens/edit_note_screen.dart';
import '../models/note.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(
      name: AppRoutes.detail,
      page: () {
        final note = Get.arguments as Note;
        final index = Get.parameters['index'];
        return DetailScreen(note: note, index: int.parse(index ?? '0'));
      },
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.addNote,
      page: () => const AddNoteScreen(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.editNote,
      page: () {
        final note = Get.arguments as Note;
        final index = Get.parameters['index'];
        return EditNoteScreen(note: note, index: int.parse(index ?? '0'));
      },
      transition: Transition.rightToLeft,
    ),
  ];
}
