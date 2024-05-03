import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:plantarium/model/plant.dart';
import 'package:plantarium/service/camera_service.dart';
import 'package:plantarium/service/plant_detection_service.dart';
import 'package:plantarium/service/plant_service.dart';
import 'package:plantarium/sql_helper.dart';
import 'package:plantarium/model/garden.dart';
import 'package:plantarium/widgets/plant_card.dart';
import 'dart:convert';

class GardenScreen extends StatefulWidget {
    @override
    State<GardenScreen> createState() {
        return GardenState();
    }
}

class GardenState extends State<GardenScreen>{
  PlantDetectionService plantDetectionService = PlantDetectionService();
  PlantService plantService = PlantService();
  List<Map<String, dynamic>> _plants = [];

    void _refreshPlants() async {
      List<Plant> plants = await plantService.findAll();
        setState(() {
          _plants = plants.map((plant) => {
            'scientific_name': plant.scientificName,
            'popular_name': plant.popularName,
            'plant_notes': plant.notes,
            'plant_id': plant.plantId.toString(),
            'garden_id': plant.gardenId.toString(),
            'watering_interval': plant.wateringInterval,
            'last_watered': plant.lastWatered,
          }).toList();
        });
    }

    @override
    void initState() {
        super.initState();
        _refreshPlants();
    }

    @override
    Widget build(BuildContext context) {
        final Garden garden = ModalRoute.of(context)!.settings.arguments as Garden;
        return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Text(garden.gardenName),
                backgroundColor: Color(0xff115f22),
            ),
            body: Scrollbar(
                child: ListView.separated(
                    padding: EdgeInsets.all(5),
                    itemCount: _plants.length,
                    itemBuilder: (context, index) {
                        return PlantCard(Plant(
                          _plants[index]['popular_name'],
                          _plants[index]['scientific_name'],
                          _plants[index]['watering_interval'],
                          _plants[index]['plant_notes'],
                          _plants[index]['last_watered'],
                          int.parse(_plants[index]['plant_id']),
                          int.parse(_plants[index]['garden_id']),
                          ));
                    },
                    separatorBuilder: (context, index) => Divider(),
                )
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                onPressed: (){
                  CameraService.pickImageFromGallery().then((value)  {
                    EasyLoading.show(status: "Detecting your plant");
                    plantDetectionService.get_data(value).then((value)
                    {
                      Map<String, dynamic> parsedJson = jsonDecode(value);
                      Plant plant = Plant.fromJson(parsedJson);
                      plant.gardenId = garden.gardenId;
                      plantService.save(plant);
                      EasyLoading.dismiss();
                    });
                  });
                },
                child: Icon(Icons.camera_alt),
                backgroundColor: Color(0xff115f22),
            ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: (){
                    CameraService.pickImageFromCamera().then((value) => {
                      plantDetectionService.get_data(value)
                    });
                  },
                  child: const Icon(Icons.add),
                  backgroundColor: Color(0xff115f22),
                ),
        ]));
    }
}
