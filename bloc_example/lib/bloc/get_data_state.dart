part of 'get_data_bloc.dart';

@immutable
abstract class GetDataState {}

class GetDataInitial extends GetDataState {}

class LoadingState extends GetDataState {}

class LoadDataState extends GetDataState {
  final int number;

  LoadDataState({required this.number});
}

class ErrorState extends GetDataState {}
