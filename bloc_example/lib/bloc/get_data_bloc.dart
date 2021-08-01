import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_data_event.dart';
part 'get_data_state.dart';

class GetDataBloc extends Bloc<GetDataEvent, GetDataState> {
  GetDataBloc() : super(GetDataInitial());

  @override
  Stream<GetDataState> mapEventToState(
    GetDataEvent event,
  ) async* {
    if (event is GetOnlineData) {
      yield LoadingState();
      try {
        final newData = await Future<int>.delayed(
            Duration(seconds: 3), () => Random().nextInt(100));
        yield LoadDataState(number: newData);
      } catch (error) {
        yield ErrorState();
      }
    }
    if (event is GetOnlineDataWithError) {
      yield LoadingState();
      try {
        await Future<int>.delayed(Duration(seconds: 3), () => 10);
        throw Exception();
      } catch (error) {
        yield ErrorState();
      }
    }
  }
}
