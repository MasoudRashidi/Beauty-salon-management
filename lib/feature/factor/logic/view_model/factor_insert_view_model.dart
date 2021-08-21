import '/feature/factor/models/factor_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../service/repository/factor_insert_repository.dart';

part '../state/factor_insert_state.dart';

@injectable
class FactorInsertViewModel extends Cubit<FactorInsertBaseState> {
  final FactorInsertRepository repository;

  FactorInsertViewModel({@required this.repository})
      : super(FactorInsertInitialState());

  void factorInsert(FactorModel request, int index) async {
    emit(FactorInsertLoadingState());
    try {
      var result = await repository.insertFactor(request, index);
      emit(FactorInsertSuccessState(response: result));
    } catch (e) {
      emit(FactorInsertFailState(message: e.toString()));
    }
  }
}
