import 'package:get/get.dart';
import 'package:master_class/services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {
  final allPapersImages = <String>[].obs;

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
      for (var img in imgName) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        allPapersImages.add(imgUrl!);
      }
    } catch (e) {
      print(e);
    }
  }
}
