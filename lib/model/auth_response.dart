import 'package:plantarium/model/user.dart';

class AuthResponse {
  String token;
  User user;

  AuthResponse(this.token, this.user);
}