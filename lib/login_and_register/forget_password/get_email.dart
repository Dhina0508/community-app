import 'package:ecyc/login_and_register/forget_password/change_pass.dart';
import 'package:ecyc/login_and_register/forget_password/otp_proceed_page.dart';
import 'package:flutter/material.dart';

class GetEmail extends StatelessWidget {
  GetEmail({super.key});
  TextEditingController _EmailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Your Email Address')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter the email that you used while you created your account'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: TextField(
              controller: _EmailController,
            )),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePass(
                              email: _EmailController.text.trim(),
                            )));
              },
              child: Text('Proceed'))
        ],
      )),
    );
  }
}