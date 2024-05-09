import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/style/color_manager.dart';
import '../../../../core/widgets/show_my_snack_bar.dart';
import '../../controllers/add_delete_note_controller/add_delete_note_controller.dart';
import '../../controllers/add_delete_note_controller/add_delete_note_states.dart';
import 'add_note_bottom_sheet.dart';

class AddNoteFloatingActionButon extends StatefulWidget {
  const AddNoteFloatingActionButon({super.key});

  @override
  State<AddNoteFloatingActionButon> createState() => _AddNoteFloatingActionButonState();
}

class _AddNoteFloatingActionButonState extends State<AddNoteFloatingActionButon> {

  @override
  void initState() {
    super.initState();
    ever(
      Get.find<AddDeleteNoteController>().state, 
      _listener
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorManager.primary,
      child: const Icon(Icons.add,color: ColorManager.white,),
      onPressed: () {
        showModalBottomSheet(
          context: context, 
          isScrollControlled: true,
          builder: (context)=>const AddNoteBottomSheet(),
        );
      },
    );
  }

  void _listener(AddDeleteNoteStates state){
    if(state is AddDeleteNoteSuccessState){
      showMySnackBar(
        message: state.message,
        color: ColorManager.green,
        icon:const Icon(Icons.check,color: ColorManager.white,),
      );
    }
    if(state is AddDeleteNoteFailedState){
      showMySnackBar(message: state.message);
    }
  }
}