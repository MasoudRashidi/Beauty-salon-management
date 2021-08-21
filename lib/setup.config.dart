// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/helper/loading.dart' as _i18;
import 'feature/customer/logic/view_model/customer_insert_view_model.dart'
    as _i5;
import 'feature/customer/logic/view_model/customer_view_model.dart' as _i14;
import 'feature/customer/service/repository/customer_insert_repository.dart'
    as _i6;
import 'feature/customer/service/repository/customer_repository.dart' as _i17;
import 'feature/customer/ui/page/customer_insert.dart' as _i11;
import 'feature/customer/ui/page/customer_page.dart' as _i15;
import 'feature/factor/logic/view_model/factor_insert_view_model.dart' as _i7;
import 'feature/factor/logic/view_model/factor_view_model.dart' as _i9;
import 'feature/factor/service/repository/factor_insert_repository.dart' as _i8;
import 'feature/factor/service/repository/factor_repository.dart' as _i10;
import 'feature/factor/ui/page/factor_insert_page.dart' as _i12;
import 'feature/factor/ui/page/factor_page.dart' as _i13;
import 'feature/factor/ui/widget/choose_service.dart' as _i3;
import 'feature/splash/ui/page/splash_page.dart' as _i16;
import 'main.dart' as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ChooseService>(() => _i3.ChooseService());
  gh.factory<_i5.CustomerInsertViewModel>(() => _i5.CustomerInsertViewModel(
      repository: get<_i6.CustomerInsertRepository>()));
  gh.factory<_i7.FactorInsertViewModel>(() =>
      _i7.FactorInsertViewModel(repository: get<_i8.FactorInsertRepository>()));
  gh.factory<_i9.FactorViewModel>(
      () => _i9.FactorViewModel(repository: get<_i10.FactorRepository>()));
  gh.factory<_i11.CustomerInsertPage>(() => _i11.CustomerInsertPage(
      customerInsertViewModel: get<_i5.CustomerInsertViewModel>()));
  gh.factory<_i12.FactorInsertPage>(() => _i12.FactorInsertPage(
      factorInsertViewModel: get<_i7.FactorInsertViewModel>()));
  gh.factory<_i13.FactorPage>(() => _i13.FactorPage(
      factorViewModel: get<_i9.FactorViewModel>(),
      factorInsertPage: get<_i12.FactorInsertPage>(),
      customerViewModel: get<_i14.CustomerViewModel>()));
  gh.factory<_i15.CustomerPage>(() => _i15.CustomerPage(
      customerViewModel: get<_i14.CustomerViewModel>(),
      customerInsertPage: get<_i11.CustomerInsertPage>(),
      factorPage: get<_i13.FactorPage>()));
  gh.factory<_i16.SplashPage>(
      () => _i16.SplashPage(customerPage: get<_i15.CustomerPage>()));
  gh.singleton<_i6.CustomerInsertRepository>(_i6.CustomerInsertRepository());
  gh.singleton<_i17.CustomerRepository>(_i17.CustomerRepository());
  gh.singleton<_i14.CustomerViewModel>(
      _i14.CustomerViewModel(repository: get<_i17.CustomerRepository>()));
  gh.singleton<_i8.FactorInsertRepository>(_i8.FactorInsertRepository());
  gh.singleton<_i10.FactorRepository>(_i10.FactorRepository());
  gh.singleton<_i18.Loading>(_i18.Loading());
  gh.singleton<_i19.MyApp>(_i19.MyApp(splashPage: get<_i16.SplashPage>()));
  return get;
}
