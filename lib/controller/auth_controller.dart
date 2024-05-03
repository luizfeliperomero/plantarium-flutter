import "package:http/http.dart" as http;
import "package:plantarium/environment/environment.dart";
import "package:plantarium/model/auth_response.dart";
import "dart:convert";
import "dart:developer";

import "package:plantarium/model/user.dart";
import "package:plantarium/sql_helper.dart";

import "../service/route_guard_service.dart";

var url = Uri.http("${api}", "api/v1/auth/authenticate");

auth(email, password, context) async {
    try {
    var response = await http.post(url, body: {
        "email": email,
        "password": password
    });
    dynamic responseBody = json.decode(response.body);
    String token = responseBody['token'];
    Map<String, dynamic> userData = responseBody['user'];
    User user = User(userData['firstName'],
        userData['lastName'],
        userData['email'],
        userData['createdWithGoogle'],
        "",
        userData['password'],
        userData['phoneNumber'],
        userData['alreadyAddedGarden'],
        userData['id'],
    );
    SQLHelper.deleteTable("user_");
    SQLHelper.createUser(user, token);
    RouteGuardService.navigate(context);
    } catch(err) {
        print(err);
    }
}