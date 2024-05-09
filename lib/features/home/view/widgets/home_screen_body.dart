import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_with_getx/features/home/controllers/get_notes_controller/get_notes_controller.dart';
import 'package:notes_app_with_getx/features/home/controllers/get_notes_controller/get_notes_states.dart';
import 'package:notes_app_with_getx/features/home/view/widgets/notes_list_view.dart';

import '../../../../core/widgets/exception_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/show_my_snack_bar.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {

  @override
  void initState() {
    super.initState();
    ever(
      Get.find<GetNotesController>().state, 
      _listener,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetNotesController>(
      builder: (controller) =>_builder(controller.state.value),
    );
  }

  void _listener(GetNotesStates state) {
    if(state is GetNotesFailedState && state.notes.isNotEmpty){
      showMySnackBar(message: state.message);
    }  
  } 

  Widget _builder(GetNotesStates state) {
    if(state is GetNotesLoadingState){
      return const LoadingWidget();
    }
    if(state is GetNotesSuccessState){
      return NotesListView(
        notes: state.notes,
        withLoadingIndicator: !state.thereAreNoNotes,
      );
    }
    if(state is GetNotesFailedState){
      return state.notes.isNotEmpty?
        NotesListView(notes: state.notes)
        :ExceptionWidget(
          message: state.message,
          onTryAgain: () => Get.find<GetNotesController>().getNotes(),
        );
    }
    return const SizedBox();
  }
}