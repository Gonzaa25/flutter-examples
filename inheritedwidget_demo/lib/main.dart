import 'package:flutter/material.dart';
import 'package:inheritedwidget_demo/inherited.dart';
import 'package:inheritedwidget_demo/pages/home.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonColor(// inheritedWidget siempre arriba del MaterialApp.
      color: Colors.brown,// se informa el valor a utilizar , si se cambia el color se actualizaran todos los lugares en donde se accede a dicho recurso
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ),
    );
  }
}

