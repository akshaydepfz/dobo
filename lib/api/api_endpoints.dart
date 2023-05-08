class ApiEndpoints {
  static const baseUrl = "https://dobo.co.in";
  static const login = '$baseUrl/api/token/';
  static const register = "$baseUrl/api/v1/accounts/register/";
  static const nearestClinic = 'https://dobo.co.in/api/v1/clinics/clinics/nearest/?location=10.54,76.58';
  static const restPassword = '$baseUrl/api/v1/accounts/forgot-password/';
  static const profileDetailsGet = '$baseUrl/api/v1/accounts/profile';
}
