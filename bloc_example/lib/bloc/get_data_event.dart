part of 'get_data_bloc.dart';

@immutable
abstract class GetDataEvent {}

class GetOnlineData extends GetDataEvent {}

class GetOnlineDataWithError extends GetDataEvent {}
