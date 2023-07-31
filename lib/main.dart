import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

import 'src/common/widget/app.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  TorchController().initialize();
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(const MyApp());
}
