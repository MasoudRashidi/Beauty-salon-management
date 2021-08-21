import '/core/component/my_button.dart';
import '/core/services/color_service.dart';
import '/feature/factor/models/service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../r.dart';

@injectable
class ChooseService extends StatelessWidget {
  final RxInt select = 0.obs;

  final List<ServiceModel> services = [
    ServiceModel(title: "EyeBrow", price: 15),
    ServiceModel(title: "Lip", price: 7),
    ServiceModel(title: "Chin", price: 9),
    ServiceModel(title: "Neck", price: 9),
    ServiceModel(title: "Partial Face", price: 25),
    ServiceModel(title: "Full Face", price: 40),
    ServiceModel(title: "Eyebrow Tinting", price: 25),
    ServiceModel(title: "Eyelash Tinting", price: 35),
    ServiceModel(title: "Forehead", price: 9),
    ServiceModel(title: "Oil", price: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorService.secondary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(18), topLeft: Radius.circular(18))),
      child: Column(
        children: [
          Container(
            width: 30.w,
            height: 2.r,
            color: ColorService.secondary.shade300,
            margin: EdgeInsets.only(
              top: 20.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              top: 20.h,
              right: 20.w,
            ),
            child: SizedBox(
              height: 66.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 80.h,
                    alignment: Alignment.center,
                    child: Text(
                      "Choose Service",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorService.secondary.shade500),
                    ),
                  ),
                  Container(
                    height: 80.h,
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: SizedBox(
                        height: 23.h,
                        width: 23.w,
                        child: SvgPicture.asset(
                          R.assetsIconsCloseIcon,
                          color: ColorService.error,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // .......
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: services.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Obx(() {
                  return GestureDetector(
                    onTap: () {
                      select.value = index;
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 46),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: index == select.value
                            ? null
                            : [
                                BoxShadow(
                                    color: ColorService.secondary.shade400
                                        .withOpacity(0.1),
                                    offset: Offset(2, 2),
                                    blurRadius: 1,
                                    spreadRadius: 0),
                                BoxShadow(
                                    color: ColorService.secondary.shade400
                                        .withOpacity(0.1),
                                    offset: Offset(-2, -2),
                                    blurRadius: 1,
                                    spreadRadius: 0),
                              ],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: index == select.value
                              ? Colors.orange
                              : Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                services[index].title,
                                style: TextStyle(
                                    color: ColorService.secondary.shade500,
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: index == select.value,
                            child: SvgPicture.asset(
                              R.assetsIconsCircleCheck,
                              width: 20.r,
                              height: 20.r,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h, top: 30.h),
            child: MyButton(
                label: "Submit",
                onTap: () {
                  Get.back(result: services[select.value]);
                }),
          ),
        ],
      ),
    );
  }
}
