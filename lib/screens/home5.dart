import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_app/models/crypto_data.dart';

class HomeScreen5 extends StatefulWidget {
  const HomeScreen5({Key? key}) : super(key: key);

  @override
  State<HomeScreen5> createState() => _HomeScreen5State();
}

class _HomeScreen5State extends State<HomeScreen5> {
  Future<CryptoData> getCryptoData() async {
    var url = "https://webhook.site/6b261580-822a-4302-8c39-c3e6d8a4a987";
    final response = await http.get(Uri.parse(url));
    var cryptoData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CryptoData.fromJson(cryptoData);
    } else {
      return CryptoData.fromJson(cryptoData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Very complex json'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<CryptoData>(
            future: getCryptoData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.linksExtended!.length,
                  itemBuilder: (context, index) {
                    var extendedLinks = snapshot.data!.linksExtended![index];
                    var subs = extendedLinks.stats?.subscribers ?? 0;
                    var contributors = extendedLinks.stats?.contributors ?? 0;
                    var stars = extendedLinks.stats?.stars ?? 0;
                    var fans = extendedLinks.stats?.followers ?? 0;
                    log(subs.toString());

                    return Card(
                      child: Column(
                        children: [
                          Text(extendedLinks.type.toString()),
                          ListTile(
                            title: Text(extendedLinks.url.toString()),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(children: [
                                  const Text('Subs'),
                                  Text(subs.toString())
                                ]),
                                Column(children: [
                                  const Text('Stars'),
                                  Text(contributors.toString())
                                ]),
                                Column(children: [
                                  const Text('Grants'),
                                  Text(stars.toString())
                                ]),
                                Column(children: [
                                  const Text('Fans'),
                                  Text(fans.toString())
                                ]),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }
            },
          )),
        ],
      ),
    );
  }
}
