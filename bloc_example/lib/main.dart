import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/get_data_bloc.dart';

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
      home: MultiBlocProvider(providers: [
        BlocProvider<GetDataBloc>(
          create: (_) => GetDataBloc(),
        ),
      ], child: BlockTest()),
    );
  }
}

class BlockTest extends StatefulWidget {
  const BlockTest({Key? key}) : super(key: key);

  @override
  _BlockTestState createState() => _BlockTestState();
}

class _BlockTestState extends State<BlockTest> {
  @override
  Widget build(BuildContext context) {
    final testbloc = BlocProvider.of<GetDataBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<GetDataBloc, GetDataState>(builder: (context, state) {
              if (state is LoadingState) {
                return CircularProgressIndicator();
              }
              if (state is ErrorState) {
                return Text(
                  'Ha ocurrido un error al descargar la información.',
                  style: Theme.of(context).textTheme.bodyText1,
                );
              }
              if (state is LoadDataState) {
                return Text(
                  'Valor descargado= ${state.number}',
                  style: Theme.of(context).textTheme.bodyText1,
                );
              }
              return Text(
                'Bloc Example',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () => testbloc.add(GetOnlineData()),
                child: Text('Cargar')),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () => testbloc.add(GetOnlineDataWithError()),
                child: Text('Cargar con error')),
          ],
        ),
      ),
    );
  }
}
