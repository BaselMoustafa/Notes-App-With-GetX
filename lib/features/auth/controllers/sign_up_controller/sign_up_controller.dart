import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../../core/constants/constants.dart';
import 'sign_up_states.dart';

class SignUpController extends GetxController{
  
  Rx<SignUpStates> state= Rx<SignUpStates>(SignUpInitialState());

  Future<void>signUp({
    required String email,
    required String password,
  })async{
    _update(SignUpLoadingState());
    await Future.delayed(const Duration(seconds: 3));
     try {
      //throw Exception();
      UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,password: password);
      Hive.box(KConst.dataBoxName).put(KConst.userId,userCredential.user!.uid);
      _update(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _update(SignUpFailedState(message: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        _update(SignUpFailedState(message: 'The account already exists for that email.'));
      }else{
        _update(SignUpFailedState(message: "Failed At Sign Up, Please Try Again"));
      }
    } catch (e) {
      _update(SignUpFailedState(message: "Failed At Sign Up, Please Try Again"));
    }
  }

  void _update(SignUpStates state){
    this.state.value=state;
    update();
  }
}