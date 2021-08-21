import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/feature/splash/ui/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/helper/color_utils.dart';
import 'core/services/color_service.dart';
import 'setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await configServices();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(locateService<MyApp>());
}

@singleton
class MyApp extends StatelessWidget {
  final SplashPage splashPage;

  MyApp({this.splashPage});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ColorUtils.purple));
    return ScreenUtilInit(
      designSize: Size(412, 820),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetMaterialApp(
          navigatorKey: Get.key,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale("en", "US"),
          ],
          locale: Locale("en", "US"),
          title: 'Barber Shop',
          theme: ThemeData(
            primarySwatch: ColorService.primary,
          ),
          home: splashPage,
        ),
      ),
    );
  }
}
