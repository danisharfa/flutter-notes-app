class Note {
  final String title;
  final String content;
  final String date;

  Note({required this.title, required this.content, required this.date});
}

final List<Note> notes = [
  Note(
    title: 'Meeting Project',
    content: 'Diskusi roadmap aplikasi dan pembagian task untuk minggu ini.',
    date: '20/1/2026',
  ),
  Note(
    title: 'Belajar Flutter',
    content: 'Pelajari state management, navigation, dan custom widget.',
    date: '19/1/2026',
  ),
  Note(
    title: 'Ide Aplikasi',
    content: 'Aplikasi catatan harian dengan fitur search dan dark mode.',
    date: '18/1/2026',
  ),
  Note(
    title: 'Todo Hari Ini',
    content: 'Ngoding, review UI, dan push ke repository GitHub.',
    date: '20/1/2026',
  ),
  Note(
    title: 'Catatan Penting',
    content: 'Jangan lupa backup project dan rapikan struktur folder.',
    date: '17/1/2026',
  ),
];
