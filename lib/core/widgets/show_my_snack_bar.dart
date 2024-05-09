import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_with_getx/core/style/color_manager.dart';

void showMySnackBar({
  required String message,
  Color color=ColorManager.red,
  Widget? icon,
}){
  Get.showSnackbar(
    GetSnackBar(
      message:message,
      backgroundColor: color,
      icon:icon?? const Icon(Icons.error,color: ColorManager.white,),
      duration: const Duration(seconds: 3),
    ),
  );
}