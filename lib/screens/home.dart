import 'package:flutter/material.dart';
import 'package:rest_api_app/controller/user_posts_list.dart';
import 'package:rest_api_app/models/user_posts_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //you have to create your own list if the response doesn't have array name.
  List<UserPostsModel> postList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Intermediate API"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserPostsApi(postList),
              builder: ((context, snapshot) {
                //checking if snapshot has data or not
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        height: 60,
                        child: Card(
                          shadowColor: Colors.amber,
                          child: ListTile(
                            title: Text(
                              postList[index].title.toString(),
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            ),
                            leading: Text(postList[index].id.toString()),
                            // subtitle: Text(postList[index].body.toString()),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.view_array,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
