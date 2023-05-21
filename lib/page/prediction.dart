import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Predict extends StatefulWidget {
  const Predict({super.key});

  @override
  State<Predict> createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  bool _loading = true;
  late File _image;
  late List _output;
  final picker = ImagePicker();
  String _confidence = '';
  var predictText = '';
  var confidence = '';
  bool showText = true;
  bool showImage = true;
  bool hideText = false;

  @override
  void initState() {
    //initS is the first function that is executed by default when this class is called
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    //dis function disposes and clears our memory
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    //this function runs the model on the image
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults:
          2, //the amout of categories our neural network can predict (here no. of animals)
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output!;
      _loading = false;

      if (_output[0]['label'] == 'Healthy') {
        setState(() {
          predictText = 'โอกาศไม่เป็นโรค';
        });
      } else if (_output[0]['label'] == 'Unhealthy') {
        setState(() {
          predictText = 'โอกาศเป็นโรค';
        });
      } else {
        setState(() {
          predictText = 'คำทำนายที่ไม่รู้จัก';
        });
      }

      // ignore: unnecessary_null_comparison
      _confidence = _output != null
          ? (_output[0]['confidence'] * 100.0).toString().substring(0, 2)
          : "";
    });
  }

  loadModel() async {
    //this function loads our model
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }

  pickImage() async {
    //this function to grab the image from camera
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
      showText = false;
      showImage = false;
      hideText = true;
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    //this function to grab the image from gallery
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
      showText = false;
      showImage = false;
      hideText = true;
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Scan Rice',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Center(
            child: Container(
              height: 550,
              width: 400,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                      visible: showText,
                      child: const Text(
                        'เลือกรูปภาพของคุณ \n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Visibility(
                      visible: hideText,
                      child: const Text(
                        'คำทำนาย \n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Visibility(
                    visible: showImage,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/camera.png',
                          height: 100,
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                  Center(
                    //predict
                    child: _loading == true
                        ? null //show nothing if no picture selected
                        : Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.width * 0.5,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),

                              // ignore: unnecessary_null_comparison
                              _loading == false
                                  ? Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(30),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color:
                                                _output[0]['label'] == 'Healthy'
                                                    ? Colors.green[700]
                                                    : Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            "$predictText $_confidence เปอร์เซ็น",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                  ),

                  //predict
                  Column(
                    //image picker
                    children: [
                      GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 200,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            'Take A Photo',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: pickGalleryImage,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 200,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 17),
                          decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            'Pick From Gallery',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ), //image picker
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
