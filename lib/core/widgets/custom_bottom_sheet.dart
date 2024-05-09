import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../style/color_manager.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key,required this.children,this.height});
  final List<Widget>children;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10,width: double.infinity,),
            const Center(child: _GreyLine()),
            Flexible(
              child: SingleChildScrollView(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    ...children,
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GreyLine extends StatelessWidget {
  const _GreyLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: 80,
      margin:const EdgeInsets.only(top: 10,bottom: 20),
      decoration: BoxDecoration(
        color: ColorManager.grey,
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}