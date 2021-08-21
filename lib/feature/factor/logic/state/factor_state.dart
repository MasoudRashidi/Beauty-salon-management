part of '../view_model/factor_view_model.dart';

abstract class FactorBaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class FactorInitialState extends FactorBaseState {}

class FactorLoadingState extends FactorBaseState {}

class FactorSuccessState extends FactorBaseState {
  final List<FactorModel> response;

  FactorSuccessState({@required this.response});
}

class FactorFailState extends FactorBaseState {
  final String message;

  FactorFailState({@required this.message});
}

class FactorDeleteState extends FactorBaseState {
  final bool data;

  FactorDeleteState({@required this.data});
}
