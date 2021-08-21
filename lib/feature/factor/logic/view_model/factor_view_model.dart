import '/feature/factor/models/factor_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../service/repository/factor_repository.dart';

part '../state/factor_state.dart';

@injectable
class FactorViewModel extends Cubit<FactorBaseState> {
  final FactorRepository repository;

  FactorViewModel({@required this.repository}) : super(FactorInitialState());

  void factors(int index) async {
    emit(FactorLoadingState());
    try {
      var result = await repository(index);
      emit(FactorSuccessState(response: result));
    } catch (e) {
      emit(FactorFailState(message: e.toString()));
    }
  }

  void deleteFactor(int index, int customer) async {
    emit(FactorLoadingState());
    try {
      var result = await repository.deleteFactor(index, customer);
      emit(FactorDeleteState(data: result));
    } catch (e) {
      emit(FactorFailState(message: e.toString()));
    }
  }
}
