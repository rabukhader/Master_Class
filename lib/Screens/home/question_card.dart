import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:master_class/Controllers/question_paper/question_paper_controller.dart';
import 'package:master_class/config/themes/custom_text_styles.dart';
import 'package:master_class/config/themes/ui_parameters.dart';
import 'package:master_class/models/question_paper_model.dart';
import 'package:get/get.dart';
import 'package:master_class/widgets/app_icon_text.dart';
class QuestionCard extends GetView<QuestionPaperController> {
  const QuestionCard({super.key, required this.model});

  final QuestionPaperModel model;
  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        onTap: (){
          controller.navigateToQuestions(paper: model);
        },
        child: Padding(
          padding: const EdgeInsets.all(_padding),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ColoredBox(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: 
                      SizedBox(
                        height:Get.width*0.15,
                        width:Get.width*0.15,
                        child: CachedNetworkImage(
                          imageUrl: model.imageUrl!,
                          placeholder: (context,Url)=> Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),
                          errorWidget: (context,Url , error ) => Image.asset("assets/images/app_splash_logo.png"),
                        ),
                      ),
                  ),
                ),
               const SizedBox(width: 12,),
               Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: cartTitels(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: Text(
                          model.description
                        ),
                      ),
                      Row(
                        children: [
                          AppIconText(
                          icon: Icon(Icons.help_outline_sharp,
                          color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor,
                          ),
                          Text: Text('${model.question_count} questions',
                          style: detailText.copyWith(
                            color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor,
                          ),
                          ),),
                          SizedBox(width: 15,),
                          AppIconText(
                          icon: Icon(Icons.timer,
                          color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor,
                          ), 
                          Text: Text('${model.timeInMinits()}',
                          style: detailText.copyWith(
                            color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor,
                          ),
                          ),),
      
                        ],
          
                      ),
                      
                    ],
                  ),
                ) 
              ],
            ),
          Positioned(
                       bottom: -_padding,
                       right: -_padding,
                      child: GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20 ),
                          child: Icon(Icons.emoji_events_outlined,/*AppIcons.trophyOutLine */ ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(cardBorderRadius),
                              bottomRight: Radius.circular(cardBorderRadius),
                            ),
                          ),
                        ),
                      ),
                      ),
          ],
        ),),
      ),
    );
  }
}