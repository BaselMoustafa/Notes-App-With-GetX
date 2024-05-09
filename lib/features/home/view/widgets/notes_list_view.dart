
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_with_getx/features/home/controllers/get_notes_controller/get_notes_controller.dart';
import 'package:notes_app_with_getx/features/home/model/note.dart';
import 'package:notes_app_with_getx/features/home/view/widgets/note_widget.dart';

import '../../../../core/widgets/exception_widget.dart';
import '../../../../core/widgets/loading_widget.dart';


class NotesListView extends StatefulWidget {
  const NotesListView({super.key,required this.notes,this.withLoadingIndicator=false});
  final List<Note>notes;
  final bool withLoadingIndicator;

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController=ScrollController();
    _scrollController.addListener(() {
      if(_scrollController.offset==_scrollController.position.maxScrollExtent){
        Get.find<GetNotesController>().getNotes();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.notes.isEmpty){
      return const ExceptionWidget(
        message: "There Are No Notes Yet",
      );
    }
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.all(10),
      itemCount:widget.withLoadingIndicator?widget.notes.length+1: widget.notes.length,
      separatorBuilder: _separatorBuilder, 
      itemBuilder: _itemBuilder, 
    );
  }

  Widget? _itemBuilder(context,index){
    if(index==widget.notes.length){
      return const LoadingWidget();
    }
    return NoteWidget(note: widget.notes[index]) ;
  }

  Widget _separatorBuilder(context,index)=>const SizedBox(height: 5,);
}