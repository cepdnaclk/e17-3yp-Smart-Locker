import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smart_locker/models/UserModel.dart';
import 'package:smart_locker/service/dataservice.dart';
import 'package:smart_locker/widgets/alertdialog.dart';
import 'package:smart_locker/widgets/backgroundimage.dart';
import 'package:smart_locker/widgets/emailfieldinput.dart';
import 'package:smart_locker/widgets/passwordinput.dart';
import 'package:smart_locker/widgets/submitbutton.dart';
import 'package:smart_locker/widgets/textfieldinput.dart';
import 'package:smart_locker/widgets/textinput.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final EmailController = TextEditingController();

  final PasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validate = false;

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
              child: Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.only(top: 300),
                  child: Column(
                    children: [
                      EmailFieldInput(
                        emailController: EmailController,
                        hint: "Email",
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      PasswordInput(
                          passwordController: PasswordController,
                          hint: "Password"),
                      SizedBox(
                        height: 30,
                      ),
                      SubmitButton(
                          onSubmitHandler: () async {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            final String email = EmailController.text;
                            final String password = PasswordController.text;

                            try {
                              print(email);
                              final http.Response response =
                                  await login(email, password)
                                      .timeout(Duration(seconds: 3));
                              print("responce code:" +
                                  response.statusCode.toString());
                              if (response.statusCode == 200) {
                                DataService.jwt =
                                    response.headers["x-auth-token"]!;
                                var r = json.decode(response.body);
                                setState(() {
                                  DataService.user = UserModel.fromJson(r);
                                });
                                //print(DataService.user.userData!.UserEmail);
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/home0',
                                );
                              } else if (response.statusCode == 400) {
                                alertDialog(
                                  context: context,
                                  title: "Invalid Email Or Password",
                                  alertType: AlertType.info,
                                );
                              } else if (response.statusCode == 500) {
                                alertDialog(
                                  context: context,
                                  title: "Service Failure",
                                  alertType: AlertType.error,
                                );
                              } else if (response.statusCode == 429) {
                                alertDialog(
                                  context: context,
                                  title: "Too Many Attempts, Try Again Later",
                                  alertType: AlertType.error,
                                );
                              } else {
                                alertDialog(
                                  context: context,
                                  title: "Connection Error",
                                  alertType: AlertType.error,
                                );
                              }
                            } on TimeoutException catch (_) {
                              alertDialog(
                                context: context,
                                title: "Check Your Connection",
                                alertType: AlertType.error,
                              );
                            } on SocketException catch (_) {
                              alertDialog(
                                context: context,
                                title: "Connection Error",
                                alertType: AlertType.warning,
                              );
                            }
                          },
                          text: "LOG IN"),
                    ],
                  ),
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
                    Navigator.pushReplacementNamed(
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
