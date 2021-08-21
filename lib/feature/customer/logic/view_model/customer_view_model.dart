import '/feature/customer/models/customer_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../service/repository/customer_repository.dart';

part '../state/customer_state.dart';

@singleton
class CustomerViewModel extends Cubit<CustomerBaseState> {
  final CustomerRepository repository;

  CustomerViewModel({@required this.repository})
      : super(CustomerInitialState());

  List<CustomerModel> response = [];
  List<CustomerModel> searchCustomer = [];

  void getCustomer() async {
    emit(CustomerLoadingState());
    try {
      var result = await repository.getCustomer();
      response = result;
      searchCustomer = result;
      emit(CustomerSuccessState(response: result));
    } catch (e) {
      emit(CustomerFailState(message: e.toString()));
    }
  }

  void deleteCustomer({int index}) async {
    emit(CustomerLoadingState());
    try {
      var data = await repository.deleteCustomer(index);
      emit(CustomerDeleteState(data: data));
      getCustomer();
    } catch (e) {
      emit(CustomerFailState(message: e.toString()));
    }
  }

  void usePoint(int index) async {
    emit(CustomerLoadingState());
    try {
      var result = await repository.usePoint(index);
      emit(CustomerPointState(result[index].point));
    } catch (e) {
      emit(CustomerFailState(message: e.toString()));
    }
  }

  void showPoint(int index) async {
    emit(CustomerLoadingState());
    try {
      emit(CustomerPointState(await repository.showPoint(index)));
    } catch (e) {
      emit(CustomerFailState(message: e.toString()));
    }
  }

  index(CustomerModel item) {
    for (int i = 0; i < response.length; i++) {
      if (response[i].name == item.name &&
          response[i].lastName == item.lastName &&
          response[i].tel == item.tel &&
          response[i].mail == item.mail &&
          response[i].address == item.address &&
          response[i].note == item.note) return i;
    }
  }

  void showSumFactor(int index) async {
    emit(CustomerLoadingState());
    try {
      double sum = await repository.showSumFactor(index);
      emit(CustomerSumFactorState(sumFactor: sum));
    } catch (e) {
      emit(CustomerFailState(message: e.toString()));
    }
  }

  void searchContact({String value}) async {
    if (value.trim() == "") {
      getCustomer();
    } else {
      emit(CustomerLoadingState());
      searchCustomer = response
          .where((a) => "${a.name} ${a.lastName}".toLowerCase().contains(value))
          .toList();
      emit(CustomerSuccessState(response: searchCustomer));
    }
  }
}
