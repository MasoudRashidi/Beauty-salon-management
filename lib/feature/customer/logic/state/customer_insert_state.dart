part of '../view_model/customer_insert_view_model.dart';

abstract class CustomerInsertBaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class CustomerInsertInitialState extends CustomerInsertBaseState {}

class CustomerInsertLoadingState extends CustomerInsertBaseState {}

class CustomerInsertSuccessState extends CustomerInsertBaseState {
  final bool response;

  CustomerInsertSuccessState({@required this.response});
}

class CustomerInsertFailState extends CustomerInsertBaseState {
  final String message;

  CustomerInsertFailState({@required this.message});
}
