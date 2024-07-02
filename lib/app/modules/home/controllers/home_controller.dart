import 'package:camera/camera.dart';
import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<CameraController?> cameraController = Rx<CameraController?>(null);
  Rx<DeepArController?> deepArController = Rx<DeepArController?>(null);
  RxBool isInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    await _initializeCamera();
    await _initializeDeepAR();
    isInitialized.value = true;
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.last;
    final controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );
    await controller.initialize();
    cameraController.value = controller;
  }

  Future<void> _initializeDeepAR() async {
    deepArController.value = DeepArController();
    await deepArController.value?.initialize(
      androidLicenseKey:
          "2f30b09a034ef462e537443b98b08af312354971a0982fe3ba66b26a2dfcfef596095db914277741",
      iosLicenseKey: "---iOS key---",
      resolution: Resolution.high,
    );
    // Load an AR effect
    await deepArController.value?.switchEffect('assets/effects/burning_effect');
  }

  @override
  void dispose() {
    cameraController.value?.dispose();
    deepArController.value?.destroy();
    super.dispose();
  }
}
