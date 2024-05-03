import "package:flutter/material.dart";
import "package:plantarium/environment/environment.dart";
import "dart:developer";
import "package:http/http.dart" as http;
import "package:plantarium/model/user.dart";

var url = Uri.http("${api}", "api/v1/auth/register");

class SignUpController extends ChangeNotifier {
    static SignUpController instance = SignUpController();
    bool showTopImg = true;

    setShowTopImg(bool state) {
        showTopImg = state;
        notifyListeners();
    }
    signUp(User user) async {
        try {
            var response = await http.post(url, body: {
                "first_name": user.firstName,
                "last_name": user.lastName,
                "phone_number": user.phoneNumber,
                "email": user.email,
                "password": user.password_,
            });
            //print(jsonDecode(response.body));
            log(response.body);
        } catch(err) {
            print(err);
        }
    }
}

