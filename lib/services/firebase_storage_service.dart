import 'package:get/get.dart';
import '../firebase_ref/references.dart';

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child("question_paper_images")
          .child('${imgName.toLowerCase()}.png');
      var imgURL = await urlRef.getDownloadURL();
      return imgURL;
    } catch (e) {
      return null;
    }
  }
}
