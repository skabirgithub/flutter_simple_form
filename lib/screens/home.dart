import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

import '../env.sample.dart';
import '../models/customer.dart';
import './details.dart';
import './create.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<List<Customer>> customers;
  final studentListKey = GlobalKey<HomeState>();

  @override
  void initState() {
    customers = getStudentList();
    super.initState();

    // reqbro();
  }

  // Future<List<Customer>> getJsonData() async {
  //   print('response');
  //   print(Uri.parse("${Env.URL_PREFIX}/list.php"));
  //   final headers = {'Content-Type': 'application/json'};//if required
  //   Response response = await http.get(Uri.parse("${Env.URL_PREFIX}/list.php"),headers: headers);
  //
  //
  //   List<Customer> myModels;
  //   print(myModels);
  //   myModels=(json.decode(response.body) as List).map((i) =>
  //       Customer.fromJson(i)).toList();
  //   print(myModels.toString());
  //
  //   print(myModels);
  //
  //   return myModels;
  // }

  Future<List<Customer>> getStudentList() async {
    print('response');
    print(Uri.parse("${Env.URL_PREFIX}/list.php"));
    final headers = {'Content-Type': 'application/json'};//if required
    Response response = await http.get(Uri.parse("${Env.URL_PREFIX}/list.php"),headers: headers);
    // print(response.body);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    // print(items);

    // List<Customer> myModels;
    // myModels=(json.decode(response.body) as List).map((i) =>
    //     Customer.fromJson(i)).toList();
    // print(myModels.toString());

    List<Customer> customers = items.map<Customer>((json) {
      return Customer.fromJson(json);
    }).toList();

    print(customers);

    return customers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: studentListKey,
      appBar: AppBar(
        title: Text('Customer List'),
      ),
      body: Center(
        child: FutureBuilder<List<Customer>>(
          future: getStudentList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // By default, show a loading spinner.
            if (!snapshot.hasData) return CircularProgressIndicator();
            // Render Customer lists
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.view_list),
                    title: Text(
                      data.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Details(customer: data)),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return Create();
          }));
        },
      ),
    );
  }

  Future<void> reqbro() async {
    print('response');
    final uri = Uri.parse("${Env.URL_PREFIX}/list.php");
    final headers = {'Content-Type': 'application/json'};//if required
    Response getResponse = await get(uri, headers: headers);
    int statusCode = getResponse.statusCode;
    String responseBody = getResponse.body;
    print('response----' + responseBody);
  }


}