import '/core/services/color_service.dart';
import '/feature/customer/models/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerItem extends StatelessWidget {
  final CustomerModel customerModel;
  final Function callBack;

  const CustomerItem({@required this.customerModel, this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
          color: ColorService.secondary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: ColorService.secondary.shade300, blurRadius: 5)
          ]),
      child: Column(
        children: [
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          //   child: Row(
          //     children: [
          //
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text(
          //           "Point: ",
          //           style: TextStyle(
          //               color: ColorService.secondary.shade900, fontSize: 19.sp),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text(
          //           "${customerModel.point.toStringAsFixed(2)}",
          //           style: TextStyle(
          //               color: ColorService.secondary.shade900, fontSize: 19.sp),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: MyButton(
          //           height: 40,
          //             width: 70,
          //             onTap: () {
          //             callBack();
          //             },
          //             label: "Use",
          //       ),
          //       ),
          //     ],
          //   ),
          // ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: Text(
                  "Full name: ${customerModel.name} ${customerModel.lastName}",
                  style: TextStyle(
                      color: ColorService.secondary.shade900, fontSize: 19.sp),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Row(
              children: [
                Text(
                  "Tel: ${customerModel.tel}",
                  style: TextStyle(
                      color: ColorService.secondary.shade900, fontSize: 19.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          //
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          //   child: Text(
          //     customerModel.dateOfBirth,
          //     style: TextStyle(
          //         color: ColorService.secondary.shade900, fontSize: 19.sp),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          //   child: Text(
          //     customerModel.mail,
          //     style: TextStyle(
          //         color: ColorService.secondary.shade900, fontSize: 19.sp),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          //   child: Text(
          //     customerModel.address,
          //     style: TextStyle(
          //         color: ColorService.secondary.shade900, fontSize: 19.sp),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          //   child: Text(
          //     customerModel.note,
          //     style: TextStyle(
          //         color: ColorService.secondary.shade900, fontSize: 19.sp),
          //   ),
          // ),
        ],
      ),
    );
  }
}
