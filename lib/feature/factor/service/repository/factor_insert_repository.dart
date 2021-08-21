import '/core/helper/constant.dart';
import '/feature/customer/models/customer_model.dart';
import '/feature/factor/models/factor_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class FactorInsertRepository {
  Future<bool> insertFactor(FactorModel model, int index) async {
    try {
      var response = Hive.box<CustomerModel>(Constant.CustomerKey).getAt(index);
      if (response.factors == null || response.factors.length == 0) {
        response.factors = [];
      }
      response.factors.add(model);
      response.point += model.sum / 100;
      response.save();
      return true;
    } catch (e) {
      throw e.toString();
    }
  }
}
