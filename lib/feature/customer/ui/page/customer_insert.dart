import '/core/component/my_button.dart';
import '/core/component/my_text_field.dart';
import '/feature/customer/logic/view_model/customer_insert_view_model.dart';
import '/feature/customer/models/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class CustomerInsertPage extends StatelessWidget {
  final CustomerInsertViewModel customerInsertViewModel;

  CustomerInsertPage({this.customerInsertViewModel});

  final TextEditingController _controllerName = new TextEditingController();
  final TextEditingController _controllerLastName = new TextEditingController();
  final TextEditingController _controllerDateOfBirth =
      new TextEditingController();
  final TextEditingController _controllerTel = new TextEditingController();
  final TextEditingController _controllerEmail = new TextEditingController();
  final TextEditingController _controllerAddress = new TextEditingController();
  final TextEditingController _controllerNote = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Insert Customer"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyTextField(
                controller: _controllerName,
                hint: "Name",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyTextField(
                controller: _controllerLastName,
                hint: "LastName",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyTextField(
                controller: _controllerDateOfBirth,
                hint: "Date of birth",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyTextField(
                controller: _controllerTel,
                hint: "Tel",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyTextField(
                controller: _controllerEmail,
                hint: "Email",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyTextField(
                controller: _controllerAddress,
                hint: "Address",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyTextField(
                controller: _controllerNote,
                hint: "Note",
                maxLine: 3,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyButton(
                label: "Submit",
                onTap: () {
                  customerInsertViewModel.customerInsert(_getData());
                  Get.back(result: _getData());
                  _clearController();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomerModel _getData() => CustomerModel(
        name: _controllerName.text,
        lastName: _controllerLastName.text,
        dateOfBirth: _controllerDateOfBirth.text,
        tel: _controllerTel.text,
        mail: _controllerEmail.text,
        address: _controllerAddress.text,
        note: _controllerNote.text,
        factors: [],
        point: 0,
      );

  void _clearController() {
    _controllerName.text = "";
    _controllerLastName.text = "";
    _controllerDateOfBirth.text = "";
    _controllerTel.text = "";
    _controllerEmail.text = "";
    _controllerAddress.text = "";
    _controllerNote.text = "";
  }
}
