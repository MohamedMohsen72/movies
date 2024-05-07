import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:netfliex/core/Utils/color.dart';
import 'package:netfliex/core/Utils/text_styles.dart';
import 'package:netfliex/features/profile/view/user_setting.dart';
import 'package:netfliex/features/profile/view/widget/tile_widget.dart';

class ClientProfile extends StatefulWidget {
  const ClientProfile({Key? key}) : super(key: key);

  @override
  _ClientProfileState createState() => _ClientProfileState();
}

User? user;

File? file;

String? profilurl;

var imagePath;
Future<void> getuser() async {
  user = FirebaseAuth.instance.currentUser;
}

class _ClientProfileState extends State<ClientProfile> {
  // 1) instance from FirebaseStorage with bucket Url..
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: 'gs://movies-2ccf2.appspot.com');

  // method to upload and get link of image
  Future<String> uploadImageToFireStore(File image) async {
    //2) choose file location (path)
    var ref =
        _storage.ref().child('user/${FirebaseAuth.instance.currentUser!.uid}');
    //3) choose file type (image/jpeg)
    var metadata = SettableMetadata(contentType: 'image/jpeg');
    // 4) upload image to Firebase Storage
    await ref.putFile(image, metadata);
    // 5) get image url
    String url = await ref.getDownloadURL();
    return url;
  }

  Future<void> pickImage() async {
    getuser();
    final PickedFile =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (PickedFile != null) {
      setState(() {
        imagePath = PickedFile.path;
        file = File(PickedFile.path);
      });
    }
    profilurl = await uploadImageToFireStore(file!);
  }

  @override
  void initState() {
    super.initState();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(

          'Account',
        ),

        actions: [
          IconButton(
            splashRadius: 20,
            icon: Icon(
              Icons.settings,
              color: AppColor.whiteColor,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => const UserSettings()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('user')
                .doc(user?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var userData = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 62,
                                  backgroundColor: AppColor.primarycolor,
                                  child: CircleAvatar(
                                      backgroundColor: AppColor.whiteColor,
                                      radius: 60,
                                      backgroundImage: (imagePath != null)
                                          ? FileImage(File(imagePath))
                                              as ImageProvider
                                          : const AssetImage(
                                              'assets/logo.png',
                                            )),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await pickImage();
                                  },
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: const Icon(
                                      Icons.camera_alt_rounded,
                                      size: 20,
                                      // color: AppColors.color1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${userData!['name']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: getTextTitle(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          userData['phone'] ?? 'not added',
                          style: getTextbady(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(color: Colors.white),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "contact",
                          style:  getTextTitle(color: AppColor.whiteColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.whiteColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TileWidget(
                                  text: userData['email'] ?? 'not added',
                                  icon: Icons.email),
                              const SizedBox(
                                height: 25,
                              ),
                              TileWidget(
                                  text: userData['phone'] ?? 'not added',
                                  icon: Icons.call),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              );
            }),
      ),
    );
  }
}
