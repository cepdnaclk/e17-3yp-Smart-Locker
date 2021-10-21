import 'package:flutter/material.dart';
import 'package:smart_locker/pages/loginpage.dart';
import 'package:smart_locker/widgets/backgroundimage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2400), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LogInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(image: "assets/LoadingBackground.png"),
          Center(
              child: SpinKitRipple(
            color: Colors.white,
            size: 50.0,
          )),
        ],
      ),
    );
  }
}
