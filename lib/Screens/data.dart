import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataContoller extends GetxController {
  DocumentSnapshot? mydocs;

  GetMyData() {
    FirebaseFirestore.instance
        .collection("User_Bio_Data")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .snapshots()
        .listen((event) {
      mydocs = event;
    });
    @override
    void onInit() {
      super.onInit();
      GetMyData();
    }
  }
}
