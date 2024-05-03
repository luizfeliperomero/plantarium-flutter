import 'package:flutter/material.dart';
import 'package:plantarium/model/plant.dart';
import 'package:plantarium/widgets/background_img.dart';
import 'package:plantarium/screens/plant_details.dart';

class PlantCard extends StatelessWidget {
    Plant plant;
    PlantCard(this.plant);


    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: () => {
                Navigator.pushNamed(context, '/plant_details', arguments: this.plant)
            },
            child: Container(
            child: Column(
                children: [
                    Text(plant.popularName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                    Container(
                        height: 100,
                        color: Colors.purple,
                        child: BackgroundImage("images/welcome.png"),
                    ),
                ]
            )
        )
        );
    }
}
