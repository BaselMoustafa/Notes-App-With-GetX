import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_with_getx/core/style/color_manager.dart';
import 'package:notes_app_with_getx/core/widgets/block_interaction_loading_widget.dart';
import 'package:notes_app_with_getx/features/home/controllers/sign_out_controller/sign_out_controller.dart';
import 'package:notes_app_with_getx/features/home/controllers/sign_out_controller/sign_out_states.dart';
import 'package:notes_app_with_getx/features/home/view/widgets/add_note_floating_action_button.dart';
import 'package:notes_app_with_getx/features/home/view/widgets/home_screen_body.dart';
import 'package:notes_app_with_getx/features/home/view/widgets/sign_out_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignOutController>(
      builder: (controller) {
        return BlockInteractionLoadingWidget(
          isLoading:controller.state.value is SignOutLoadingState,
          widget :Scaffold(
            floatingActionButton:const AddNoteFloatingActionButon(),
            appBar: AppBar(
              title: const Text("Notes",style: TextStyle(color: ColorManager.primary),),
              actions: const[Padding(
                padding:EdgeInsets.only(right: 10),
                child: SignOutButton(),
              )],
            ),
            body: const HomeScreenBody(),
          ),
        );
      },
    );
  }

  
}