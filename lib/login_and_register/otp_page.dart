import 'package:ecyc/Screens/home.dart';
import 'package:ecyc/login_and_register/forget.dart';
import 'package:ecyc/login_and_register/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ForgotPage()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              )),
          title: Text(
            'OTP Verification',
            style: TextStyle(color: Colors.black, fontSize: 23),
          ),
          centerTitle: true,
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
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 5),
                  child: Text(
                    'Verification Code',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    'We have sent the code verification to',
                    style: TextStyle(fontSize: 16, color: Colors.black45),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    'your mobile number',
                    style: TextStyle(fontSize: 16, color: Colors.black45),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 18, left: 50, right: 50),
                  child: Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 57,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin1) {},
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white30),
                                hintText: '2',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 57,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin1) {},
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white30),
                                hintText: '1',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 57,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin1) {},
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white30),
                                hintText: '8',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 57,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin1) {},
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: '0',
                                hintStyle: TextStyle(color: Colors.white30),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Container(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
