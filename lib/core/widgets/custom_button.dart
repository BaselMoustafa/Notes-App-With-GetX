import 'package:flutter/material.dart';

import '../style/box_decoration_manager.dart';
import '../style/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    required this.onTap,
    this.height=45,
    this.width,
    this.boxDecoration,
    this.disabled=false,
    this.color=ColorManager.primary,
    this.animatationDuration=const Duration(milliseconds: 500),
  });
  final VoidCallback onTap;
  final Widget child;
  final BoxDecoration? boxDecoration;
  final double? height;
  final double? width;
  final bool disabled;
  final Duration animatationDuration;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:disabled?null:onTap,
      child: DefaultTextStyle(
        style:const TextStyle(color: ColorManager.white,),
        child: AnimatedContainer(
          duration:animatationDuration,
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: _getBoxDecoration(),
          child:child,
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecoration(){
    if(disabled){
      return BoxDecorationManager.solidWithShadow(color:ColorManager.grey.withOpacity(0.5));
    }
    return boxDecoration??BoxDecorationManager.solidWithShadow(color: color);
  }

}