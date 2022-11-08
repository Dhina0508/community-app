import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecyc/login_and_register/SignUp.dart';
import 'package:ecyc/login_and_register/otp_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PhoneNoVerification extends StatefulWidget {
  PhoneNoVerification({Key? key}) : super(key: key);

  @override
  State<PhoneNoVerification> createState() => _PhoneNoVerificationState();
}

class _PhoneNoVerificationState extends State<PhoneNoVerification> {
  String? VerificationCode;
  final TextEditingController _pinotpcontroller = TextEditingController();
  final FocusNode _pinotpfocusnode = FocusNode();

  verifyPhonenumber({@required phone, @required codeDigits}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "${codeDigits + phone}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            if (value.user != null) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message.toString()),
            duration: Duration(seconds: 3),
          ));
        },
        codeSent: (String vID, int? resentToken) {
          setState(() {
            VerificationCode = vID;
          });
        },
        codeAutoRetrievalTimeout: (String vID) {
          setState(() {
            VerificationCode = vID;
          });
        },
        timeout: Duration(seconds: 60));
  }

  String dialCodeDigits = "+91";
  var otp = "";
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
          Image.asset(
            'images/chennai.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
            child: SafeArea(
                child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cinzel',
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                        width: 150,
                        height: 50,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(32, 244, 237, 237)),
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
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: TextField(
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            suffix: TextButton(
                                onPressed: () {
                                  verifyPhonenumber(
                                      codeDigits: dialCodeDigits,
                                      phone: _controller.text);
                                  setState(() {
                                    otp = "1";
                                  });
                                },
                                child: Text(
                                  'Send OTP',
                                  style: TextStyle(color: Colors.white),
                                )),
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                            prefix: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                dialCodeDigits,
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: _controller,
                      ),
                    ),
                    otp == "1"
                        ? Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                'Enter OTP : ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 20, left: 30, right: 30, bottom: 30),
                                  child: Pinput(
                                    closeKeyboardWhenCompleted: false,
                                    length: 6,
                                    focusNode: _pinotpfocusnode,
                                    controller: _pinotpcontroller,
                                    pinAnimationType: PinAnimationType.fade,
                                    onSubmitted: (pin) async {
                                      try {
                                        await FirebaseAuth.instance
                                            .signInWithCredential(
                                                PhoneAuthProvider.credential(
                                                    verificationId:
                                                        VerificationCode!,
                                                    smsCode: pin))
                                            .then((value) {
                                          if (value.user != null) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignUp()));
                                          }
                                        });
                                      } catch (e) {
                                        FocusScope.of(context).unfocus();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("Invalid OTP"),
                                          duration: Duration(seconds: 3),
                                        ));
                                      }
                                    },
                                    defaultPinTheme: PinTheme(
                                      width: 50,
                                      height: 50,
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                234, 239, 243, 1),
                                            width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  )),
                            ],
                          )
                        : Container()
                  ]),
            )),
          )
        ],
      ),
    );
  }
}
