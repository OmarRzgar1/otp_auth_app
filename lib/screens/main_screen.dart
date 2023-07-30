import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'enter_number_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GoRouter router = GoRouter.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Image.asset(
                    "assets/images/otp.jpg",
                    width: 300,
                    height: 300,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70, left: 85, right: 85),
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
                      GoRouter.of(context).go("/enterphone");
                    },
                    child: Row(
                      children: [
                        Text(
                          "Go to next Page ",
                          style:
                              TextStyle(fontSize: 20, color: Colors.blue[700]),
                        ),
                        Icon(
                          Icons.arrow_right_alt_sharp,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
