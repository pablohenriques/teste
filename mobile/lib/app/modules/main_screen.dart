import 'package:ceulp.exitus/app/shared/widgets/custom_media_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'detailscreen/detail_screen.dart';

class PublishPage extends StatefulWidget {
  @override
  _PublishPageState createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> {
  List<Asset> images = <Asset>[];
  final picker = ImagePicker();

  Future<void> resourceCallback(ResultType resultType, resourceData) async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailPage(resultType, resourceData)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Nova Publicação",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomMediaPicker(
                      pickerType: PickerType.IMAGE,
                      pickSource: PickSource.CHOOSE,
                      resourceCallback: resourceCallback,
                      childWidget: Image.asset(
                        'assets/images/ic_img.png',
                        height: screenHeight * 0.25,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Publicar foto',
                      style:
                          TextStyle(fontSize: 20.0, color: Color(0xff00AFF0)),
                    ),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                      child: const Text(
                        'Selecionar foto da câmera ou galeria',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Text("OU"),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomMediaPicker(
                    pickerType: PickerType.VIDEO,
                    pickSource: PickSource.CHOOSE,
                    resourceCallback: resourceCallback,
                    childWidget: Image.asset(
                      'assets/images/ic_video.png',
                      height: screenHeight * 0.25,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Publicar vídeo',
                    style: TextStyle(fontSize: 20.0, color: Color(0xff00AFF0)),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                    child: const Text(
                      'Selecinar vídeo da câmera ou galeria',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
