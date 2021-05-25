import 'package:flutter/material.dart';

class AppForm extends StatefulWidget {
  // Required for form validations
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController nameController;
  TextEditingController nicController;
  TextEditingController imeController;
  TextEditingController deviceController;
  TextEditingController mobileController;
  TextEditingController reasonController;
  TextEditingController addressController;

  AppForm(
      {this.formKey,
      this.nameController,
      this.nicController,
      this.imeController,
      this.deviceController,
      this.mobileController,
      this.reasonController,
      this.addressController});
  // AppForm({this.formKey, this.nameController, this.ageController});

  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  String _validateName(String value) {
    if (value.length < 3) return 'Value must be more than 2 charater';
    return null;
  }



  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidate: true,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Name'),
            validator: _validateName,
          ),

          TextFormField(
            controller: widget.nicController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Nic'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.imeController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'IMEI'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.deviceController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Device Model'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.mobileController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Mobile No'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.reasonController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Reason'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.addressController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Address'),
            validator: _validateName,
          ),

        ],
      ),
    );;
  }
}