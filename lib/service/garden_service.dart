import 'dart:io';

import 'package:plantarium/model/garden.dart';
import "package:http/http.dart" as http;
import 'package:plantarium/sql_helper.dart';

import '../environment/environment.dart';
import '../model/user.dart';

class GardenService {
  var url = Uri.http("${api}", "api/v1/garden/save");
  void saveGarden(Garden garden) async {
    User user = await SQLHelper.getUser();
    try {
      await http.post(url, body: {
        "gardenName": garden.gardenName,
        "gardenAddress": "",
        "gardenLatitude": "",
        "gardenLongitude": "",
        "gardenProfilePhotoUrl": "",
        "userId": user.userId.toString(),
      }, headers: {
        "Authorization": "Bearer " + user.token,
      }
      );
    } catch(err) {
      print(err);
    }
  }
}