import 'package:http/http.dart' as http;
import 'package:smart_locker/models/user.dart';

Future<User?> loginUser(String email, String password) async {
  final String apiUrl = "54.164.226.181:3000/api/login";

  final response = await http
      .post(Uri.parse(apiUrl), body: {"email": email, "password": password});

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return userFromJson(responseString);
  } else {
    return null;
  }
}
