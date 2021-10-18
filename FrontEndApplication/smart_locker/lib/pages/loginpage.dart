import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:smart_locker/models/UserModel.dart';
import 'package:smart_locker/service/dataservice.dart';
import 'package:smart_locker/widgets/backgroundimage.dart';
import 'package:smart_locker/widgets/submitbutton.dart';
import 'package:smart_locker/widgets/textinput.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final EmailController = TextEditingController();

  final PasswordController = TextEditingController();

  Future<http.Response> login(String email, String password) async {
    final String apiUrl = DataService.ip + "/api/login";

    Map<String, String> data = {"email": email, "password": password};

    final body = json.encode(data);

    final response = await http.post(Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"}, body: body);

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundImage(
            image: 'assets/Log-inbg.png',
          ),
          SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 300),
                child: Column(
                  children: [
                    TextInput(emailController: EmailController, hint: "Email"),
                    SizedBox(
                      height: 30,
                    ),
                    TextInput(
                        emailController: PasswordController, hint: "Password"),
                    SizedBox(
                      height: 30,
                    ),
                    SubmitButton(
                        onSubmitHandler: () async {
                          final String email = EmailController.text;
                          final String password = PasswordController.text;
                          final http.Response response =
                              await login(email, password);
                          print(response);
                          if (response.statusCode == 200) {
                            var r = json.decode(response.body);
                            setState(() {
                              DataService.user = UserModel.fromJson(r);
                            });
                            print(DataService.user.userData!.UserEmail);
                            Navigator.pushNamed(
                              context,
                              '/home0',
                            );
                          }
                        },
                        text: "LOG IN")
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(100.0, 540.0, 0.0, 0.0),
            child: Row(
              children: [
                Text(
                  "Don't have an account ?",
                  style: TextStyle(fontSize: 15.0, color: Colors.grey.shade600),
                ),
                SizedBox(width: 6.0),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/signup',
                    );
                  },
                  child: Text(
                    'Sign UP',
                    style:
                        TextStyle(color: Colors.blue.shade900, fontSize: 15.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
