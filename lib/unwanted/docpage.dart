// import 'package:flutter/material.dart';

// class DoctorPage extends StatelessWidget {
//   final String doctorImagePath;
//   final String rating;
//   final String doctorName;
//   final String doctorProfession;
//   final VoidCallback ontap;

//   const DoctorPage({
//     super.key,
//     required this.doctorImagePath,
//     required this.rating,
//     required this.doctorName,
//     required this.doctorProfession,
//     required this.ontap,
//   });
//   @override
//   Widget build(BuildContext context) {
//     double containerWidth = MediaQuery.of(context).size.width * 0.5;
//     double containerHeight = MediaQuery.of(context).size.height * 0.4;
//     return InkWell(
//       onTap: () {},
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 50.0, left: 20),
//         child: Container(
//           width: containerWidth,
//           height: containerHeight,
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 255, 255, 255),
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all()),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               //picture of doctor

//               //doctor name
//               Text(
//                 doctorName,
//                 style:
//                     const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),

//               //doctor title
//               // Text(doctorProfession)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
