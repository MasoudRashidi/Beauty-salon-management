part of '../view_model/factor_insert_view_model.dart';

abstract class FactorInsertBaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class FactorInsertInitialState extends FactorInsertBaseState {}

class FactorInsertLoadingState extends FactorInsertBaseState {}

class FactorInsertSuccessState extends FactorInsertBaseState {
  final bool response;

  FactorInsertSuccessState({@required this.response});
}

class FactorInsertFailState extends FactorInsertBaseState {
  final String message;

  FactorInsertFailState({@required this.message});
}
