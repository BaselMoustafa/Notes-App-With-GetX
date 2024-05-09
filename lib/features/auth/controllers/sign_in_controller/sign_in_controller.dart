import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notes_app_with_getx/features/auth/controllers/sign_in_controller/sign_in_states.dart';
import 'package:notes_app_with_getx/core/constants/constants.dart';

class SignInController extends GetxController{
  
  Rx<SignInStates> state=Rx<SignInStates>(SignInInitialState());

  Future<void>signIn({
    required String email,
    required String password,
  })async{
    _update(SignInLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    try {
      UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,password: password);
      Hive.box(KConst.dataBoxName).put(KConst.userId,userCredential.user!.uid);
      _update(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _update(SignInFailedState(message: 'No user found for that email.' ));
      } else if (e.code == 'wrong-password') {
        _update(SignInFailedState(message: 'Wrong password provided for that user.' ));
      }
      _update(SignInFailedState(message: "Failed At Sign In, Please Try Again"));
    }catch(ex){
      _update(SignInFailedState(message: "Failed At Sign In, Please Try Again"));
    }
  }

  void _update(SignInStates state){
    this.state.value=state;
    update();
  }

 
}

