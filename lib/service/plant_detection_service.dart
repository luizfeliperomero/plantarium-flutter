import "dart:convert";

import "package:http/http.dart" as http;

class PlantDetectionService {
  var url = Uri.http("192.168.1.107:5000", "/detect_plant");

  Future get_data(String base64Image) async {
    try {
      final response = await http.post(url, body: {
       "image" : base64Image
      });
      return response.body;
    } catch(err) {
      print(err);
    }
  }

}
