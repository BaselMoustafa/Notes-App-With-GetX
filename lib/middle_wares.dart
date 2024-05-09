import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notes_app_with_getx/core/constants/constants.dart';

class SignUpMiddleWare extends GetMiddleware{

  @override
  RouteSettings? redirect(String? route) {
    if(Hive.box(KConst.dataBoxName).get(KConst.userId)!=null){
      return const RouteSettings(name: KConst.homeScreen);
    }
    return null;
  }
}