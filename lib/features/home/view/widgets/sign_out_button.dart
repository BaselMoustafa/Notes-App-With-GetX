import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/show_my_snack_bar.dart';
import '../../controllers/sign_out_controller/sign_out_controller.dart';
import '../../controllers/sign_out_controller/sign_out_states.dart';

class SignOutButton extends StatefulWidget {
  const SignOutButton({super.key});

  @override
  State<SignOutButton> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {

  @override
  void initState() {
    super.initState();
    ever(
      Get.find<SignOutController>().state, 
      _signOutListener,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: 80,
      onTap: () => Get.find<SignOutController>().signOut(),
      child:const Text("Sign Out"),
    );
  }

  void _signOutListener(SignOutStates state){
    if(state is SignOutFailedState){
      showMySnackBar(message: state.message);
    }
    if(state is SignOutSuccessState){
      Get.offAllNamed(KConst.signUpScreen);
    }
  }
}