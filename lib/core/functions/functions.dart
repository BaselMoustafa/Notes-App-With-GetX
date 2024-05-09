import 'package:flutter/material.dart';

String? hasToBeInt({required BuildContext context,String? value,int? maxValue}){
  String? result=hasNotToBeEmpty(value);
  if(result!=null){
    return result;
  }
  int? number= int.tryParse(value!);
  
  if(number==null){
    return "Have To Be Int";
  }

  if(maxValue!=null && number>maxValue){
    return "Max Value Is $maxValue";
  }

  return null;
}

String? hasNotToBeEmpty(String? value){
  if(value==null||value.trim().length==0){
    return "Requierd Field";
  }
  return null; 
}
