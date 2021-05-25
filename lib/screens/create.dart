import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../env.sample.dart';
import '../widgets/form.dart';

class Create extends StatefulWidget {
  final Function refreshStudentList;

  Create({this.refreshStudentList});

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  // Required for form validations
  final formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController nameController = new TextEditingController();
  TextEditingController nicController = new TextEditingController();
  TextEditingController imeController = new TextEditingController();
  TextEditingController deviceController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController reasonController = new TextEditingController();
  TextEditingController  addressController = new TextEditingController();

  // Http post request to create new data
  Future _createStudent() async {
    return await http.post(
      Uri.parse("${Env.URL_PREFIX}/create.php"),
      body: {
        "Name": nameController.text,
        "Nic": nicController.text,
        "Ime": imeController.text,
        "Device_Model": deviceController.text,
        "Mobile_no": mobileController.text,
        "Reason": reasonController.text,
        "Address": addressController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await _createStudent();

    // Remove all existing routes until the Home.dart, then rebuild Home.
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: RaisedButton(
          child: Text("CONFIRM"),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            if (formKey.currentState.validate()) {
              _onConfirm(context);
            }
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: AppForm(
              formKey: formKey,
              nameController: nameController,
              nicController: nicController,
              imeController:    imeController,
              deviceController: deviceController,
              mobileController: mobileController,
              reasonController: reasonController,
              addressController: addressController,
            ),
          ),
        ),
      ),
    );
  }
}