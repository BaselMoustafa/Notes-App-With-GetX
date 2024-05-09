import 'package:notes_app_with_getx/core/constants/constants.dart';

class Note {
  final String id;
  final DateTime date;
  final String label;
  final String content;
  const Note({
    required this.id,
    required this.content,
    required this.label,
    required this.date,
  });

  factory Note.fromMap(Map<String,dynamic>map){
    return Note(
      id: map[KConst.id], 
      label: map[KConst.label], 
      content: map[KConst.content], 
      date: map[KConst.date].toDate(),
    );
  }
}