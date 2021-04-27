import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jsonserializable/example/example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data='';

  void _getData() {
    Person newPerson = Person.fromJson(json.decode('{"firstName":"Gonzalo","lastName":"Martin","dateOfBirth":"1993-12-25"}'));
    print(newPerson.firstName);
    setState(() {
       data='Nombre: ${newPerson.firstName},\nSegundonombre: ${newPerson.lastName},\nFechadenacimiento: ${newPerson.dateOfBirth}';
    });
    
  }
  void _cleanData() {
    setState(() {
       data='';
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON DEMO'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              data.isEmpty?'Sin datos':data,textAlign: TextAlign.center,
            ),
            ElevatedButton(onPressed: data.isEmpty?_getData:_cleanData, child: Text(data.isEmpty?'Generar datos desde Json':'Limpiar'))
          ],
        ),
      ),
    );
  }
}
