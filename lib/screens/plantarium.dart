import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:plantarium/screens/create_garden.dart';
import 'package:plantarium/screens/garden.dart';
import 'package:plantarium/screens/garden_selection.dart';
import 'package:plantarium/screens/welcome.dart';
import 'package:plantarium/screens/signin.dart';
import 'package:plantarium/screens/signup.dart';
import 'package:plantarium/screens/plant_details.dart';
import 'package:plantarium/screens/create_plant_form.dart';

class Plantarium extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Welcome(),
            builder: EasyLoading.init(),
            routes: {
                '/welcome': (context) => Welcome(),
                '/signin': (context) => SignIn(),
                '/signup': (context) => SignUp(),
                '/home': (context) => GardenScreen(),
                '/plant_details': (context) => PlantDetails(),
                '/create_plant_form': (context) => CreatePlantForm(),
              '/create_garden': (context) => CreateGarden(),
              '/garden_selection': (context) => GardenSelection(),
            }
        );
    }
}
