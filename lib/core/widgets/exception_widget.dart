import 'package:flutter/material.dart';

import '../style/color_manager.dart';
import 'custom_button.dart';


class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({super.key,this.onTryAgain,required this.message,this.actionWidget,this.widget,this.color=ColorManager.white});
  final Color color;
  final Widget? widget;
  final String message;
  final VoidCallback? onTryAgain;
  final Widget?actionWidget;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget??const SizedBox(
            height: 100,
            width: 100,
            child:Icon(Icons.error,size: 50,color: ColorManager.primary,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16,color: ColorManager.primary),
            ),
          ),
          const SizedBox(height: 20,),
          if(actionWidget!=null)
          actionWidget!,
          if(onTryAgain!=null)
          CustomButton(
            width: 150,
            height: 40,
            onTap:onTryAgain!, 
            child:const Text("Try Again"),
          )
        ],
      ),
    );
  }
}