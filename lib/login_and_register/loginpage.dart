import 'package:ecyc/dimensions/dimensions.dart';
import 'package:ecyc/login_and_register/forget.dart';
import 'package:ecyc/login_and_register/regiterpage.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_helper/firebase_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        'images/road.jpeg',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
      SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 75 * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //     height: 50,
                    //     width: 50,
                    //     child: Image.asset(
                    //       'images/logo.png',
                    //     )),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 3),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'ECYC',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 75,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Enter Login Id',
                        hintStyle: TextStyle(color: Colors.black),
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
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
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
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: ElevatedButton(
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
                      'Submit',
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
                          alignment: Alignment.topLeft,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgotPage()));
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10 / 2),
                      child: Container(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
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
}
