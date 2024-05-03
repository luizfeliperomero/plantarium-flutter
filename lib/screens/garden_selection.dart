import 'package:flutter/material.dart';
import 'package:plantarium/model/garden.dart';
import 'package:plantarium/sql_helper.dart';


// Garden screen widget
class GardenSelection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<Garden> gardens = ModalRoute.of(context)!.settings.arguments as List<Garden>;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Select Garden"),
        backgroundColor: Color(0xff115f22),
      ),
      body: Center(
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: gardens.map((garden) {
            return GardenBox(garden: garden);
          }).toList(),
        ),
      ),
    );
  }
}

// Garden box widget
class GardenBox extends StatelessWidget {
  final Garden garden;

  GardenBox({required this.garden});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: () {
          SQLHelper.deleteTable("garden");
          SQLHelper.createGarden(garden);
          Navigator.of(context).pushNamed("/home", arguments: garden);
        },
        child: Center(
          child: Text(
            garden.gardenName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
