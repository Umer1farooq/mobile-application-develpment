import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: column,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> get column {
    return <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Text('A1', style: TextStyle(fontSize: 25)),
          Text('B2', style: TextStyle(fontSize: 25)),
          Text('C3', style: TextStyle(fontSize: 25)),
          Text('D4', style: TextStyle(fontSize: 25)),
          ElevatedButton(onPressed: () {}, child: Text('Login')),
        ],
      ),
      Text('A', style: TextStyle(fontSize: 25)),
      Text('B', style: TextStyle(fontSize: 25)),
      Text('C', style: TextStyle(fontSize: 25)),
      Text('D', style: TextStyle(fontSize: 25)),
      ElevatedButton(onPressed: () {}, child: Text('Login')),
      Center(
        child: InkWell(
          onDoubleTap: () {
            print('Double Tap');
          },
          onLongPress: () {
            print('On Long Press');
          },
          onTap: () {
            print('Click here');
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.yellow,
            child: Center(
              child: InkWell(
                onTap: () {
                  print('Umer');
                },
                child: Text(
                  'Hello jee',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
      ),
      //row
      RowScroll(),
      //column
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 11),

              height: 200,
              color: Colors.green,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 11),

              height: 200,
              color: Colors.pinkAccent,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 11),

              height: 200,
              color: Colors.blue,
            ),

            Container(
              margin: EdgeInsets.only(bottom: 11),

              height: 200,
              color: Colors.green,
            ),

            Container(
              margin: EdgeInsets.only(bottom: 11),

              height: 200,
              color: Colors.blueGrey,
            ),

            Container(
              margin: EdgeInsets.only(bottom: 11),

              height: 200,
              color: Colors.pinkAccent,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 11),

              height: 200,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    ];
  }

  Padding RowScroll() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 11),
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            Container(
              margin: EdgeInsets.only(right: 11),
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            Container(
              margin: EdgeInsets.only(right: 11),
              width: 200,
              height: 200,
              color: Colors.blueGrey,
            ),
            Container(
              margin: EdgeInsets.only(right: 11),
              width: 200,
              height: 200,
              color: Colors.indigo,
            ),
            Container(
              margin: EdgeInsets.only(right: 11),
              width: 200,
              height: 200,
              color: Colors.limeAccent,
            ),
            Container(
              margin: EdgeInsets.only(right: 11),
              width: 200,
              height: 200,
              color: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
