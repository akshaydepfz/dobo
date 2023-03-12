import 'package:dobo/repository/clincList.dart';
import 'package:dobo/view/appointment/services/reshedule_radio_button.dart';
import 'package:dobo/view/category/screens/category_screens.dart';
import 'package:dobo/view/category/services/category_service.dart';
import 'package:dobo/view/clinic_view/screens/clinic_view_.screen.dart';
import 'package:dobo/view/home/screens/home_screen.dart';
import 'package:dobo/view/landing_page/screens/landing_screen.dart';
import 'package:dobo/view/landing_page/services/bottom_nav_service.dart';
import 'package:dobo/view/my_appointments/screens/appointment_view.dart';
import 'package:dobo/view/signin/screens/signin_screen.dart';
import 'package:dobo/view/signin/services/signin_provider.dart';
import 'package:dobo/view/signup/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controller/clinc_list_controller/clinicList.dart';

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
        ),
        ChangeNotifierProvider(
          create: (_) => RescheduleRadioService(),
        ),
        ChangeNotifierProvider(
          create: (_) => clincService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
<<<<<<< HEAD
        title: 'DOBO Booking',
=======
        title: 'Dobo',
>>>>>>> main
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.cyan,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
