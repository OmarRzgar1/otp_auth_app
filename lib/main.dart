import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_auth_app/screens/after_otp_entered_screen.dart';
import 'package:otp_auth_app/screens/enter_number_screen.dart';
import 'package:otp_auth_app/screens/enter_otp.dart';
import 'package:otp_auth_app/screens/main_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: route.routeInformationParser,
      routeInformationProvider: route.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      routerDelegate: route.routerDelegate,
    );
  }

  GoRouter route = GoRouter(
    routes: [
      GoRoute(
        name: "main",
        path: "/",
        builder: (context, state) => MainScreen(),
      ),
      GoRoute(
        name: "phone",
        path: "/enterphone",
        builder: (context, state) => NumberEnterScreen(),
      ),
      GoRoute(
        name: "otp",
        path: "/enterotp",
        builder: (context, state) => enterOtpScreen(),
      ),
      GoRoute(
        name: "afterotp",
        path: "/afterotp",
        builder: (context, state) => afterOtpScreen(),
      ),
    ],
  );
}
