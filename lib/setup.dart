import '/core/helper/constant.dart';
import '/feature/customer/models/customer_model.dart';
import '/feature/factor/models/factor_model.dart';
import '/feature/factor/models/service_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'setup.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  $initGetIt(getIt);
}

T locateService<T extends Object>() {
  return getIt.get<T>();
}

Future<void> configServices() async {
  await _configHive();
}

Future<void> _configHive() async {
  if (!kIsWeb) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    Hive.registerAdapter<CustomerModel>(CustomerModelAdapter());
    Hive.registerAdapter<FactorModel>(FactorModelAdapter());
    Hive.registerAdapter<ServiceModel>(ServiceModelAdapter());

    await Hive.openBox<CustomerModel>(Constant.CustomerKey);
    await Hive.openBox<FactorModel>(Constant.FactorKey);
    await Hive.openBox<ServiceModel>(Constant.ServiceKey);
  }
}
