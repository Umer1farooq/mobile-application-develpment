// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Widget Tree')),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
//                       Container(
//                         width: 40.0,
//                         height: 40.0,
//                         color: Colors.yellow,
//                       ),
//                       Padding(padding: EdgeInsets.all(16.0)),
//                       Expanded(
//                         child: Container(
//                           width: 40.0,
//                           height: 40.0,
//                           color: Colors.brown,
//                         ),
//                       ),
//                       Padding(padding: EdgeInsets.all(16.0)),
//                       Container(
//                         width: 40.0,
//                         height: 40.0,
//                         color: Colors.yellow,
//                       ),
//                     ],
//                   ),
//                   Padding(padding: EdgeInsets.all(16.0)),
//                   Row(
//                     children: <Widget>[
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           Container(
//                             width: 80.0,
//                             height: 80.0,
//                             color: Colors.cyanAccent,
//                           ),
//                           Padding(padding: EdgeInsets.all(16.0)),
//                           Container(
//                             width: 60.0,
//                             height: 60.0,
//                             color: Colors.blueGrey,
//                           ),
//                           Padding(padding: EdgeInsets.all(16.0)),
//                           Container(
//                             width: 20.0,
//                             height: 20.0,
//                             color: Colors.teal,
//                           ),
//                           Divider(),
//                         ],
//                       ),
//                     ],
//                   ),

//                   Row(
//                     children: <Widget>[
//                       CircleAvatar(
//                         backgroundColor: Colors.lightGreen,
//                         radius: 100.0,
//                         child: Stack(
//                           children: <Widget>[
//                             Container(
//                               width: 100.0,
//                               height: 100.0,
//                               color: Colors.amber,
//                             ),
//                             Container(
//                               width: 60.0,
//                               height: 60.0,
//                               color: Colors.cyan,
//                             ),
//                             Container(
//                               width: 40.0,
//                               height: 40.0,
//                               color: Colors.brown,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(),
//                   Text('end of the line'),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
