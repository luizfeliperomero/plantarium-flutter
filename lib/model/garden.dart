class Garden {
   int? gardenId;
   String gardenName;
   String? gardenAddress;
   String? gardenLatitude;
   String? gardenLongitude;
   String? garden_profile_photo_url;
   int userId;

   Garden(
       this.gardenName,
       this.userId,
       [
           this.gardenId,
           this.gardenLatitude,
           this.gardenLongitude,
           this.gardenAddress,
           this.garden_profile_photo_url,
       ]
    );

   factory Garden.fromJson(Map<String, dynamic> json) {
     return Garden(
       json['gardenName'] as String,
       json['userId'] as int,
       json['gardenId'] as int,
       // Initialize other properties here if needed
     );
   }

}
