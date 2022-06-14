import 'package:flutter/material.dart';
import 'package:rest_api_app/controller/user_list_without_model.dart';
import 'package:rest_api_app/screens/home3.dart';

class HomeScreen4 extends StatefulWidget {
  const HomeScreen4({Key? key}) : super(key: key);

  @override
  State<HomeScreen4> createState() => _HomeScreen4State();
}

class _HomeScreen4State extends State<HomeScreen4> {
  List<dynamic> dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex JSON without Model'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getApiofUsers(dataList),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        var keyValue = dataList[index];
                        return Card(
                            child: Column(
                          children: [
                            ReusableRow(
                                title: "Name",
                                value: keyValue['name'].toString()),
                            ReusableRow(
                                title: "City",
                                value: keyValue['address']['city'].toString()),
                            ReusableRow(
                                title: "Geo Location",
                                value: keyValue['address']['geo'].toString()),
                          ],
                        ));
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
