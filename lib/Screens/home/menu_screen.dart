import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_class/Controllers/zoom_drawer_controller.dart';
import 'package:master_class/config/themes/app_colors.dart';
import 'package:master_class/config/themes/ui_parameters.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: UIParameters.mobileScreenPadding,
       width: double.maxFinite,
       decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
      data: ThemeData(textButtonTheme:TextButtonThemeData(
        style: TextButton.styleFrom(primary: onSurfaceTextColor)
      ),
      ), 
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: BackButton(
              color: Colors.white,
              onPressed: (){
                controller.toogleDrawer();
              },
            ),
            ),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width*0.3,
            ),
            child: Column(
              children: [
                Obx(() => controller.user.value==null?
                SizedBox()
                :Text(
                  controller.user.value!.displayName??'',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: onSurfaceTextColor
                  ),
                )
                )
              ],
            ),
          )
            
          ],
        ),
      ),
      ),
    );
  }
}


// class _DawerButton extends StatelessWidget {
//   const _DawerButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton.icon(
//       onPressed: ()=>null, 
//       icon: Icon(
//         icon,
//         size: 15,
//       ), 
//       label: Text();
//   }
// }