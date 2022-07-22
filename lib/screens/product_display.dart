import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_app/controller/product_data_list_api.dart';
import 'package:rest_api_app/models/crypto_data.dart';
import 'package:rest_api_app/models/products_model.dart';

class HomeScreen5 extends StatefulWidget {
  const HomeScreen5({Key? key}) : super(key: key);

  @override
  State<HomeScreen5> createState() => _HomeScreen5State();
}

class _HomeScreen5State extends State<HomeScreen5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Very complex json'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<ProductsModel>(
            future: getAllProductsData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                log(snapshot.data.toString());
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      var extendedLinks = snapshot.data!.data![index];
                      var subs = extendedLinks.createdAt!;

                      log(subs.toString());

                      return Card(
                        child: Column(
                          children: [
                            Text(extendedLinks.sId.toString()),
                            ListTile(
                              title: Text(extendedLinks.name.toString()),
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.red));
                }
              }
            },
          )),
        ],
      ),
    );
  }
}
