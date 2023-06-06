import 'package:get/get.dart';
import 'package:master_class/Controllers/question_paper/question_paper_controller.dart';
import 'package:master_class/Screens/home/homeScreen.dart';
import 'package:master_class/Screens/introduction/introduction.dart';
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
            })),
      ];
}
