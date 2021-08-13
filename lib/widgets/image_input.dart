import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {

  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  // ignore: avoid_init_to_null
  late XFile? _storedImage = null;

  Future<void> _takePicture() async{
    final imagePicker = ImagePicker();
    final XFile? imageFile = (await imagePicker.pickImage(source: ImageSource.camera,));
    setState(() {
      _storedImage = imageFile;
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile!.path);
    final savedImage = await imageFile.saveTo("$appDir/$fileName");
    widget.onSelectImage(savedImage);

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          padding: EdgeInsets.all(8.0),
          // ignore: unrelated_type_equality_checks
          child: _storedImage != null ? Image.file(File(_storedImage!.path),fit: BoxFit.cover,width: double.infinity,) : Text("No image taken"),
          // child: Center(
          //     child: Text(
          //   "No image taken",
          // )),
          alignment: Alignment.center,
        ),
        Expanded(
            child: TextButton.icon(
          onPressed: _takePicture,
          icon: Icon(Icons.camera),
          label: Text(
            "Take Picture",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ))
      ],
    );
  }
}
