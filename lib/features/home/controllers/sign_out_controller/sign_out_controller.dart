import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notes_app_with_getx/core/constants/constants.dart';
import 'package:notes_app_with_getx/features/home/controllers/sign_out_controller/sign_out_states.dart';

class SignOutController extends GetxController{

  Rx<SignOutStates> state=Rx<SignOutStates>(SignOutInitialState());

  Future<void>signOut()async{
    _update(SignOutLoadingState());
    await Future.delayed(Duration(seconds: 3));
    try {
      await FirebaseAuth.instance.signOut();
      Hive.box(KConst.dataBoxName).delete(KConst.userId);
      _update(SignOutSuccessState());
    } catch (ex) {
      _update(SignOutFailedState(message: "Failed To Sign Out"));
    }
  }

  void _update(SignOutStates state){
    this.state.value=state;
    update();
  }

}