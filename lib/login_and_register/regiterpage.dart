import 'package:ecyc/dimensions/dimensions.dart';
import 'package:ecyc/firebase_helper/firebase_helper.dart';
import 'package:ecyc/login_and_register/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  Service service = Service();
  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('images/rain.jpg'), fit: BoxFit.cover)
        //         ),
        child: Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.arrow_back))),
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 75),
          child: Column(
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Register Here',
                style: TextStyle(
                    color: Color.fromRGBO(205, 189, 223, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.25,
                right: 35,
                left: 35),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Enter Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Enter Email Id',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  obscureText: true,
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Enter Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Re-Enter Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text('Sign In',
                          style: TextStyle(
                              color: Color.fromARGB(255, 214, 184, 248),
                              fontSize: 26,
                              fontWeight: FontWeight.w700)),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromRGBO(205, 189, 223, 1),
                      child: IconButton(
                          color: Colors.white,
                          onPressed: () async {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            if (_emailcontroller.text.isNotEmpty &&
                                _passwordcontroller.text.isNotEmpty) {
                              service.createUser(
                                  context,
                                  _emailcontroller.text.toString().trim(),
                                  _passwordcontroller.text);
                              pref.setString("email",
                                  _emailcontroller.text.toString().trim());
                            } else {
                              service.errorBox(context,
                                  "Fields must not empty ,please provide valid email and password");
                            }
                          },
                          icon: Icon(Icons.arrow_forward)),
                    )
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
