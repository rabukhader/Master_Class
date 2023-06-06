import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_class/Controllers/question_paper/data_upload.dart';
import 'package:master_class/firebase_ref/loading_status.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);

  final DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(
            controller.loadingStatus.value == LoadingStatus.completed
                ? "Uploading Completed"
                : "Uploading...")),
      ),
    );
  }
}
