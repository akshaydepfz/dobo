import 'package:dobo/view/account_create_pop/screens/account_created.dart';
import 'package:dobo/view/enable_location/screens/enable_location_screen.dart';
import 'package:dobo/view/forgot_password/screens/forgot_password_screen.dart';
import 'package:dobo/view/landing_page/screens/landing_screen.dart';
import 'package:dobo/view/new_password_set/screens/new_password_screen.dart';
import 'package:dobo/view/signin/screens/signin_screen.dart';
import 'package:dobo/view/signin/services/signin_provider.dart';
import 'package:dobo/view/signup/screens/signup_screen.dart';
import 'package:dobo/view/signup/services/signup_service.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SigninProvider()),
        ChangeNotifierProvider(create: (_) => SignUpService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.cyan,
        ),
        home: const LandingScreen(),
      ),
    );
  }
}
