import 'package:ecyc/login_and_register/forget_password/change_pass.dart';
import 'package:ecyc/login_and_register/forget_password/otp_proceed_page.dart';
import 'package:flutter/material.dart';

class GetEmail extends StatelessWidget {
  GetEmail({super.key});
  TextEditingController _EmailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock_outline_rounded,
            size: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Forgot password ? ',
            style: TextStyle(
                fontFamily: 'JosefinSans', color: Colors.black, fontSize: 27),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Please enter your Email Id and we 'll send you a link to get back into your account :",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail), hintText: 'Email Id'),
              controller: _EmailController,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(236, 13, 53, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                fixedSize: const Size(250, 50),
              ),
              onPressed: () {
                _EmailController.text == ""
                    ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please Enter a valid Email Id'),
                        behavior: SnackBarBehavior.floating,
                      ))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePass(
                                  email: _EmailController.text.trim(),
                                )));
              },
              child: Text('Send Update link'))
        ],
      )),
    );
  }
}
