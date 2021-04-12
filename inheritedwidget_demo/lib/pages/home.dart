import 'package:flutter/material.dart';
import 'package:inheritedwidget_demo/inherited.dart';
import 'package:inheritedwidget_demo/pages/secondpage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      ElevatedButton(style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(ButtonColor.of(context).color)// se accede a la informacion del inheritedWidget mediante ButtonColor.of(context).color
                      ),onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>SecondPage())), child: Text('Ir a la segunda página'))
                    ],
                  ),
                )
        ); 
}}
