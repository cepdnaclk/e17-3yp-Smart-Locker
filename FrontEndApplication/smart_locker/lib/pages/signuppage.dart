import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:smart_locker/models/UserModel.dart';
import 'package:smart_locker/service/dataservice.dart';
import 'package:smart_locker/widgets/emailfieldinput.dart';
import 'package:smart_locker/widgets/nofieldinput.dart';
import 'package:smart_locker/widgets/textfieldinput.dart';
import '../widgets/backgroundimage.dart';
import '../widgets/passwordinput.dart';
import '../widgets/submitbutton.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // OnTap handler functions in line 76 and 86 have to implement
  // Following controllers have to implement correctly to functioning of TextInputs and PasswordInputs
  final UserNameController = TextEditingController();
  final EmailController = TextEditingController();
  final NumberController = TextEditingController();
  final PasswordController = TextEditingController();
  final ConfirmPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<http.Response> signup(
      String username, String email, String password, String number) async {
    final String apiUrl = DataService.ip + "/api/users";

    Map<String, String> data = {
      "username": username,
      "email": email,
      "password": password,
      "mobile": number
    };

    final body = json.encode(data);

    final response = await http.post(Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"}, body: body);

    return response;
  }

  UserModel user = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundImage(
            image: 'assets/Sign-upbg.png',
          ),
          SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Center(
              child: Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.only(top: 220),
                  child: Column(
                    children: [
                      TextFieldInput(
                        emailController: UserNameController,
                        hint: "User Name",
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      EmailFieldInput(
                        emailController: EmailController,
                        hint: "Email",
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      NoFieldInput(
                        emailController: NumberController,
                        hint: "Number",
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      PasswordInput(
                        passwordController: PasswordController,
                        hint: "Password",
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      PasswordInput(
                        passwordController: ConfirmPasswordController,
                        hint: "Confirm Password",
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0.0, 23.0, 0.0, 0.0),
                          child: SubmitButton(
                            onSubmitHandler: () async {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              final String username = UserNameController.text;
                              final String email = EmailController.text;
                              final String password = PasswordController.text;
                              final String confirmpassword =
                                  ConfirmPasswordController.text;
                              final String number = NumberController.text;

                              if (password == confirmpassword) {
                                final http.Response response = await signup(
                                    username, email, password, number);

                                print(response.statusCode);
                                if (response.statusCode == 200) {
                                  DataService.jwt =
                                      response.headers["x-auth-token"]!;
                                  print(DataService.jwt);
                                  var r = json.decode(response.body);
                                  setState(() {
                                    DataService.user = UserModel.fromJson(r);
                                  });

                                  Navigator.pushNamed(
                                    context,
                                    '/home0',
                                  );
                                }
                              }
                            },
                            text: "SIGN UP",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(90.0, 600.0, 0.0, 0.0),
              child: Row(
                children: [
                  Text(
                    "Already have an account ?",
                    style:
                        TextStyle(fontSize: 15.0, color: Colors.grey.shade600),
                  ),
                  SizedBox(width: 6.0),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/login',
                      );
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          color: Colors.blue.shade900, fontSize: 15.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
