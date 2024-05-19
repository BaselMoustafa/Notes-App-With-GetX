import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_with_getx/bindings.dart';
import 'package:notes_app_with_getx/core/constants/constants.dart';
import 'package:notes_app_with_getx/features/auth/view/screens/sign_up_screen.dart';
import 'package:notes_app_with_getx/features/auth/view/screens/splash_screen.dart';
import 'package:notes_app_with_getx/features/home/home_screen.dart';
import 'package:notes_app_with_getx/middle_wares.dart';
import 'features/auth/view/screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}
//sd
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:const SplashScreen(),
      getPages: [
        GetPage(name:"/", page:()=> const SplashScreen()),
        GetPage(name:KConst.homeScreen, page:()=> const HomeScreen(),binding: HomeBiniding()),
        GetPage(name:KConst.signInScreen, page:()=> const SignInScreen(),binding: SignInBiniding()),
        GetPage(name:KConst.signUpScreen,page:()=> const SignUpScreen(),binding: SignUpBiniding(),middlewares:[SignUpMiddleWare()]),
      ],
    );
  }
}
