//TODO: Samandar camera page;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

import '../../../../main.dart';
import '../../../common/constants/app_icons.dart';
import '../../../common/constants/app_pictures.dart';
import '../widget/camera_dialog.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController cameraController;
  bool screenCamera = true;
  int direction = 0;
  bool isClicked = true;
  late TorchController controller;

  @override
  void initState(){
    super.initState();
    controller = TorchController();
    startCamera(0);
  }

  void startCamera(int direction) async {
    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void closeButton() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
        body: Stack(
          children: [
            CameraPreview(cameraController),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: closeButton,
                    icon: const Icon(
                      size: 30,
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed:() {
                          controller.toggle();
                          setState(() {});
                        },
                    icon: const Image(
                      image: AssetImage(AppIcons.icLightning),
                      height: 25,
                      width: 25,
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(AppPictures.camera),
                width: 251,
                height: 251,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 160,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: Image(
                          image: AssetImage(AppIcons.icFrame),
                          fit: BoxFit.fill,
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(
                          () {
                            screenCamera = !screenCamera;
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return CameraDialog(
                                  screenCamera: screenCamera,
                                );
                              },
                            );
                          },
                        ),
                        child: const SizedBox(
                          width: 72,
                          height: 72,
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFFFC0B8),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFFF8473),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            direction = direction == 0 ?  1 : 0;
                            startCamera(direction);
                          });
                        },
                        child: const SizedBox(
                          width: 40,
                          height: 40,
                          child: Image(
                            image: AssetImage(AppIcons.icRefresh),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
