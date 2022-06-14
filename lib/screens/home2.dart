import 'package:flutter/material.dart';
import 'package:rest_api_app/controller/photo_list_generator.dart';

class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({Key? key}) : super(key: key);

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {
  List<Photos> photosList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: const Text('Intermediate API -2 ')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: PhotoList().getPhotos(photosList),
              //by providing data type as AsyncSnapshot<List<Photos>> to snapshot,
              //snapshot will give you access to the model "Photos".
              builder: ((context, AsyncSnapshot<List<Photos>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: photosList.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          child: ListTile(
                            //now instead of photoList[index], we can use the following
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    snapshot.data![index].url.toString())),
                            title: Text(snapshot.data![index].title.toString()),
                            trailing: Text(snapshot.data![index].id.toString()),
                          ),
                        );
                      }));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}

class Photos {
  String title, url;
  int id;

  //constructor
  Photos({required this.title, required this.url, required this.id});
}
