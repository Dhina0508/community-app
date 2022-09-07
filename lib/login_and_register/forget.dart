import 'package:ecyc/dimensions/dimensions.dart';
import 'package:ecyc/login_and_register/loginpage.dart';
import 'package:ecyc/login_and_register/otp_page.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.arrow_back, size: 30, color: Colors.black)),
        ),
        body: Ink(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 236, 5, 5),
              Color.fromARGB(234, 216, 114, 216),
              Color.fromARGB(236, 91, 19, 159),
              Color.fromARGB(235, 51, 11, 120),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Login Account',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Hello,Welcome back to our app!',
                    style: TextStyle(color: Colors.black38, fontSize: 16),
                  ),
                  SizedBox(
                    height: 50 * 4,
                  ),
                  Text(
                    'Enter Mobile Number:',
                    style: TextStyle(color: Colors.black, fontSize: 12 * 2),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        controller: _controller,
                        decoration: InputDecoration(
                          prefix: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(
                              '+91',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          // prefix: Text(''),
                          suffixIcon: Icon(
                            Icons.phone_forwarded_rounded,
                            color: Color.fromARGB(255, 201, 106, 217),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: ElevatedButton(
                      // color: Color.fromARGB(255, 153, 54, 245),
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(30)),
                      // padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => OtpPage()));
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(30),
                            //  color: Color.fromARGB(255, 203, 177, 227)
                            ),
                        child: Text(
                          'Request OTP',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
