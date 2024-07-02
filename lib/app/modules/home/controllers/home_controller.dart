import 'package:camera/camera.dart';
import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  CameraController? cameraController;
  DeepArController? deepArController;

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
    _initializeDeepAR();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );
    await cameraController!.initialize();
  }

  Future<void> _initializeDeepAR() async {
    deepArController = DeepArController();
    // Load an AR effect
    await deepArController?.switchEffect('effects/aviators');
  }

  @override
  void dispose() {
    cameraController?.dispose();
    deepArController?.destroy();
    super.dispose();
  }
}
