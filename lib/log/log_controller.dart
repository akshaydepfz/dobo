import 'dart:developer';

class LogController {
  static void activityLog(String provider, String function, String status) {
    log("provider : $provider// Function : $function// Status : $status//");
  }
}
