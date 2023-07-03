import 'package:dobo/router/app_router.dart';
import 'package:dobo/view/appointment/screens/patient_details.dart';
import 'package:dobo/view/appointment/services/booking_service.dart';
import 'package:dobo/view/appointment/services/patient_details_service.dart';
import 'package:dobo/view/appointment/services/reshedule_radio_button.dart';
import 'package:dobo/view/article/services/article_services.dart';
import 'package:dobo/view/category/services/category_service.dart';
import 'package:dobo/view/clinic_view/services/clinic_view_service.dart';
import 'package:dobo/view/doctor_view/services/doctor_details_service.dart';
import 'package:dobo/view/favorite/services/favorite_service.dart';
import 'package:dobo/view/forgot_password/services/password_service.dart';
import 'package:dobo/view/home/services/home_provider.dart';
import 'package:dobo/view/landing_page/screens/landing_screen.dart';
import 'package:dobo/view/landing_page/services/bottom_nav_service.dart';
import 'package:dobo/view/location_select/services/location_select_service.dart';
import 'package:dobo/view/notification/services/notification_service.dart';
import 'package:dobo/view/profile/services/profile_services.dart';
import 'package:dobo/view/otp/screens/signin_screen.dart';
import 'package:dobo/view/otp/services/signin_provider.dart';
import 'package:dobo/view/profile_create/services/signup_service.dart';
import 'package:dobo/view/search/services/search_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/appointment/screens/add_relative_screen.dart';
import 'view/my_appointments/services/appointment_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  String token = pref.getString('accessToken') ?? "";
  runApp(
    MyApp(token: token),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.token});
  final String token;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SigninProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileCreateProvider(),
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
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileService(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppointmentService(),
        ),
        ChangeNotifierProvider(
          create: (_) => PasswordService(),
        ),
        ChangeNotifierProvider(
          create: (_) => ClinicDetailsService(),
        ),
        ChangeNotifierProvider(
          create: (_) => DoctorDetailService(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationService(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppointmentService(),
        ),
        ChangeNotifierProvider(
          create: (_) => ArticleService(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocationSelectService(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BookingService(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchService(),
        ),
        ChangeNotifierProvider(
          create: (_) => PatientDetailsProvider(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRoute().onGenerateRoute,
        debugShowCheckedModeBanner: false,
        title: 'DOBO',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.cyan,
        ),
        home: token == "" ? const SignInScreen() : const PatientDetailsScreen(),
      ),
    );
  }
}
