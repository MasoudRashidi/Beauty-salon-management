import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'service_model.g.dart';

@HiveType(typeId: 3)
class ServiceModel extends HiveObject{

  @HiveField(0)
  final String title;

  @HiveField(1)
  final double price;

  @HiveField(2)
  int number;

  ServiceModel({@required this.title,@required this.price , this.number=1});
}