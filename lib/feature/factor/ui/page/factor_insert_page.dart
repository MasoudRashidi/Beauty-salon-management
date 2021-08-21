import '/core/component/my_button.dart';
import '/core/services/color_service.dart';
import '/feature/factor/logic/view_model/factor_insert_view_model.dart';
import '/feature/factor/models/factor_model.dart';
import '/feature/factor/models/service_model.dart';
import '/feature/factor/ui/widget/choose_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

@injectable
class FactorInsertPage extends StatefulWidget {
  final FactorInsertViewModel factorInsertViewModel;

  const FactorInsertPage({this.factorInsertViewModel});

  @override
  _FactorInsertPageState createState() => _FactorInsertPageState();
}

class _FactorInsertPageState extends State<FactorInsertPage> {
  final List<ServiceModel> services = [];

  @override
  Widget build(BuildContext context) {
    int userId = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Factor insert"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Sum: ${_checkFactorPrice()} \$"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyButton(
                      width: 100.w,
                      height: 50.h,
                      onTap: () {
                        Get.bottomSheet(ChooseService()).then((value) {
                          ServiceModel data = value;
                          if (value != null) {
                            if (services.length > 0)
                              services.forEach((element) {
                                if (data.title == element.title) {
                                  element.number++;
                                } else {
                                  services.add(value);
                                  setState(() {});
                                }
                              });
                            else {
                              services.add(value);
                            }
                            _checkFactorPrice();
                            setState(() {});
                          }
                        });
                      },
                      label: "Add item",
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: services.length,
                itemBuilder: (context, index) =>
                    _insertServiceItem(services[index], index),
              ),
              Visibility(
                visible: services.length > 0,
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: MyButton(
                      label: "Submit",
                      onTap: () {
                        FactorModel model = FactorModel();
                        model.sum = _checkFactorPrice();
                        model.date = DateTime.now();
                        model.services = [];
                        services.forEach((element) {
                          model.services.add(element);
                        });
                        widget.factorInsertViewModel
                            .factorInsert(model, userId);
                        services.clear();
                        Get.back();
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  double _checkFactorPrice() {
    double price = 0;
    services.forEach((element) {
      double p = element.price * element.number;
      price += p;
    });
    return price;
  }

  _insertServiceItem(ServiceModel serviceModel, int index) => Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: ColorService.secondary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: ColorService.secondary.shade300, blurRadius: 5)
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(serviceModel.title ?? ""),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${serviceModel.price} \$"),
            ),
            Spacer(),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      if (serviceModel.number > 1) {
                        serviceModel.number -= 1;
                        _checkFactorPrice();
                      } else if (serviceModel.number == 1) {
                        services.removeAt(index);
                      }
                      setState(() {});
                    },
                    splashRadius: 18,
                    icon: Icon(serviceModel.number <= 1
                        ? Icons.delete
                        : Icons.remove)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${serviceModel.number}"),
                ),
                IconButton(
                    onPressed: () {
                      serviceModel.number += 1;
                      _checkFactorPrice();
                      setState(() {});
                    },
                    splashRadius: 18,
                    icon: Icon(Icons.add)),
              ],
            )
          ],
        ),
      );
}
