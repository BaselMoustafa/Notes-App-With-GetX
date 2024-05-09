import 'package:flutter/material.dart';
import 'color_manager.dart';

abstract class BoxDecorationManager{

  static BoxDecoration  solid=BoxDecoration(
    color: ColorManager.white,
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration  outlined=BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      width: 1,
      color: ColorManager.primary,
    ),
  );

  static BoxDecoration  solidWithShadow({
    Color? color,
    Color? shadowColor,
    double?blurRadius,
  }){
    color=color??ColorManager.white;
    shadowColor=shadowColor??ColorManager.grey.withOpacity(0.3);
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: color,
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          blurRadius: blurRadius??5,
        ),
      ],
    );
  }

  static BoxDecoration solidCircle = const BoxDecoration(
    shape: BoxShape.circle,
    color: ColorManager.white,
  );

  static BoxDecoration outlinedCircle({Color borderColor=ColorManager.white,double borderWidth=2})=>BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(width: borderWidth,color: borderColor),
  );

  static BoxDecoration  solidCircleWithShadow({
    Color? color,
    Color? shadowColor,
  }){
    color=color??ColorManager.white;
    shadowColor=shadowColor??ColorManager.grey.withOpacity(0.4);
    return BoxDecoration(
      shape: BoxShape.circle,
      borderRadius: BorderRadius.circular(10),
      color: color,
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 5,
        ),
      ],
    );
  }
}