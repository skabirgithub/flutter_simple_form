// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    this.id,
    this.name,
    this.nic,
    this.ime,
    this.deviceModel,
    this.mobileNo,
    this.reason,
    this.address,
  });

  String id;
  String name;
  String nic;
  String ime;
  String deviceModel;
  String mobileNo;
  String reason;
  String address;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"].toString(),
    name: json["Name"],
    nic: json["Nic"],
    ime: json["Ime"],
    deviceModel: json["Device_Model"],
    mobileNo: json["Mobile_no"],
    reason: json["Reason"],
    address: json["Address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Name": name,
    "Nic": nic,
    "Ime": ime,
    "Device_Model": deviceModel,
    "Mobile_no": mobileNo,
    "Reason": reason,
    "Address": address,
  };
}
