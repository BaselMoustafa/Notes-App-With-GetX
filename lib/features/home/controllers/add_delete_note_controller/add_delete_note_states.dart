abstract class AddDeleteNoteStates{}

class AddDeleteNoteInitialState extends AddDeleteNoteStates{}
class AddDeleteNoteLoadingState extends AddDeleteNoteStates{}
class AddDeleteNoteSuccessState extends AddDeleteNoteStates{
  final String message;
  AddDeleteNoteSuccessState({required this.message});
}
class AddDeleteNoteFailedState extends AddDeleteNoteStates{
  final String message;
  AddDeleteNoteFailedState({required this.message});
}