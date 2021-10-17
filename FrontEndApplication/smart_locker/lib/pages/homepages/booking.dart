// import 'package:flutter/material.dart';
// import 'package:smart_locker/widgets/datainput.dart';

// import 'package:smart_locker/widgets/submitbutton.dart';
// import 'package:smart_locker/widgets/durationpicker.dart';

// class BookingPage extends StatefulWidget {
//   const BookingPage({Key? key}) : super(key: key);
//   @override
//   _BookingPageState createState() => _BookingPageState();
// }

// class _BookingPageState extends State<BookingPage> {
//   final idController = TextEditingController();
//   final durationPicker = DurationPicker();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(20),
//           ),
//         ),
//         elevation: 8,
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: Text(
//           'Booking',
//           style: TextStyle(fontSize: 22, color: Colors.black87),
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Form(
//             child: Column(
//               children: [
//                 Text(
//                   "Enter Locker ID",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 DataInput(
//                   dataController: idController,
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   "Select The Time Duration",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 durationPicker,
//                 SizedBox(
//                   height: 30,
//                 ),
//                 SubmitButton(onSubmitHandler: () {}, text: "Submit"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
