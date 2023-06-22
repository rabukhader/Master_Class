import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:master_class/Controllers/auth_controller.dart';
<<<<<<< HEAD
import 'package:master_class/Screens/question/questions_screen.dart';
=======
>>>>>>> main
import 'package:master_class/firebase_ref/references.dart';
import 'package:master_class/models/question_paper_model.dart';
import 'package:master_class/services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {
  final allPapersImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = [
      "biology",
      "chemistry",
      "maths",
      "physics",
    ];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);
      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      //  AppLogger.e(e);
    }
  }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
<<<<<<< HEAD
        Get.toNamed(QuestionsScreen.routeName, arguments: paper, preventDuplicates: false);
      } else {
         
        Get.toNamed(QuestionsScreen.routeName, arguments: paper);
=======
        //Get.offNamed()
      } else {
         
        // Get.toNamed()
>>>>>>> main
      }
    } else {
      _authController.showLoginAlertDialogue();
    }
  }
}
