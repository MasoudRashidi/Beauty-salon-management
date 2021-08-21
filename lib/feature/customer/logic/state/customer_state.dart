part of '../view_model/customer_view_model.dart';

abstract class CustomerBaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class CustomerInitialState extends CustomerBaseState {}

class CustomerLoadingState extends CustomerBaseState {}

class CustomerPointState extends CustomerBaseState {
  final double point;

  CustomerPointState(this.point);

  @override
  List<Object> get props => [this.point];
}

class CustomerSuccessState extends CustomerBaseState {
  final List<CustomerModel> response;

  CustomerSuccessState({@required this.response});
}

class CustomerFailState extends CustomerBaseState {
  final String message;

  CustomerFailState({@required this.message});
}

class CustomerDeleteState extends CustomerBaseState {
  final bool data;

  CustomerDeleteState({@required this.data});

  @override
  List<Object> get props => [this.data];
}

class CustomerSumFactorState extends CustomerBaseState {
  final double sumFactor;

  CustomerSumFactorState({@required this.sumFactor});

  @override
  List<Object> get props => [this.sumFactor];
}
