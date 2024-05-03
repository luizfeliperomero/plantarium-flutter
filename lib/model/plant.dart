import 'dart:convert';

class Plant {
   String? lastWatered;
   String popularName;
   String scientificName;
   String notes;
   String wateringInterval;
   final int? plantId;
   int? gardenId;

   Plant(
       this.popularName,
       this.scientificName,
       this.wateringInterval,
       this.notes,
       [
       this.lastWatered,
       this.gardenId,
       this.plantId,
       ]
    );

    String formatDateTime(DateTime dateTime) {
        var day = dateTime.day;
        var month = dateTime.month;
        var year = dateTime.year;
        var hour = dateTime.hour;
        var minute = dateTime.minute;

        return "$day/$month/$year $hour:$minute";
    }

    String toString() {
      return "{popular_name: $popularName, scientific_name: $scientificName, garden_id: $gardenId}";
    }

   factory Plant.fromJson(Map<String, dynamic> json) {
      Map<String, dynamic>? plantJson = jsonDecode(json['plant']);
      if(plantJson != null) {
        return Plant(
          plantJson['popular_name'] as String ?? '',
          plantJson['scientific_name'] as String ?? '',
          plantJson['watering'] as String ?? '',
          plantJson['care'] ?? plantJson['notes'] as String ?? '',
          plantJson['last_watered'] as String ?? '',
          plantJson['garden_id'] as int ?? 0,
          plantJson['plant_id'] as int ?? 0,
        );
      } else throw Exception("Error parsing 'plant' object from JSON.");
   }
}
