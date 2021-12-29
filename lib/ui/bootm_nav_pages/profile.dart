import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController? _firstNameController;
  TextEditingController? _lastNameController;
  TextEditingController? _emailController;
  TextEditingController? _dobController;

  setDataToTextField(data) {
    return Column(
      children: [
        TextFormField(
          controller: _firstNameController =
              TextEditingController(text: data['first-name']),
        ),
        TextFormField(
          controller: _lastNameController =
              TextEditingController(text: data['last-name']),
        ),
        TextFormField(
          controller: _emailController =
              TextEditingController(text: data['email']),
        ),
        TextFormField(
          controller: _dobController = TextEditingController(text: data['dob']),
        ),
        ElevatedButton(
            onPressed: () => updateData(), child: const Text("Update"))
      ],
    );
  }

  updateData() {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("user-registration-data");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.email).update({
      "first-name": _firstNameController!.text,
      "last-name": _lastNameController!.text,
      "email": _emailController!.text,
      "dob": _dobController!.text,
    }).then((value) => print("Updated Successfully"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("user-registration-data")
              .doc(FirebaseAuth.instance.currentUser!.email)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var data = snapshot.data;
            if (data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return setDataToTextField(data);
          },
        ),
      )),
    );
  }
}
