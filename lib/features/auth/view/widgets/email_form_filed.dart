import 'package:flutter/material.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/style/color_manager.dart';
import '../../../../core/widgets/custom_text_form_filed.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key,required this.emailController});
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textFormFieldProperties: TextFormFieldProperties(
        prefixIcon:const Icon(Icons.email,color: ColorManager.primary,),
        labelText: "Email",
        controller: emailController,
        validator:hasNotToBeEmpty,
      ),
    );
  }
}