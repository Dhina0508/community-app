import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecyc/login_and_register/otp_page.dart';
import 'package:flutter/material.dart';

class PhoneNoVerification extends StatefulWidget {
  PhoneNoVerification({Key? key}) : super(key: key);

  @override
  State<PhoneNoVerification> createState() => _PhoneNoVerificationState();
}

class _PhoneNoVerificationState extends State<PhoneNoVerification> {
  String dialCodeDigits = "+91";
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Ink(
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
            child: SafeArea(
                child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Ink(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(221, 241, 32, 32),
                                Color.fromARGB(234, 219, 33, 219),
                                Color.fromARGB(210, 52, 18, 175),
                                Color.fromARGB(210, 52, 18, 175),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                        ),
                        child: Text(
                          'ECYC',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Cinzel',
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      width: 400,
                      height: 60,
                      child: CountryCodePicker(
                        onChanged: (country) {
                          setState(() {
                            dialCodeDigits = country.dialCode!;
                          });
                        },
                        initialSelection: "IN",
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        favorite: ["+91"],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Phone Number",
                            prefix: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(dialCodeDigits),
                            )),
                        maxLength: 12,
                        keyboardType: TextInputType.number,
                        controller: _controller,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OtpPage(
                                      phone: _controller.text,
                                      codeDigits: dialCodeDigits)));
                        },
                        child: Text('Next'),
                      ),
                    )
                  ]),
            )),
          ))
        ],
      ),
    );
  }
}
