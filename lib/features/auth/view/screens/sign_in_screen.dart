import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_with_getx/core/widgets/block_interaction_loading_widget.dart';
import 'package:notes_app_with_getx/core/widgets/show_my_snack_bar.dart';
import 'package:notes_app_with_getx/features/auth/controllers/sign_in_controller/sign_in_controller.dart';
import 'package:notes_app_with_getx/features/auth/controllers/sign_in_controller/sign_in_states.dart';
import 'package:notes_app_with_getx/features/auth/view/widgets/base_authantication_widget.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../widgets/email_form_filed.dart';
import '../widgets/password_form_field.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  @override
  void initState() {
    super.initState();
    ever(
      Get.find<SignInController>().state, 
      _listener,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _listener(SignInStates state){
    
    if(state is SignInSuccessState){
      Get.offAllNamed(KConst.homeScreen);
    }
    if(state is SignInFailedState){
      showMySnackBar(message: state.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      builder: (controller) {
        return BlockInteractionLoadingWidget(
          isLoading: controller.state.value is SignInLoadingState,
          widget: BaseAuthanticationWidget(
            formKey: _formKey, 
            primaryText: "Sign In Now", 
            secondaryText: "To Remember Your Notes",
            textButton: const _DontHaveAccountButton(), 
            authanticationButton: _SignInButton(state: this), 
            textFormFields: [
              EmailFormField(emailController: _emailController,),
              PasswordFormField(passwordController: _passwordController)
            ],
          ),
        );
      },
    ); 
  }
}

class _DontHaveAccountButton extends StatelessWidget {
  const _DontHaveAccountButton();

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      text: "Dont't Have An Account?",
      onTap: ()=>Get.back(), 
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({required this.state});
  final _SignInScreenState state;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap:()=>_onTap(context),
      child: const Text("Sign In"),
    );
  }

  void _onTap (BuildContext context){
    FocusScope.of(context).unfocus();
    if(state._formKey.currentState!.validate()){
      Get.find<SignInController>().signIn(
        email: state._emailController.text, 
        password: state._passwordController.text,
      );
    }
  }
}