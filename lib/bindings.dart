import 'package:get/get.dart';
import 'package:notes_app_with_getx/features/auth/controllers/sign_in_controller/sign_in_controller.dart';
import 'package:notes_app_with_getx/features/home/controllers/add_delete_note_controller/add_delete_note_controller.dart';
import 'package:notes_app_with_getx/features/home/controllers/get_notes_controller/get_notes_controller.dart';
import 'package:notes_app_with_getx/features/home/controllers/sign_out_controller/sign_out_controller.dart';
import 'features/auth/controllers/sign_up_controller/sign_up_controller.dart';

class SignInBiniding extends Bindings{
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}

class SignUpBiniding extends Bindings{
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}

class HomeBiniding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SignOutController());
    Get.lazyPut(()=>AddDeleteNoteController());
    Get.lazyPut(()=>GetNotesController());
  }
}