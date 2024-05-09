import 'dart:async';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:notes_app_with_getx/core/constants/constants.dart';
import 'package:notes_app_with_getx/features/home/controllers/add_delete_note_controller/add_delete_note_states.dart';

class AddDeleteNoteController extends GetxController {
  final Rx<AddDeleteNoteStates>state=Rx(AddDeleteNoteInitialState());

  Future<void>addNote({
    required String label,
    required String content,
  })async{
    return await _tryAndCatchBlock(
      isForAdd: true,
      methodToExcute: ()async {
        DocumentReference reference=FirebaseFirestore.instance.collection(
          Hive.box(KConst.dataBoxName).get(KConst.userId)
        ).doc();
        await reference.set({
          KConst.id:reference.id,
          KConst.label:label,
          KConst.content:content,
          KConst.date:DateTime.now(),
        });
      },
    );
  }

  Future<void>deleteNote(String id)async{
    return await _tryAndCatchBlock(
      isForAdd: false,
      methodToExcute: ()async {
        await FirebaseFirestore.instance.collection(
          Hive.box(KConst.dataBoxName).get(KConst.userId)
        ).doc(id).delete();
      },
    );
  }

  void _update(AddDeleteNoteStates state){
    this.state.value=state;
    update();
  }

  Future<void>_tryAndCatchBlock({
    required Future<void> Function() methodToExcute,
    required bool isForAdd,
  })async{
    _update(AddDeleteNoteLoadingState());
    try {
      await methodToExcute.call();
      _update(AddDeleteNoteSuccessState(
        message: isForAdd?"Note Added Successfully":"Note Deleted Successfully"
      ));
    } catch (ex) {
      _update(AddDeleteNoteFailedState(
        message: isForAdd?"Failed To Add The Note":"Failed To Delete The Note"
      ));
    }
  }
}