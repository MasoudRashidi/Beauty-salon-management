import '/feature/customer/models/customer_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../service/repository/customer_insert_repository.dart';

part '../state/customer_insert_state.dart';

@injectable
class CustomerInsertViewModel extends Cubit<CustomerInsertBaseState> {
  final CustomerInsertRepository repository;

  CustomerInsertViewModel({@required this.repository})
      : super(CustomerInsertInitialState());

  void customerInsert(CustomerModel request) async {
    emit(CustomerInsertLoadingState());
    try {
      var result = await repository.insertCustomer(request);
      emit(CustomerInsertSuccessState(response: result));
    } catch (e) {
      emit(CustomerInsertFailState(message: e.toString()));
    }
  }
}
