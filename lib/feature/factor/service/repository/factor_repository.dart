import '/core/helper/constant.dart';
import '/feature/customer/models/customer_model.dart';
import '/feature/factor/models/factor_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class FactorRepository {
  Future<List<FactorModel>> call(int index) async {
    var box = Hive.box<CustomerModel>(Constant.CustomerKey);
    List<FactorModel> _ls = [];
    try {
      box.getAt(index).factors.forEach((element) {
        _ls.add(element);
      });
      return _ls;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteFactor(int index, int customer) async {
    var box = Hive.box<CustomerModel>(Constant.CustomerKey).getAt(customer);
    try {
      box.factors.removeAt(index);
      box.save();
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
