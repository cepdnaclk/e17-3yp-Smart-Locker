import 'package:flutter/material.dart';
import 'widgets/backgroundimage.dart';
import 'widgets/textinput.dart';
import 'widgets/passwordinput.dart';
import 'widgets/submitbutton.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // OnTap handler functions in line 76 and 86 have to implement
    // Following controllers have to implement correctly to functioning of TextInputs and PasswordInputs  
    final myController = TextEditingController();

    final myController1 = TextEditingController();

    final myController2 = TextEditingController();

    final myController3 = TextEditingController();

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
              'SIGN UP',
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
                padding: EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
                child: Column(
                  children: [
                    TextInput(
                      emailController: myController,
                      hint: "User Name",
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextInput(
                      emailController: myController1,
                      hint: "Email",
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    PasswordInput(
                      passwordController: myController2,
                      hint: "Password",
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    PasswordInput(
                      passwordController: myController3,
                      hint: "Confirm Password",
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 450.0, 0.0, 0.0),
              child: SubmitButton(onSubmitHandler: () {},text: "SIGN UP",),
            ),
          ),
          Center(
            child:Container(
              padding: EdgeInsets.fromLTRB(90.0, 530.0, 0.0, 0.0),
              child: Row(
                children: [
                  Text("Already have an account ?", style: TextStyle(fontSize: 15.0, color: Colors.grey.shade600),),
                  SizedBox(width: 6.0),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Log in',
                      style: TextStyle(color: Colors.blue.shade900, fontSize: 15.0),
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
