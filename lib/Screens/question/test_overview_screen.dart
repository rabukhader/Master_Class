import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_class/Controllers/question_paper/questions_controller.dart';
import 'package:master_class/Screens/home/question_card.dart';
import 'package:master_class/Screens/question/question_number_card.dart';
import 'package:master_class/config/themes/custom_text_styles.dart';
import 'package:master_class/config/themes/ui_parameters.dart';
import 'package:master_class/widgets/common/background_decoration.dart';
import 'package:master_class/widgets/common/custom_app_bar.dart';
import 'package:master_class/widgets/common/main_button.dart';
import 'package:master_class/widgets/content_area.dart';
import 'package:master_class/widgets/questions/answer_card.dart';
import 'package:master_class/widgets/questions/countdown_timer.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});
  static const String routeName = "/testoverview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: controller.completedTest),
      body: BackgroundDecoretion(
          child: Column(
        children: [
          Expanded(
              child: ContentArea(
                  child: Column(
            children: [
              Row(
                children: [
                  CountdownTimer(
                      color: UIParameters.isDarkMode()
                          ? Theme.of(context).textTheme.bodyText1!.color
                          : Theme.of(context).primaryColor,
                      time: ""),
                  Obx(() => Text(
                        '${controller.time} Remaining',
                        style: countDownTimerTs(),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: GridView.builder(
                itemCount: controller.allQuestions.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: Get.width ~/75, childAspectRatio: 1, crossAxisSpacing: 8 , mainAxisSpacing: 8), 
                itemBuilder: (_, index){
                  AnswerStatus? _answerStatus;
                  if(controller.allQuestions[index].selectedAnswer!=null){
                    _answerStatus = AnswerStatus.answered;
                  }
                 return QuestionNumberCard(index: index+1, status: _answerStatus, onTap: () => controller.jumpToQuestion(index));
                },)
                
                )
            ,ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: 
            Padding(
              padding: UIParameters.mobileScreenPadding,
              child: 
              MainButton(onTap: (){
                controller.complete();
              }, title: 'Complete',),
              
              ),
            )
            ],
          )))
        ],
      )),
    );
  }
}
