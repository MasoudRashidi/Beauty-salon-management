import '/core/component/my_button.dart';
import '/core/services/color_service.dart';
import '/feature/customer/logic/view_model/customer_view_model.dart';
import '/feature/customer/models/customer_model.dart';
import '/feature/factor/ui/widget/factor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../logic/view_model/factor_view_model.dart';
import 'factor_insert_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@injectable
class FactorPage extends StatelessWidget {
  final FactorViewModel factorViewModel;
  final FactorInsertPage factorInsertPage;
  final CustomerViewModel customerViewModel;

  FactorPage(
      {@required this.factorViewModel,
      this.factorInsertPage,
      this.customerViewModel});

  CustomerModel customerModel;

  @override
  Widget build(BuildContext context) {
    int userId = Get.arguments['id'];
    customerModel = Get.arguments['customer'];
    customerViewModel.showPoint(userId);
    double point = 0.0;
    double subFactor = 0.0;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Customer"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (contextBuilder) => Dialog(
                      child: Container(
                        width: 300.w,
                        decoration: BoxDecoration(
                            color: ColorService.secondary,
                            borderRadius: BorderRadius.circular(18)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Are you sure you want to delete this customer?",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyButton(
                                  label: "Yes",
                                  onTap: () {
                                    customerViewModel.deleteCustomer(
                                        index: userId);
                                    Navigator.pop(contextBuilder);
                                    Get.back();
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyButton(
                                  label: "No",
                                  onTap: () {
                                    Navigator.pop(contextBuilder);
                                  }),
                            ),
                            SizedBox(
                              height: 50.h,
                            )
                          ],
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  );
                },
                icon: Icon(Icons.delete)),
          ],
        ),
        body: BlocConsumer(
          listener: (context, state) {
            if (state is FactorDeleteState) {
              factorViewModel.factors(userId);
            } else {
              customerViewModel.showPoint(userId);
              // factorViewModel.factors(userId);
            }
          },
          bloc: factorViewModel..factors(userId),
          builder: (context, state) {
            if (state is FactorSuccessState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      child: Row(
                        children: [
                          Text(
                            "Full name: ",
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                          Text(
                            customerModel.name + " ",
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                          Text(
                            customerModel.lastName,
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      child: Row(
                        children: [
                          Text(
                            "Tel: ",
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                          Text(
                            customerModel.tel,
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      child: Row(
                        children: [
                          Text(
                            "Date Of Birth: ",
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                          Text(
                            customerModel.dateOfBirth,
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      child: Row(
                        children: [
                          Text(
                            "Email: ",
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                          Text(
                            customerModel.mail,
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      child: Row(
                        children: [
                          Text(
                            "Address: ",
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                          Text(
                            customerModel.address,
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Note: ",
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                          Text(
                            customerModel.note.trim(),
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Factors Sums: ",
                            style: TextStyle(
                                color: ColorService.secondary.shade900,
                                fontSize: 19.sp),
                          ),
                          BlocConsumer(
                            bloc: customerViewModel..showSumFactor(userId),
                            listener: (context, state) {
                              if (state is CustomerSumFactorState) {
                                subFactor = state.sumFactor;
                              }
                            },
                            builder: (context, state) => Text(
                              "$subFactor \$",
                              style: TextStyle(
                                  color: ColorService.secondary.shade900,
                                  fontSize: 19.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Points: ",
                              style: TextStyle(
                                  color: ColorService.secondary.shade900,
                                  fontSize: 19.sp),
                            ),
                          ),
                          BlocConsumer(
                            bloc: customerViewModel..showPoint(userId),
                            listener: (context, state) {
                              if (state is CustomerPointState) {
                                point = state.point;
                              }
                            },
                            builder: (context, state) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${point.toStringAsFixed(2)}",
                                style: TextStyle(
                                    color: ColorService.secondary.shade900,
                                    fontSize: 19.sp),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyButton(
                              height: 40,
                              width: 70,
                              onTap: () {
                                customerViewModel.usePoint(userId);
                              },
                              label: "Use",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: MyButton(
                          onTap: () {
                            Get.to(() => factorInsertPage, arguments: userId)
                                .then((value) {
                              factorViewModel.factors(userId);
                              customerViewModel.showPoint(userId);
                              customerViewModel.showSumFactor(userId);
                            });
                          },
                          label: "Add Factor",
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: state.response.length,
                      reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 18.h),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => FactorItem(
                        factorModel: state.response[index],
                        callBack: () {
                          factorViewModel.deleteFactor(index, userId);
                        },
                      ),
                    ),
                    Visibility(
                        visible: state.response == null &&
                            state.response.length == 0,
                        child: Center(
                            child: Center(
                          child: Text("Not found data"),
                        )))
                  ],
                ),
              );
            } else
              return Center(
                child: Text("Not found data"),
              );
          },
        ));
  }
}
