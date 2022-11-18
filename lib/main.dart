import 'package:dobo/view/appointment/screens/date_slot_select.dart';
import 'package:dobo/view/appointment_animation/screens/bookind_success_pop.dart';
import 'package:dobo/view/appointment_animation/screens/booking_fail_pop.dart';
import 'package:dobo/view/category/screens/category_view.dart';
import 'package:dobo/view/category/services/category_service.dart';
import 'package:dobo/view/landing_page/services/bottom_nav_service.dart';
import 'package:dobo/view/location_select/screens/location_select_screen.dart';
import 'package:dobo/view/notification/screens/notification_screen.dart';
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
          title: 'DOBO',
          theme: ThemeData(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
            primarySwatch: Colors.cyan,
          ),
          home: const BookingFailPop()),
    );
  }
}
