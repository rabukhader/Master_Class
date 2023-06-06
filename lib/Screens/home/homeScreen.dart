import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_class/Controllers/question_paper/question_paper_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
      body: Obx(
        () => ListView.separated(
          itemBuilder: (BuildContext context, index) {
            return ClipRRect(
              child: SizedBox(
                height: 200,
                width: 200,
                child: FadeInImage(
                    placeholder:
                        const AssetImage("assets/images/app_splash_logo.png"),
                    image: NetworkImage(
                        questionPaperController.allPapersImages[index])),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 20);
          },
          itemCount: questionPaperController.allPapersImages.length,
        ),
      ),
    );
  }
}
