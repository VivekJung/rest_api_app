import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  //storing path of image
  File? image;
  final _picker = ImagePicker();
  bool showingSpinner = false;

  //function to pick image
  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      log('No image selected');
    }
  }

  //Function to upload image
  Future uploadImage() async {
    setState(() {
      showingSpinner = true;
    });

    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var request = http.MultipartRequest('POST', uri);

    request.fields['title'] = 'Static title';

    var multipart = http.MultipartFile(
        // 'image' is a parameter name in Json where this image will be uploaded.
        'image',
        stream,
        length);
    request.files.add(multipart);

    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        showingSpinner = false;
      });
      log('image uploaded successfully');
    } else {
      setState(() {
        showingSpinner = false;
      });
      log('image failed to be uploaded');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showingSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Image Upload to Server'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                color: Colors.lightGreen,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 80),
                child: image == null
                    ? const Center(child: Text('Pick an Image'))
                    : Center(
                        child: Image.file(
                          File(image!.path).absolute,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton.icon(
                onPressed: () {
                  uploadImage();
                },
                icon: const Icon(Icons.image),
                label: const Text('Upload new image')),
          ],
        ),
      ),
    );
  }
}
