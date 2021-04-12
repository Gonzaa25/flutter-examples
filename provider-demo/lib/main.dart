import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/change_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ChangeNotifierClass())
        ],
        builder: (context, child) => MaterialApp(
              title: 'Flutter Demo App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: MyHomePage(title: 'Provider DEMO'),
            ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  void _incrementar(BuildContext context) {
    Provider.of<ChangeNotifierClass>(context, listen: false)
        .incrementarContador();
  }

  void _decrementar(BuildContext context) {
    Provider.of<ChangeNotifierClass>(context, listen: false)
        .decrementarContador();
  }

  @override
  Widget build(BuildContext context) {
    final countstate = context.watch<ChangeNotifierClass>();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Valor del contador:',
            ),
            Text(
              '${countstate.contador}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _incrementar(context),
            tooltip: 'Incrementar',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 5),
          FloatingActionButton(
            onPressed: () => _decrementar(context),
            tooltip: 'Decrementar',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
