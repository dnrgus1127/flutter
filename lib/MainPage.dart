//ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pest/camera2.dart';
import 'package:flutter_pest/dictionaryPage.dart';
import 'pestItem.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
//import 'package:tflite/tflite.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  File? _image;
  final picker = ImagePicker();
  List? _outputs;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Main Page"),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _image == null
                  ? Image.asset(
                      "repo/images/4.png",
                    )
                  : Image.file(
                      File(_image!.path),
                      width: 200,
                      height: 200,
                    ),
              const SizedBox(
                height: 50,
              ),
              CupertinoButton(
                onPressed: () {
                  setState(() async {
                    await getImage(ImageSource.camera);
                    //recycleDialog();
                  });
                },
                color: Colors.blueGrey,
                child: Text('Camera'),
              ),
              const SizedBox(
                height: 30,
              ),
              CupertinoButton(
                child: Text("Gallary"),
                color: Colors.blueGrey,
                onPressed: () {
                  setState(() async{
                    await getImage(ImageSource.gallery);
                    //recycleDialog();
                  });
                },
              )
            ],
          ),
        ));
  }

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path); // ????????? ???????????? _image??? ??????
    });
  }

  // loadModel() async {
  //   await Tflite.loadModel(
  //           model: "assets/pest_model.tflite", labels: "assets/label.txt")
  //       .then((value) {
  //     setState(() {});
  //   });
  // }

  // Future classifyImage(File image) async {
  //   print("?????? $image");
  //   var output = await Tflite.runModelOnImage(
  //       path: image.path, // required
  //       imageMean: 0.0, // defaults to 117.0
  //       imageStd: 255.0, // defaults to 1.0
  //       numResults: 2, // defaults to 5
  //       threshold: 0.2, // defaults to 0.1
  //       asynch: true // defaults to true
  //       );
  //   setState(() {
  //     _outputs = output;
  //   });
  // }

  // recycleDialog() {
  //   _outputs != null
  //       ? showDialog(
  //           context: context,
  //           barrierDismissible:
  //               false, // barrierDismissible - Dialog??? ????????? ?????? ?????? ?????? x
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               // RoundedRectangleBorder - Dialog ?????? ????????? ????????? ??????
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(10.0)),
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: <Widget>[
  //                   Text(
  //                     _outputs![0]['label'].toString().toUpperCase(),
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 15.0,
  //                       background: Paint()..color = Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               actions: <Widget>[
  //                 Center(
  //                   child: new FlatButton(
  //                     child: new Text("Ok"),
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                   ),
  //                 )
  //               ],
  //             );
  //           })
  //       : showDialog(
  //           context: context,
  //           barrierDismissible: false,
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: <Widget>[
  //                   Text(
  //                     "???????????? ????????? ????????? ????????? ?????????.",
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 15.0,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               actions: <Widget>[
  //                 Center(
  //                   child: new FlatButton(
  //                     child: new Text("Ok"),
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                   ),
  //                 )
  //               ],
  //             );
  //           });
  // }
  // @override
  // void dispose(){
  //   Tflite.close();
  //   super.dispose();
  // }
}
