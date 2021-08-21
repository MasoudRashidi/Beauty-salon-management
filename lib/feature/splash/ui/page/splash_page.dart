import '/feature/customer/ui/page/customer_page.dart';
import '/core/helper/loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import '/r.dart';

@injectable
class SplashPage extends StatelessWidget {
  final CustomerPage customerPage;

  SplashPage({this.customerPage});

  @override
  Widget build(BuildContext context) {
    _navigator();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              R.assetsImagesLogoLight,
              height: 150.h,
              width: 150.w,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Loading(),
            ),
          ),
        ],
      ),
    );
  }

  _navigator() async {
    await Future.delayed(Duration(seconds: 1));
    Get.off(() => customerPage);
  }
}
