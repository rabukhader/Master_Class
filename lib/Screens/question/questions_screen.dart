import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_class/Controllers/question_paper/questions_controller.dart';
import 'package:master_class/Screens/question/test_overview_screen.dart';
import 'package:master_class/config/themes/app_colors.dart';
import 'package:master_class/config/themes/custom_text_styles.dart';
import 'package:master_class/config/themes/ui_parameters.dart';
import 'package:master_class/firebase_ref/loading_status.dart';
import 'package:master_class/widgets/common/background_decoration.dart';
import 'package:master_class/widgets/common/custom_app_bar.dart';
import 'package:master_class/widgets/common/main_button.dart';
import 'package:master_class/widgets/common/question_place_holder.dart';
import 'package:master_class/widgets/questions/answer_card.dart';
import 'package:master_class/widgets/questions/countdown_timer.dart';

import '../../widgets/content_area.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({Key? key}) : super(key: key);

  static const String routeName = "/questionsscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
            leading: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: const ShapeDecoration(
                    shape: StadiumBorder(
                        side: BorderSide(color: onSurfaceTextColor, width: 2))),
                child: Obx(
                  () => CountdownTimer(
                    time: controller.time.value,
                    color: onSurfaceTextColor,
                  ),
                )),
            showActionIcon: true,
            titleWidget: Obx(
              () => Text(
                "Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}",
                style: appBarTS,
              ),
            )),
        body: BackgroundDecoretion(
          child: Obx(() => Column(
                children: [
                  if (controller.loadingStatus.value == LoadingStatus.loading)
                    const Expanded(
                        child: ContentArea(child: QuestionScreenHolder())),
                  if (controller.loadingStatus.value == LoadingStatus.completed)
                    Expanded(
                      child: ContentArea(
                        child: SingleChildScrollView(
                            padding: const EdgeInsets.only(top: 25),
                            child: Column(
                              children: [
                                Text(
                                  controller.currentQuestion.value!.question,
                                  style: questionTS,
                                ),
                                GetBuilder<QuestionsController>(
                                    id: 'answers_list',
                                    builder: (context) {
                                      return ListView.separated(
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.only(top: 25),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final answer = controller
                                              .currentQuestion
                                              .value!
                                              .answers[index];
                                          return AnswerCard(
                                            onTap: () {
                                              controller.selectedAnswer(
                                                  answer.identifier);
                                            },
                                            answer:
                                                '${answer.identifier}. ${answer.answer}',
                                            isSelected: answer.identifier ==
                                                controller.currentQuestion
                                                    .value!.selectedAnswer,
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const SizedBox(
                                          height: 10,
                                        ),
                                        itemCount: controller.currentQuestion
                                            .value!.answers.length,
                                      );
                                    }),
                              ],
                            )),
                      ),
                    ),
                  ColoredBox(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Padding(
                        padding: UIParameters.mobileScreenPadding,
                        child: Row(
                          children: [
                            Visibility(
                                visible: controller.isFirstQuestion,
                                child: SizedBox(
                                  width: 55.0,
                                  height: 55.0,
                                  child: MainButton(
                                    onTap: () {
                                      controller.prevQuestion();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Get.isDarkMode
                                          ? onSurfaceTextColor
                                          : Theme.of(context).primaryColor,
                                    ),
                                  ),
                                )),
                            Expanded(
                              child: Visibility(
                                  visible: controller.loadingStatus.value ==
                                      LoadingStatus.completed,
                                  child: MainButton(
                                    onTap: () {
                                      controller.isLastQuestion
                                          ?Get.toNamed(
                                              TestOverviewScreen.routeName)
                                          : controller.nextQuestion();
                                    },
                                    title: controller.isLastQuestion
                                        ? 'Complete'
                                        : 'Next',
                                  )),
                            )
                          ],
                        ),
                      ))
                ],
              )),
        ));
  }
}
