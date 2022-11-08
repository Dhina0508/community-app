import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecyc/helper/dimensions.dart';
import 'package:ecyc/login_and_register/forget_password/forget.dart';
import 'package:ecyc/login_and_register/SignUp.dart';
import 'package:ecyc/login_and_register/phone_no_verification.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_helper/firebase_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
  var visible = "";

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  Service service = Service();

  @override
  Widget build(BuildContext context) {
    // print(
    //   "the current width is" + MediaQuery.of(context).size.width.toString());
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        'images/chennai.jpg',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
      SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      fontFamily: 'Cinzel', fontSize: 30, color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        label: Text('Enter Login Id'),
                        hintText: 'something@gmail.com',
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, right: 20, left: 20),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: passwordcontroller,
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        suffixIcon: visible == ""
                            ? InkWell(
                                onTap: () {
                                  _togglePasswordView();
                                  visible = "1";
                                },
                                child: Icon(
                                  Icons.visibility_off,
                                  size: 25,
                                ))
                            : InkWell(
                                onTap: () {
                                  _togglePasswordView();
                                  visible = "";
                                },
                                child: Icon(
                                  Icons.visibility,
                                  size: 25,
                                )),
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.keyboard,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Container(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('getEmail');
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ))),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: const Size(100, 50),
                    ),
                    // color: Color.fromRGBO(205, 189, 223, 1),
                    onPressed: () async {
                      setState(() {});
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      if (emailcontroller.text.isNotEmpty &&
                          passwordcontroller.text.isNotEmpty) {
                        service.loginUser(context, emailcontroller.text.trim(),
                            passwordcontroller.text);
                        pref.setString("email", emailcontroller.text.trim());
                      } else {
                        service.errorBox(context,
                            "Fields must not empty ,please provide valid email and password");
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10 / 2),
                      child: Container(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PhoneNoVerification()));
                              },
                              child: Text(
                                "Don't have an Account?   ",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ]));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
