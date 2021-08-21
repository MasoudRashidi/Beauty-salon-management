import '/core/component/my_button.dart';
import '/core/services/color_service.dart';
import '/feature/factor/models/factor_model.dart';
import '/feature/factor/ui/page/service_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FactorItem extends StatelessWidget {
  final FactorModel factorModel;
  final Function callBack;

  const FactorItem({this.factorModel, this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: ColorService.secondary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: ColorService.secondary.shade300, blurRadius: 5)
          ]),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(child: Text("Date:")),
                    Expanded(
                        child: Text(
                            "${DateFormat('yyyy/MM/dd – kk:mm').format(factorModel.date)}"))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(child: Text("Sum:")),
                    Expanded(child: Text("${factorModel.sum} \$"))
                  ],
                ),
              ),
              ListView.builder(
                itemCount: factorModel.services.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => ServiceItem(
                  serviceModel: factorModel.services[index],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: IconButton(
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
                                "Are you sure you want to delete this factor?",
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
                                    // customerViewModel.deleteCustomer(
                                    //     index: userId);
                                    callBack();
                                    Navigator.pop(contextBuilder);
                                    // Get.back();
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
                icon: Icon(
                  Icons.delete,
                  color: ColorService.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
