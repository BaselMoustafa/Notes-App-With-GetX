import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:notes_app_with_getx/features/home/model/note.dart';

import '../../../../core/constants/constants.dart';
import 'get_notes_states.dart';

class GetNotesController extends GetxController {
  final Rx<GetNotesStates> state= Rx<GetNotesStates>(GetNotesInitialgState());

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  final int _limit=7;
  int _page=0;
  StreamSubscription? _streamSubscription;
  List<Note>_notes=[];
  bool _thereAreNoMoreNotes=false;

  Future<void> getNotes()async{
    if( ! await InternetConnectionChecker().hasConnection){
      _update(GetNotesFailedState(
        message: "Please Check Your Netwok Connection", 
        notes: _notes
      ));
      return ;
    }
    if(_thereAreNoMoreNotes){
      return ;
    }

    if(_notes.isEmpty){
      _update(GetNotesLoadingState());
    }
    
    await Future.delayed(Duration(seconds: 3));
    _page++;

    if(_streamSubscription!=null){
      _streamSubscription!.cancel();
    }

    _initializeStremSubsribtion();

  }

  void _initializeStremSubsribtion(){
    _streamSubscription=_notesQuery.snapshots().listen(
      _onData,
      onError: _onError,
    );
  }

  Query get _notesQuery{
    return FirebaseFirestore.instance
    .collection(
      Hive.box(KConst.dataBoxName).get(KConst.userId)
    )
    .orderBy(KConst.date,descending: true)
    .limit(_page*_limit);
  }
    

  void _onError(_){
    _page--;
    _update(GetNotesFailedState(
      notes: _notes,
      message: "Failed To Get Bmi Results",
    ));
  }

  void _onData(QuerySnapshot event) {
    _notes=[];
    if(event.docs.length<_page*_limit){
      _thereAreNoMoreNotes=true;
    }else{
      _thereAreNoMoreNotes=false;
    }
    for (var i = 0; i < event.docs.length; i++) {
      _notes.add(Note.fromMap(event.docs[i].data() as Map<String,dynamic>));
    }
    _update(GetNotesSuccessState(
      thereAreNoNotes: _thereAreNoMoreNotes,
      notes: _notes,
    ));
  }

  void _update(GetNotesStates state){
    this.state.value=state;
    update();
  }
}