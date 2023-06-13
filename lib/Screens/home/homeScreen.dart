import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:master_class/Controllers/question_paper/question_paper_controller.dart';
import 'package:master_class/Controllers/zoom_drawer_controller.dart';
import 'package:master_class/Screens/home/app_icons.dart';
import 'package:master_class/Screens/home/menu_screen.dart';
import 'package:master_class/Screens/home/question_card.dart';
import 'package:master_class/config/themes/app_colors.dart';
import 'package:master_class/config/themes/custom_text_styles.dart';
import 'package:master_class/config/themes/ui_parameters.dart';
import 'package:master_class/widgets/app_circle_button.dart';
import 'package:master_class/widgets/content_area.dart';
class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_){
        return ZoomDrawer(
        borderRadius: 50.0,
        controller: _.zoomDrawerController,
        showShadow: true,
        angle:0.0,
        style: DrawerStyle.defaultStyle ,
        menuBackgroundColor: Colors.white.withOpacity(0.5),
        slideWidth: MediaQuery.of(context).size.width*0.6,
        menuScreen:MyMenuScreen(),
        mainScreen: Container(
        decoration: BoxDecoration(gradient: mainGradient(),),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
              padding:  EdgeInsets.all(mobileScreenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppCircleButtton(
                    onTap: controller.toogleDrawer ,
                  child: Icon(Icons.menu /*AppIcons.menuLeft */)
                  ) ,
                  const SizedBox(height: 10,),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                      const Icon(Icons.favorite_outline_outlined /*AppIcons.peace */,),
                      Text("Hello friend",
                      style: detailText.copyWith(
                        color: onSurfaceTextColor
                      ),),  
                ],
              ),
              ),
                  Text("What do you want to learn today?",
                  style: headerText,
                  ),
                   
            ],
          ),
        ),
              Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ContentArea(
                addPadding: false, 
                child: Obx(
                () => ListView.separated(
                  padding: UIParameters.mobileScreenPadding,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    return QuestionCard(model:questionPaperController.allPapers[index] ,);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: questionPaperController.allPapers.length,
                ),
                    ),
                    ),
              ),
              ),
            ],
      
            ),
            )
        ),
      );
      },)
    );
  }


}