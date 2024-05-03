import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:plantarium/model/user.dart';
import 'package:plantarium/model/garden.dart';
import 'package:plantarium/model/plant.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
    static const gardenTable = """
        CREATE TABLE garden (
        garden_id int,
        garden_name varchar(20),
        garden_address varchar(100),
        garden_latitude varchar(100),
        garden_longitude varchar(100),
        garden_profile_photo_url varchar(100),
        user_id int
        );
    """;
    static const userTable = """
        CREATE TABLE user_ (
            user_id int,
            first_name varchar(20),
            last_name varchar(50),
            phone_number varchar(30),
            email varchar(50),
            password_ varchar(100),
            already_added_garden boolean,
            created_with_google boolean,
            token varchar(3000)
        );
    """;
    static Future<void> createTables(sql.Database database) async {
        await database.execute(userTable);
        await database.execute(gardenTable);
    }

    static Future<sql.Database> db() async {
        return sql.openDatabase(
            'plantarium3.db',
            version: 13,
            onCreate: (sql.Database database, int version) async {
                await createTables(database);
            },
        );
    }

    static Future<int> createUser(User user, String token) async {
        final db = await SQLHelper.db();
        final data = {
            'user_id': user.userId,
            'first_name': user.firstName,
            'last_name': user.lastName,
            'phone_number': user.phoneNumber,
            'email': user.email,
            'password_': user.password_,
            'already_added_garden': user.alreadyAddedGarden,
            'created_with_google': user.createdWithGoogle,
            'token': token
        };
        return await db.insert('user_', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    }

    static Future<int> createGarden(Garden garden) async {
        final db = await SQLHelper.db();
        final data = {
            'garden_id': garden.gardenId,
            'garden_name': garden.gardenName,
            'garden_address': garden.gardenAddress,
            'garden_latitude': garden.gardenLatitude,
            'garden_longitude': garden.gardenLongitude,
            'garden_profile_photo_url': garden.garden_profile_photo_url,
            'user_id': garden.userId,
            };
        return db.insert('garden', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    }

    static Future deleteTable(String tableName) async {
       final db = await SQLHelper.db();
       return db.rawQuery("DELETE FROM $tableName");
    }

    static Future<User> getUser() async {
        final db = await SQLHelper.db();
        List<Map<String, dynamic>> userDataList = await db.query('user_');
        Map<String, dynamic> userMap = userDataList.first;
        bool already_added_garden = userMap['already_added_garden'] == 0 ? false : true;
        bool created_with_google = userMap['created_with_google'] == 0 ? false : true;
        User user_get = User(userMap['first_name'],
            userMap['last_name'],
            userMap['email'],
            created_with_google,
            userMap['token'] ?? "",
            userMap['password'],
            userMap['phone_number'],
            already_added_garden,
            userMap['user_id'],
        );
        return user_get;
    }

    static Future<Garden> getGarden() async {
        final db = await SQLHelper.db();
        List<Map<String, dynamic>> gardenDataList = await db.query('garden');
        Map<String, dynamic> gardenMap = gardenDataList.first;
        Garden garden = Garden(
            gardenMap['garden_name'],
            gardenMap['user_id'],
            gardenMap['garden_id'],
        );
        return garden;
    }
}

