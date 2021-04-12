import 'package:flutter/material.dart';
import 'package:inheritedwidget_demo/inherited.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('InheritedWidget DEMO'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hola!',
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          ButtonColor.of(context).color)),// se accede a la informacion del inheritedWidget mediante ButtonColor.of(context).color
                  onPressed: () => Navigator.pop(context),
                  child: Text('Volver'))
            ],
          ),
        ));
  }
}
