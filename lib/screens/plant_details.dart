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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plant.scientificName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Scientific Name",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Text(
              plant.notes,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Notes",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.water_drop, color: Colors.blue),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    plant.wateringInterval,
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "Watering Interval",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
