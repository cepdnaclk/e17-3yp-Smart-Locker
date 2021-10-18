// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:practicing_http/UserModel.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Future<http.Response> login(String email, String password) async {
//     final String apiUrl = 'http://54.164.226.181:3000/api/login';

//     Map<String, String> data = {"email": email, "password": password};

//     final body = json.encode(data);

//     final response = await http.post(Uri.parse(apiUrl),
//         headers: {"Content-Type": "application/json"}, body: body);

//     return response;
//   }
//   UserModel user = UserModel();

//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
  
//     return Scaffold(
//       appBar: AppBar(
        
//         title: Text(widget.title),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: emailController,
//           ),
//           TextField(
//             controller: passwordController,
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final String email = emailController.text;
//           final String password = passwordController.text;
//           print(email);
//           print(password);
//           final http.Response response = await login(email, password);
         
//           if(response.statusCode == 200) {
//             var r = json.decode(response.body);
//             setState(() {
//               user = UserModel.fromJson(r);
//             });
//             print(user.userData!.UserEmail);
//           }
         
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }