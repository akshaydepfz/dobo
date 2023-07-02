class ApiEndpoints {
  static const baseUrl = "https://dobo.co.in";
  static const login = '$baseUrl/api/v1/accounts/login/';

  static const profileCreate = "$baseUrl/api/v1/continue/patient-setup/";
  static const nearestClinic =
      'https://dobo.co.in/api/v1/clinics/clinics/nearest/?location=10.54,76.58';
  static const restPassword = '$baseUrl/api/v1/accounts/forgot-password/';
  static const profileDetailsGet = '$baseUrl/api/v1/accounts/profile';
  static const clinicDetails = '$baseUrl/api/v1/clinics/clinics';
  static const clinicDoctorsList =
      '$baseUrl/api/v1/clinics/clinics/doctors/?clinic_id=';
  static const doctorDetails = '$baseUrl/api/v1/doctors/';
  static const locationPatch = '$baseUrl/api/v1/patients/';

  static const doctorReview = '$baseUrl/api/v1/doctors/reviews/?doctor_id=';
  static const notifications = '$baseUrl/api/v1/notifications/';
  static const appointmentList =
      '$baseUrl/api/v1/clinics/appointments/?status=';

  static const articlList = '$baseUrl/api/v1/articles/';
  static const trendingArticles =
      '$baseUrl/api/v1/articles/?date=&is_trending=true';

  static const doctorDepartmentfilter = '$baseUrl/api/v1/doctors/?department=';

  static const addFavClinic =
      '$baseUrl/api/v1/clinics/clinics/add_favorite/?clinic_id=';
  static const removeFavClinic =
      '$baseUrl/api/v1/clinics/clinics/remove_favorite/?clinic_id=';
  static const getDepartments = '$baseUrl/api/v1/departments/';
  static const slotes = '$baseUrl/api/v1/doctors/schedules/?doctor_id=';
  static const relativeAdd =
      '$baseUrl/api/v1/patients/add_relative/?patient_id=';
}
