import '/core/helper/constant.dart';
import '/feature/customer/models/customer_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class CustomerRepository {
  Future<List<CustomerModel>> getCustomer() async {
    Box<CustomerModel> box = Hive.box<CustomerModel>(Constant.CustomerKey);
    List<CustomerModel> _ls = [];
    try {
      _ls.addAll(box.values);
      return _ls;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteCustomer(int index) async {
    await Hive.box<CustomerModel>(Constant.CustomerKey).deleteAt(index);
    return true;
  }

  Future<List<CustomerModel>> usePoint(int index) async {
    var response = Hive.box<CustomerModel>(Constant.CustomerKey).getAt(index);
    if (response.point >= 1) response.point--;
    response.save();
    Box<CustomerModel> box = Hive.box<CustomerModel>(Constant.CustomerKey);
    List<CustomerModel> _ls = [];
    try {
      _ls.addAll(box.values);
      return _ls;
    } catch (e) {
      rethrow;
    }
  }

  Future<double> showPoint(int index) async {
    return Hive.box<CustomerModel>(Constant.CustomerKey).getAt(index).point;
  }

  Future<double> showSumFactor(int index) async {
    double sum = 0;
    Hive.box<CustomerModel>(Constant.CustomerKey).getAt(index).factors.forEach((element) {
      sum += element.sum;
    });
    return sum;
  }
}
