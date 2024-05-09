
import 'package:notes_app_with_getx/features/home/model/note.dart';

abstract class GetNotesStates{}

class GetNotesInitialgState extends GetNotesStates{}
class GetNotesLoadingState extends GetNotesStates{}
class GetNotesSuccessState extends GetNotesStates{
  final bool thereAreNoNotes;
  final List<Note>notes;
  GetNotesSuccessState({required this.thereAreNoNotes,required this.notes});
}
class GetNotesFailedState extends GetNotesStates{
  final String message;
  final List<Note>notes;
  GetNotesFailedState({required this.message,required this.notes});
}