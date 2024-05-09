import 'package:flutter/material.dart';
import '../../../../core/style/color_manager.dart';

class BaseAuthanticationWidget extends StatelessWidget {
  const BaseAuthanticationWidget({
    super.key,
    required this.textFormFields,
    required this.textButton,
    required this.authanticationButton,
    required this.formKey,
    required this.primaryText,
    required this.secondaryText,
  });
  final String primaryText;
  final String secondaryText;
  final GlobalKey<FormState> formKey;
  final List<Widget> textFormFields;
  final Widget authanticationButton;
  final Widget textButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key:formKey,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _PrimaryText(primaryText: primaryText),
                const SizedBox(height: 10),
                _SecondaryText(secondaryText: secondaryText),
                const SizedBox(height: 40,),
                
                for(int i=0;i<textFormFields.length;i++)
                Padding(
                  padding: EdgeInsets.only(bottom: i==textFormFields.length-1?0:10),
                  child:textFormFields[i],
                ),
                  
                const SizedBox(height: 20,),
               authanticationButton,
               textButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PrimaryText extends StatelessWidget {
  const _PrimaryText({
    required this.primaryText,
  });

  final String primaryText;

  @override
  Widget build(BuildContext context) {
    return Text(
      primaryText,
      style:const  TextStyle(
        color: ColorManager.primary,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _SecondaryText extends StatelessWidget {
  const _SecondaryText({
    required this.secondaryText,
  });

  final String secondaryText;

  @override
  Widget build(BuildContext context) {
    return Text(
      secondaryText,
      style: const TextStyle(color: ColorManager.grey),
    );
  }
}
