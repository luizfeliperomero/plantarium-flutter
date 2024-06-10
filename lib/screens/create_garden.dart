import 'package:flutter/material.dart';
import 'package:plantarium/model/garden.dart';
import 'package:plantarium/service/garden_service.dart';
import 'package:plantarium/service/route_guard_service.dart';

class CreateGarden extends StatelessWidget {
  TextEditingController _gardenNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create Garden'),
        backgroundColor: Color(0xff115f22),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Choose the name of your garden',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _gardenNameController,
                decoration: InputDecoration(
                  labelText: 'Garden Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  String gardenName = _gardenNameController.text;
                  Garden garden = Garden(gardenName, 1);
                  GardenService().saveGarden(garden);
                  RouteGuardService.navigate(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: Text('Confirm', style: TextStyle(fontSize: 18.0)),
                ),
                style: ElevatedButton.styleFrom(
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'You will be able to add more gardens later',
                style: TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}