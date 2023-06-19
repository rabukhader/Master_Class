import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_class/Controllers/question_paper/questions_controller.dart';
import 'package:master_class/firebase_ref/loading_status.dart';
import 'package:master_class/widgets/common/background_decoration.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({Key? key}) : super(key: key);

  static const String routeName = "/questionsscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundDecoretion(
      child: Obx(() => Center(
              child: Column(
            children: [
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Text(controller.currentQuestion.value!.question)
            ],
          ))),
    ));
  }
}
