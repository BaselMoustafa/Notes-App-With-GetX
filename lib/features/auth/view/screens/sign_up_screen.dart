import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_with_getx/core/constants/constants.dart';
import 'package:notes_app_with_getx/core/widgets/block_interaction_loading_widget.dart';
import 'package:notes_app_with_getx/core/widgets/show_my_snack_bar.dart';
import 'package:notes_app_with_getx/features/auth/controllers/sign_up_controller/sign_up_controller.dart';
import 'package:notes_app_with_getx/features/auth/controllers/sign_up_controller/sign_up_states.dart';
import 'package:notes_app_with_getx/features/auth/view/widgets/base_authantication_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../widgets/email_form_filed.dart';
import '../widgets/password_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  final TextEditingController _userNameController= TextEditingController();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController=TextEditingController();


  @override
  void initState() {
    super.initState();
    ever(
      Get.find<SignUpController>().state,
      _listener,
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) {
        return BlockInteractionLoadingWidget(
          isLoading: controller.state.value is SignUpLoadingState,
          widget: BaseAuthanticationWidget(
            formKey: _formKey, 
            primaryText: "Sign Up Now", 
            secondaryText: "Create Your Account Now",
            textButton: const _AlreadyHaveAnAccount(), 
            authanticationButton: _SignUpButton(state: this), 
            textFormFields: [
              EmailFormField(emailController: _emailController),
              PasswordFormField(passwordController: _passwordController)
            ],
          ),
        );
      },
    ); 
  }

   void _listener(SignUpStates state){
    
    if(state is SignUpSuccessState){
      Get.offAllNamed(KConst.homeScreen);
    }
    if(state is SignUpFailedState){
      showMySnackBar(message: state.message);
    }
  }
  
}

class _AlreadyHaveAnAccount extends StatelessWidget {
  const _AlreadyHaveAnAccount();

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      text: "Already Have An Account",
      onTap: ()=>Get.toNamed(KConst.signInScreen), 
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({required this.state});
  final _SignUpScreenState state;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap:()=>_onTap(context),
      child: const Text("Sign Up"),
    );
  }

  void _onTap (BuildContext context){
    FocusScope.of(context).unfocus();
    if(state._formKey.currentState!.validate()){
      Get.find<SignUpController>().signUp(
        email: state._emailController.text, 
        password: state._passwordController.text,
      );
    }
  }
}