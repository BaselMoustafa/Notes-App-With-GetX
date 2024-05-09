import 'package:flutter/material.dart';

import '../../../../core/functions/functions.dart';
import '../../../../core/style/color_manager.dart';
import '../../../../core/widgets/custom_text_form_filed.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({super.key,required this.passwordController});
  final TextEditingController passwordController;
  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isVisible=false;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textFormFieldProperties: TextFormFieldProperties(
        prefixIcon:const Icon(Icons.lock,color: ColorManager.primary,),
        validator: hasNotToBeEmpty,
        obscureText: ! _isVisible,
        controller: widget.passwordController,
        labelText: "Password",
        suffixIcon: IconButton(
          icon:  Icon(
            _isVisible?Icons.visibility_off:Icons.visibility,
            color: ColorManager.primary,
          ),
          onPressed: () {
            setState(() {
              _isVisible=!_isVisible;
            });
          },
        ),
      ),
    );
  }
}