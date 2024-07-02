import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (!controller.isInitialized.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.deepArController.value == null) {
          return const Center(child: Text('Failed to initialize DeepAR'));
        }
        return DeepArPreview(controller.deepArController.value!);
      }),
    );
  }
}
