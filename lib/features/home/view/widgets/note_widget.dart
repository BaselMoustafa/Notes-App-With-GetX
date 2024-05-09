import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notes_app_with_getx/core/style/box_decoration_manager.dart';
import 'package:notes_app_with_getx/core/style/color_manager.dart';
import 'package:notes_app_with_getx/features/home/controllers/add_delete_note_controller/add_delete_note_controller.dart';
import 'package:notes_app_with_getx/features/home/model/note.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key,required this.note});
  final Note note;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecorationManager.solidWithShadow(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _LabelTextWidget(note: note),
              _DeleteNoteButton(note: note,)
            ],
          ),
          const SizedBox(height: 10,),
          _ContentTextWidget(note: note),
        ],
      ),
    );
  }
}

class _LabelTextWidget extends StatelessWidget {
  const _LabelTextWidget({
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Text(
      note.label,
      style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
    );
  }
}

class _DeleteNoteButton extends StatelessWidget {
  const _DeleteNoteButton({required this.note});
  final Note note;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: ColorManager.red,
      icon: const Icon(Icons.delete),
      onPressed: ()=>Get.find<AddDeleteNoteController>().deleteNote(note.id), 
    );
  }
}

class _ContentTextWidget extends StatelessWidget {
  const _ContentTextWidget({
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Text(
      note.content,
      style: const TextStyle(fontSize: 16),
    );
  }
}