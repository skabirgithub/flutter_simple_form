import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../env.sample.dart';
import '../models/customer.dart';
import '../widgets/form.dart';

class Edit extends StatefulWidget {
  final Customer customer;

  Edit({this.customer});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  // This is  for form validations
  final formKey = GlobalKey<FormState>();

  // This is for text onChange
  TextEditingController nameController = new TextEditingController();
  TextEditingController nicController = new TextEditingController();
  TextEditingController imeController = new TextEditingController();
  TextEditingController deviceController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController reasonController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  // Http post request
  Future editStudent() async {
    return await http.post(
      Uri.parse("${Env.URL_PREFIX}/update.php"),
      body: {
        "id": (widget.customer.id),
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
    await editStudent();

    // Remove all existing routes until the Home.dart, then rebuild Home.
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    // nameController = TextEditingController(text: widget.customer.name);
    nameController = new TextEditingController(text: widget.customer.name);
    nicController = new TextEditingController(text: widget.customer.nic);
    imeController = new TextEditingController(text: widget.customer.ime);
    deviceController = new TextEditingController(text: widget.customer.deviceModel);
    mobileController = new TextEditingController(text: widget.customer.mobileNo);
    reasonController = new TextEditingController(text: widget.customer.reason);
    addressController = new TextEditingController(text: widget.customer.address);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: RaisedButton(
          child: Text('CONFIRM'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            _onConfirm(context);
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