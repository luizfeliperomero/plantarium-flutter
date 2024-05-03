import 'dart:convert';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class CameraService {
  static Future pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnedImage == null) {
      return;
    }
    Uint8List imageBytes = await returnedImage.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  static Future pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if(returnedImage == null) {
      return;
    }
    Uint8List imageBytes = await returnedImage.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }
}