import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    if (controller.cameraController == null ||
        !controller.cameraController!.value.isInitialized) {
      return Container(); // Show a loading indicator or placeholder
    }
    return DeepArPreview(controller.deepArController!);
  }
}
