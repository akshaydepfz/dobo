import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/account_create_pop/screens/account_created.dart';
import 'package:dobo/view/appointment/screens/cancell_appointment.dart';
import 'package:dobo/view/appointment/screens/date_slot_select.dart';
import 'package:dobo/view/appointment/screens/patient_details.dart';
import 'package:dobo/view/appointment/screens/reschedule_appointment.dart';
import 'package:dobo/view/appointment/screens/review_summery.dart';
import 'package:dobo/view/appointment_animation/screens/bookind_success_pop.dart';
import 'package:dobo/view/appointment_animation/screens/booking_fail_pop.dart';
import 'package:dobo/view/article/screens/article_screen.dart';
import 'package:dobo/view/article/screens/article_view_screen.dart';
import 'package:dobo/view/booking_animation/screens/appointment_cancel_pop.dart';
import 'package:dobo/view/booking_animation/screens/reschedule_pop.dart';
import 'package:dobo/view/category/screens/category_screens.dart';
import 'package:dobo/view/category/screens/category_view.dart';
import 'package:dobo/view/clinic_view/screens/clinic_view_.screen.dart';
import 'package:dobo/view/doctor_view/screens/doctor_view.dart';
import 'package:dobo/view/enable_location/screens/enable_location_screen.dart';
import 'package:dobo/view/favorite/screens/favorite_screen.dart';
import 'package:dobo/view/forgot_password/screens/forgot_password_screen.dart';
import 'package:dobo/view/home/screens/home_screen.dart';
import 'package:dobo/view/landing_page/screens/landing_screen.dart';
import 'package:dobo/view/location_select/screens/location_select_screen.dart';
import 'package:dobo/view/my_appointments/screens/appointment_view.dart';
import 'package:dobo/view/my_appointments/screens/my_appointments_screen.dart';
import 'package:dobo/view/new_password_set/screens/change_password_screen.dart';
import 'package:dobo/view/new_password_set/screens/new_password_screen.dart';
import 'package:dobo/view/notification/screens/notification_screen.dart';
import 'package:dobo/view/onBoarding/screens/on_boarding_screen.dart';
import 'package:dobo/view/profile/screens/profile_edit.dart';
import 'package:dobo/view/profile/screens/profile_screen.dart';
import 'package:dobo/view/review/screens/review_screen.dart';
import 'package:dobo/view/review_animation/screen/review_pop.dart';
import 'package:dobo/view/review_animation/screen/session_end_pop.dart';
import 'package:dobo/view/signin/screens/signin_screen.dart';
import 'package:dobo/view/signup/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case RouteConstants.signInScreen:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case RouteConstants.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case RouteConstants.forgotScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen());
      case RouteConstants.newPassword:
        return MaterialPageRoute(builder: (context) => const NewPasswordSet());
      case RouteConstants.accountCreatePop:
        return MaterialPageRoute(
            builder: (context) => const AccountCreatedPop());
      case RouteConstants.enableLocation:
        return MaterialPageRoute(
            builder: (context) => const EnableLocationScreen());
      case RouteConstants.landingScreen:
        return MaterialPageRoute(builder: (context) => LandingScreen());

      case RouteConstants.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteConstants.categoryScreen:
        return MaterialPageRoute(builder: (context) => const CategoryScreen());
      case RouteConstants.appointmentsScreen:
        return MaterialPageRoute(
            builder: (context) => const MyAppointmentsScreen());
      case RouteConstants.favouriteScreen:
        return MaterialPageRoute(builder: (context) => const FavoriteScreen());
      case RouteConstants.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());

      case RouteConstants.clinicViewScreen:
        return MaterialPageRoute(
            builder: (context) => const ClinicViewScreen());
      case RouteConstants.categoryview:
        return MaterialPageRoute(
            builder: (context) => const CategoryViewScreen());
      case RouteConstants.doctorViewScreen:
        return MaterialPageRoute(
            builder: (context) => const DoctorViewScreen());
      case RouteConstants.dateSelectScreen:
        return MaterialPageRoute(
            builder: (context) => const DateSelectingScreen());
      case RouteConstants.patientScreen:
        return MaterialPageRoute(
            builder: (context) => const PatientDetailsScreen());
      case RouteConstants.reviewSummary:
        return MaterialPageRoute(
            builder: (context) => const ReviewSummaryScreen());
      case RouteConstants.bookingDonePop:
        return MaterialPageRoute(
            builder: (context) => const BookingSuccessPop());
      case RouteConstants.bookingFailPop:
        return MaterialPageRoute(builder: (context) => const BookingFailPop());
      case RouteConstants.appointmentView:
        return MaterialPageRoute(
            builder: (context) => const AppointmentViewScreen());
      case RouteConstants.resceduleAppointment:
        return MaterialPageRoute(builder: (context) => RescheduleAppointment());
      case RouteConstants.cancelAppointment:
        return MaterialPageRoute(builder: (context) => CancellAppointment());
      case RouteConstants.appointmentRescedulePop:
        return MaterialPageRoute(builder: (context) => const ReschedulePop());
      case RouteConstants.appointmentcancelPop:
        return MaterialPageRoute(
            builder: (context) => const AppointmentCancelPop());
      case RouteConstants.sessionEndPop:
        return MaterialPageRoute(builder: (context) => const SessionEndPop());
      case RouteConstants.editProfile:
        return MaterialPageRoute(builder: (context) => ProfileEditScreen());
      case RouteConstants.notificationScreen:
        return MaterialPageRoute(
            builder: (context) => const NotificationScreen());
      case RouteConstants.locationSelect:
        return MaterialPageRoute(builder: (context) => LocationSelectScreen());
      case RouteConstants.reviewScreen:
        return MaterialPageRoute(builder: (context) => const ReviewScreen());
      case RouteConstants.reviewPop:
        return MaterialPageRoute(builder: (context) => const ReviewPop());
      case RouteConstants.articleScreen:
        return MaterialPageRoute(builder: (context) => const ArticleScreen());
      case RouteConstants.articleViewScreen:
        return MaterialPageRoute(
            builder: (context) => const ArticleViewScreen());
      case RouteConstants.changePassword:
        return MaterialPageRoute(
            builder: (context) => const ChangePasswordScreen());

      default:
        return MaterialPageRoute<MaterialPageRoute>(
            builder: (context) => const OnBoardingScreen());
    }
  }
}
