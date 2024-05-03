import 'package:flutter/material.dart';
import 'package:plantarium/model/plant.dart';

class PlantDetails extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
    final Plant plant = ModalRoute.of(context)?.settings.arguments as Plant;
        return Scaffold(
            appBar: AppBar(
                    title: Text(plant.popularName),
                    centerTitle: true,
                    backgroundColor: Color(0xff115f22),
                ),
            body: Column(
            children: [
                Text("Scientific Name: " + plant.scientificName, style: TextStyle(fontSize: 20)),
                Text("Notes: " + plant.notes, style: TextStyle(fontSize: 16)),
              Text("Watering: " + plant.wateringInterval, style: TextStyle(fontSize: 16)),
            ]
        )
        );
    }
}
