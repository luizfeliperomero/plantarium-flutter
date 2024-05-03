import 'package:flutter/material.dart';
import 'package:plantarium/sql_helper.dart';
import 'package:plantarium/model/plant.dart';
import 'package:intl/intl.dart';

class CreatePlantForm extends StatefulWidget {
    @override
    State<CreatePlantForm> createState() {
        return CreatePlantFormState();
    }
}

class CreatePlantFormState extends State<CreatePlantForm> {
    TextEditingController nameTEC = TextEditingController();
    TextEditingController waterEveryTEC = TextEditingController();
    TextEditingController volumeTEC = TextEditingController();
    TextEditingController lastWateredTEC = TextEditingController();
    TextEditingController notesTEC = TextEditingController();
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Add Plant"),
                centerTitle: true,
                backgroundColor: Color(0xff115f22),
            ),
            body: Center(
                child: Column(
                children: [
                    SizedBox(
                        child: Column(
                            children: [
                                Text("Name"),
                                TextField(
                                controller: nameTEC,
                                decoration: InputDecoration(
                                    labelText: "Name",
                                    border: OutlineInputBorder(),
                                )
                            )]
                        )
                    ),
                    SizedBox(
                        child: Column(
                            children: [
                                Text("Water every"),
                                TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                ))]
                        )
                    ),
                    SizedBox(
                        child: Column(
                            children: [
                                Text("Volume (ml)"),
                                TextField(
                                controller: volumeTEC,
                                decoration: InputDecoration(
                                    labelText: "Volume (ml)",
                                    border: OutlineInputBorder(),
                                )
                            )]
                        )
                    ),
                    SizedBox(
                        child: Column(
                            children: [
                                Text("Last watered"),
                                TextField(
                                decoration: InputDecoration(
                                    labelText: "Last watered",
                                    border: OutlineInputBorder(),
                                )
                            )]
                        )
                    ),
                    SizedBox(
                        child: Column(
                            children: [
                                Text("Notes"),
                                TextField(
                                controller: notesTEC,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                )
                            )]
                        )
                    ),
                    ElevatedButton(
                        onPressed: (){ 
                            createPlant();
                            Navigator.of(context).pushNamed("/home");
                        },
                        child: Text("Submit")
                    )
                ]
            ) 
          )
        );
    }

    void createPlant() {
        //Plant plant = Plant();

    }

}
