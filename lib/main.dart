import 'package:dobo/view/account_create_pop/screens/account_created.dart';
import 'package:dobo/view/appointment_animation/screens/bookind_success_pop.dart';
import 'package:dobo/view/appointment_animation/screens/booking_fail_pop.dart';
import 'package:dobo/view/booking_animation/screens/appointment_cancel_pop.dart';
import 'package:dobo/view/booking_animation/screens/reschedule_pop.dart';
import 'package:dobo/view/category/services/category_service.dart';
import 'package:dobo/view/clinic_view/screens/clinic_view_.screen.dart';
import 'package:dobo/view/landing_page/screens/landing_screen.dart';
import 'package:dobo/view/landing_page/services/bottom_nav_service.dart';
import 'package:dobo/view/review_animation/screen/review_pop.dart';
import 'package:dobo/view/review_animation/screen/session_end_pop.dart';
import 'package:dobo/view/signin/services/signin_provider.dart';
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
        ChangeNotifierProvider(
          create: (_) => SigninProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpService(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomNavService(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.cyan,
        ),
        home:SessionEndPop()
      ),
    );
  }
}
