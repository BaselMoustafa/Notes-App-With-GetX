import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_with_getx/core/functions/functions.dart';
import 'package:notes_app_with_getx/core/widgets/custom_button.dart';
import 'package:notes_app_with_getx/features/home/controllers/add_delete_note_controller/add_delete_note_controller.dart';
import '../../../../core/widgets/custom_bottom_sheet.dart';
import '../../../../core/widgets/custom_text_form_filed.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  late GlobalKey<FormState>_formKey;
  late final TextEditingController _labelTextController;
  late final TextEditingController _contentTextController;

  @override
  void initState() {
    super.initState();
    _formKey=GlobalKey<FormState>();
    _labelTextController=TextEditingController();
    _contentTextController=TextEditingController();
    
  }

  @override
  void dispose() {
    _labelTextController.dispose();
    _contentTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CustomBottomSheet(
        children: [
          _LabelTextFeild(state: this),
          const SizedBox(height: 10,),
          _ContentTextFeild(state: this),
          const SizedBox(height: 20,),
          _AddButton(state: this)
        ],
      ),
    );
  }

}

class _LabelTextFeild extends StatelessWidget {
  const _LabelTextFeild({required this.state});
  final _AddNoteBottomSheetState state;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textFormFieldProperties: TextFormFieldProperties(
        labelText: "Label",
        validator: hasNotToBeEmpty,
        controller: state._labelTextController,
      )
    );
  }
}

class _ContentTextFeild extends StatelessWidget {
  const _ContentTextFeild({required this.state});
  final _AddNoteBottomSheetState state;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textFormFieldProperties: TextFormFieldProperties(
        labelText: "Content",
        validator: hasNotToBeEmpty,
        controller: state._contentTextController,
      )
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({required this.state});
  final _AddNoteBottomSheetState state;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: _onTap,
      child:const Text("Add"),
    );
  }

  void _onTap(){
    if(state._formKey.currentState!.validate()){
      Get.back();
      Get.find<AddDeleteNoteController>().addNote(
        label: state._labelTextController.text, 
        content: state._contentTextController.text,
      );
    }
  }
}