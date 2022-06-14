import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rest_api_app/controller/user_list.dart';
import 'package:rest_api_app/models/user_model.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({Key? key}) : super(key: key);

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  final List<UserModel> userList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NestedAPI")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUsersApi(userList),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: ((context, index) {
                        var userInfo = snapshot.data![index];

                        //getting company details which is nested in main model.
                        return Card(
                            color: const Color.fromARGB(255, 203, 250, 214),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Contact Details',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  ReusableRow(
                                      title: "Name",
                                      value: userInfo.name.toString()),
                                  ReusableRow(
                                      title: "Email",
                                      value: userInfo.email.toString()),
                                  ReusableRow(
                                      title: "Phone",
                                      value: userInfo.phone.toString()),
                                  const Divider(),
                                  const Text(
                                    'Address',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(userInfo.address!.suite.toString()),
                                  Text(userInfo.address!.street.toString()),
                                  Text(userInfo.address!.city.toString()),
                                  Text(userInfo.address!.zipcode.toString()),
                                  ReusableRow(
                                      title: "Geo",
                                      value:
                                          "Lat: ${userInfo.address!.geo!.lat.toString()}\nLng: ${userInfo.address!.geo!.lng.toString()}"),
                                ],
                              ),
                            ));
                      }),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
