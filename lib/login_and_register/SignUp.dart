import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isHidden = true;
  var visible = "";

  TextEditingController _Usernamecontroller = TextEditingController();

  TextEditingController _Emailcontroller = TextEditingController();

  TextEditingController _Passwordcontroller = TextEditingController();

  TextEditingController _RePasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Register',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Cinzel',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 75,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _Emailcontroller,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Enter valid Email Id ',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.person_add,
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
                  controller: _Passwordcontroller,
                  obscureText: _isHidden,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
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
                      filled: true,
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.lock_rounded,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, right: 20, left: 20),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _RePasswordcontroller,
                  obscureText: _isHidden,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
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
                      filled: true,
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.lock_rounded,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(236, 13, 53, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fixedSize: const Size(250, 50),
                  ),
                  onPressed: () {
                    if (_Passwordcontroller.text ==
                        _RePasswordcontroller.text) {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _Emailcontroller.text.trim(),
                              password: _Passwordcontroller.text.trim())
                          .then((value) =>
                              Navigator.of(context).pushNamed('register'))
                          .onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("ERROR ${error.toString()}"),
                          behavior: SnackBarBehavior.floating,
                        ));
                        print("ERROR ${error.toString()}");
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("ERROR : Passwords should be same"),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 19),
                  )),
              TextButton(
                  onPressed: () =>
                      [Navigator.of(context).popAndPushNamed('login_page')],
                  child: Text('Have an account?',
                      style: TextStyle(fontSize: 13, color: Colors.black)))
            ],
          )),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
