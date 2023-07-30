import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_auth_app/screens/enter_otp.dart';

class NumberEnterScreen extends StatefulWidget {
  static String verify = "";

  @override
  State<NumberEnterScreen> createState() => _NumberEnterScreenState();
}

class _NumberEnterScreenState extends State<NumberEnterScreen> {
  var countryCode = "+964 ";

  var phoneNumber = "";

  final FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoading = false; //this is for loading button

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(60),
                child: Image.asset(
                  "assets/images/otp.jpg",
                  height: 300,
                  width: 300,
                ),
              ),
              Center(
                child: Text(
                  "Enter your phone Number and we \n      will send you an OTP code  ",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.lightBlue),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 24),
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.blue,
                          size: 35,
                        ),
                        hintText: "Enter Phone Number here...",
                        hintStyle: TextStyle(fontSize: 21)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: isLoading
                    ? CircularProgressIndicator()
                    : OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          elevation: MaterialStateProperty.all<double>(20),
                          fixedSize:
                              MaterialStateProperty.all(Size.fromHeight(50)),
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(width: 3, color: Colors.lightBlue),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber:
                                countryCode.trim() + phoneNumber.trim(),
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent:
                                (String verificationId, int? resendToken) {
                              NumberEnterScreen.verify = verificationId;
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                          Future.delayed(Duration(seconds: 4), () {
                            // Finish loading
                            setState(() {
                              isLoading = false;
                            });
                            GoRouter.of(context).go("/enterotp");
                          });
                        },
                        child: Text(
                          "Get the OTP",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    elevation: MaterialStateProperty.all<double>(20),
                    fixedSize: MaterialStateProperty.all(Size.fromHeight(50)),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(width: 3, color: Colors.lightBlue),
                    ),
                  ),
                  onPressed: () {
                    GoRouter.of(context).go("/");
                  },
                  child: Text(
                    "Back to the main screen",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
