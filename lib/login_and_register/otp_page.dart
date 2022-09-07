import 'package:ecyc/Screens/home.dart';
import 'package:ecyc/login_and_register/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(
            'OTP Verification',
            style: TextStyle(color: Colors.black, fontSize: 23),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Image.asset('images/otp.jpg'),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 5),
                child: Text(
                  'Verification Code',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  'We have sent the code verification to',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  'your mobile number',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
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
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ElevatedButton(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(30)),
                    // padding: EdgeInsets.all(0.0),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 211, 148, 245),
                              Color.fromARGB(255, 102, 15, 202),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                      child: Container(
                        height: 50,
                        width: 300,
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
