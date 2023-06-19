import 'package:get/get.dart';
import 'package:master_class/Controllers/question_paper/question_paper_controller.dart';
import 'package:master_class/Controllers/question_paper/questions_controller.dart';
import 'package:master_class/Controllers/zoom_drawer_controller.dart';
import 'package:master_class/Screens/home/homeScreen.dart';
import 'package:master_class/Screens/introduction/introduction.dart';
import 'package:master_class/Screens/login/login_screen.dart';
import 'package:master_class/Screens/question/questions_screen.dart';
import 'package:master_class/Screens/splash/splash.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
          name: "/introduction",
          page: () => const AppIntroductionScreen(),
        ),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(
          name: LoginScreen.routeName,
          page: () => LoginScreen(),
        ),
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => QuestionsScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionsController());
            }))
      ];
}
