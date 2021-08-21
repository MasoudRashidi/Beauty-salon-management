import '/core/services/color_service.dart';
import '/feature/customer/models/customer_model.dart';
import '/feature/customer/ui/widget/customer_item.dart';
import '/feature/factor/ui/page/factor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../logic/view_model/customer_view_model.dart';
import 'customer_insert.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@injectable
class CustomerPage extends StatelessWidget {
  final CustomerViewModel customerViewModel;
  final CustomerInsertPage customerInsertPage;
  final FactorPage factorPage;
  final TextEditingController searchController = TextEditingController();

  CustomerPage(
      {@required this.customerViewModel,
      this.customerInsertPage,
      this.factorPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customers"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => customerInsertPage).then((value) async {
                  customerViewModel.getCustomer();
                  Future.delayed(Duration(
                    milliseconds: 100,
                  )).then((a) {
                    if (value != null) {
                      CustomerModel data = value;

                      Get.to(() => factorPage, arguments: {
                        'id': customerViewModel.index(data),
                        'customer': data
                      }).then((value) => customerViewModel.getCustomer());
                    }
                  });
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        child: BlocBuilder(
          bloc: customerViewModel..getCustomer(),
          builder: (context, state) {
            if (state is CustomerSuccessState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Expanded(child: _buildSearchBar(customerViewModel)),
                            Icon(Icons.search,
                                color: ColorService.secondary.shade500),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                        itemCount: state.response.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Get.to(() => factorPage, arguments: {
                                  'id': customerViewModel
                                      .index(state.response[index]),
                                  'customer': state.response[index]
                                }).then(
                                    (value) => customerViewModel.getCustomer()),
                            child: CustomerItem(
                              customerModel: state.response[index],
                              callBack: () {},
                            ))),
                    Visibility(
                        visible: state.response == null ||
                            state.response.length == 0,
                        child: Center(
                          child: Text("Not found data"),
                        ))
                  ],
                ),
              );
            } else
              return Center(
                child: Text("Not found data"),
              );
          },
        ),
      ),
    );
  }

  Widget _buildSearchBar(CustomerViewModel model) => TextFormField(
        cursorColor: ColorService.secondary.shade500,
        style: TextStyle(color: ColorService.secondary.shade500),
        keyboardType: TextInputType.text,
        controller: searchController,
        onChanged: (_) {
          model.searchContact(value: _);
        },
        decoration: new InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintStyle: TextStyle(color: ColorService.secondary.shade500),
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 4, top: 4, right: 15),
          hintText: "search...",
        ),
      );
}
