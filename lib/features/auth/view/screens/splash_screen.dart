import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/constants/constants.dart';
import '../../../../firebase_options.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _initializeAppServices();
    _timer=Timer(
      const Duration(seconds: 3), 
      _onTimerFinished,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:SizedBox(
          height: 100,
          width: 100,
          child: Icon(Icons.note),
        ),
      ),
    );
  }

  void _onTimerFinished(){
    Get.offNamed(KConst.signUpScreen);
  }

  Future<void> _initializeAppServices()async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Hive.initFlutter();
    await Hive.openBox(KConst.dataBoxName);
  }
}