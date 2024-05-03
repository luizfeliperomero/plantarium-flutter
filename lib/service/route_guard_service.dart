import 'package:flutter/widgets.dart';
import "package:http/http.dart" as http;
import "package:plantarium/environment/environment.dart";
import 'package:plantarium/model/garden.dart';
import 'package:plantarium/model/user.dart';
import 'package:plantarium/sql_helper.dart';
import "dart:convert";

class RouteGuardService {

  void getUserGardenCount() async {

  }

  static void navigate(context) async {
    User user = await SQLHelper.getUser();
    int userGardens = 0;
    var url = Uri.http("${api}", "api/v1/garden/findAllByUserId/" + user.userId.toString());
    List<Garden> gardens;
    try {
      var response = await http.get(url, headers: {
        "Authorization": "Bearer " + user.token,
      });
      List<dynamic> gardenData = json.decode(response.body);
      gardens = gardenData.map((data) => Garden.fromJson(data)).toList();
      userGardens = gardens.length;
      if(userGardens == 0) {
        Navigator.of(context).pushNamed("/create_garden");
      } else if(userGardens == 1){
        Navigator.of(context).pushNamed("/home");
      } else {
        Navigator.of(context).pushNamed("/garden_selection", arguments: gardens);
      }
    } catch(err){
      print(err);
    }
  }
}