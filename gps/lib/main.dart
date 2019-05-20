import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double latitude = 0;
  double longitude = 0;

  void _getLocation() async {
    
    Location _location = new Location();
    Map<String, double> location;
    location = await _location.getLocation();
    
    setState(() {
      latitude = location["latitude"];
      longitude = location["longitude"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              child: Text("Ligar GPS"),
              onPressed: () { _getLocation(); },
            ),
            Text(
              'Latitude: ${latitude}',
              
            ),Text(
              'Longitude: ${longitude}',
              
            ),
          ],
        ),
      ),
    );
  }
}
