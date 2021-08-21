import '/feature/factor/models/service_model.dart';
import 'package:hive/hive.dart';

part 'factor_model.g.dart';

@HiveType(typeId: 2)
class FactorModel extends HiveObject {
  FactorModel({
    this.date,
    this.sum,
    this.services,
});

  @HiveField(0)
  DateTime date;

  @HiveField(1)
  double sum;

  @HiveField(2)
  List<ServiceModel> services;

}
