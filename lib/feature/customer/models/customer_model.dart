import '/feature/factor/models/factor_model.dart';
import 'package:hive/hive.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 1)
class CustomerModel extends HiveObject {
  CustomerModel(
      {this.name,
      this.lastName,
      this.dateOfBirth,
      this.tel,
      this.mail,
      this.address,
      this.note,
      this.factors,
      this.point=0});

  @HiveField(0)
  String name;

  @HiveField(1)
  String lastName;

  @HiveField(2)
  String dateOfBirth;

  @HiveField(3)
  String tel;

  @HiveField(4)
  String mail;

  @HiveField(5)
  String address;

  @HiveField(6)
  String note;

  @HiveField(7)
  List<FactorModel> factors;

  @HiveField(8)
  double point;
}
