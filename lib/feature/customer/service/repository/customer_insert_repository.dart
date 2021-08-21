import '/core/helper/constant.dart';
import '/feature/customer/models/customer_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class CustomerInsertRepository {
  Future<bool> insertCustomer(CustomerModel customerModel) async {
    try {
      await Hive.box<CustomerModel>(Constant.CustomerKey).add(customerModel);
      customerModel.factors=[];
      customerModel.point=0;
      customerModel.save();
      return true;
    } catch (e) {
      throw e.toString();
    }
  }
}
