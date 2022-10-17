import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class ChangePass extends StatelessWidget {
  var user;
  var email;
  ChangePass({this.user, this.email});
  @override
  Widget build(BuildContext context) {
    TextEditingController _NewPassword = new TextEditingController();
    TextEditingController _code = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                print(email);
                FirebaseAuth.instance
                    .sendPasswordResetEmail(email: email)
                    .then((value) => print('Email sent'))
                    .onError((error, stackTrace) => print(error));
              },
              child: Text('Send update link'))
        ],
      ),
    );
  }
}
