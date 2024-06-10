import 'dart:developer';

import 'package:plantarium/model/garden.dart';
import 'package:plantarium/model/plant.dart';
import "package:http/http.dart" as http;
import '../environment/environment.dart';
import '../model/user.dart';
import '../sql_helper.dart';
import 'dart:convert';

class PlantService {
  var url = Uri.http("${api}", "api/v1/plant/save");

  void save(Plant plant) async {
    log("IN PLANT SERVICE");
    try {
      User user = await SQLHelper.getUser();
      await http.post(url, body: {
        "notes": plant.notes,
        "gardenId": plant.gardenId.toString(),
        "wateringInterval": plant.wateringInterval,
        "popularName": plant.popularName,
        "scientificName": plant.scientificName
      }, headers: {
        "Authorization": "Bearer " + user.token,
      });
    } catch(err) {
      print(err);
    }
  }

  Future<List<Plant>> findAll() async {
    User user = await SQLHelper.getUser();
    Garden garden = await SQLHelper.getGarden();
    var gardenId = garden.gardenId;
    var findAllUrl = Uri.http("${api}", "api/v1/plant/findAll/$gardenId");
    List<Plant> plants = List.empty();
   try {
     var response = await http.get(findAllUrl, headers: {
       "Authorization": "Bearer " + user.token,
     });

     List<dynamic> plantData = json.decode(response.body);
     plants = plantData.map((data) {
       Map<String, dynamic> plantJson = data;
       return Plant(
         plantJson['popular_name'] as String? ?? '',
         plantJson['scientific_name'] as String? ?? '',
         plantJson['watering'] as String? ?? '',
         plantJson['notes'] as String? ?? '',
         plantJson['last_watered'] as String? ?? '',
         plantJson['garden_id'] as int? ?? 0,
         plantJson['id'] as int? ?? 0,
       );
     }).toList();
   } catch(err) {
     print(err);
   }
   return plants;
  }

}