import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netfliex/core/Utils/color.dart';
import 'package:netfliex/core/Utils/text_styles.dart';
import 'package:netfliex/features/profile/view/widget/custom_buttom.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }

  List labelName = ["name", "phone", "email"];

  List value = ["name", "phone", "email"];

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            splashRadius: 25,
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.whiteColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: const Text('settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('user')
              .doc(user!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var userData = snapshot.data;
            return ListView(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                labelName.length,
                (index) => Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: InkWell(
                    splashColor: AppColor.greyColor,
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          var con = TextEditingController(
                              text: userData?[value[index]]?.isEmpty ?? true
                                  ? ''
                                  : userData?[value[index]]);
                          var form = GlobalKey<FormState>();
                          return SimpleDialog(
                            alignment: Alignment.center,
                            contentPadding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            children: [
                              Form(
                                key: form,
                                child: Column(
                                  children: [
                                    Text(
                                      'enter ${labelName[index]}',
                                      style: getTextbady(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: con,
                                      decoration: InputDecoration(
                                          fillColor: AppColor.greyColor,
                                          hintText: value[index]),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter ${labelName[index]}.';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomButton(
                                      text: 'save',
                                      onPressed: () {
                                        if (form.currentState!.validate()) {
                                          updateData(value[index], con.text);
                                        }
                                      },
                                      Function: () {},
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.greyColor,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 15),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              labelName[index],
                              style: getTextbady(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              userData?[value[index]]?.isEmpty ?? true
                                  ? ''
                                  : userData?[value[index]],
                              style: getTextbady(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> updateData(String key, value) async {
    FirebaseFirestore.instance.collection('user').doc(user!.uid).set({
      key: value,
    }, SetOptions(merge: true));
    if (key.compareTo('name') == 0) {
      await user?.updateDisplayName(value);
    }
    Navigator.pop(context);
  }
}
