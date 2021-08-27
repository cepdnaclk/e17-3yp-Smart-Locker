import 'package:flutter/material.dart';
import 'package:smart_locker/signuppage.dart';
import 'package:smart_locker/widgets/backgroundimage.dart';
import 'package:smart_locker/widgets/submitbutton.dart';
import 'package:smart_locker/widgets/textinput.dart';

class LogInPage extends StatelessWidget {
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundImage(
            image: 'assets/Background.png',
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30.0, 140.0, 0.0, 0.0),
            child: Text(
              'LOG IN',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.black,
              ),
            ),
          ),
          SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0.0, 250.0, 0.0, 0.0),
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
                  ],
                ),
              ),
            ),
          ),
          Center(
            child:Container(
              padding: EdgeInsets.fromLTRB(0.0, 450.0, 0.0, 0.0),
              child: SubmitButton(
                onSubmitHandler: () {},
                text: "LOG IN",
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(71.0, 620.0, 0.0, 0.0),
            child: Row(
              children: [
                Text("Don't have an account ?", style: TextStyle(fontSize: 15.0, color: Colors.grey.shade600),),
                SizedBox(width: 6.0),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.blue.shade900, fontSize: 15.0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
