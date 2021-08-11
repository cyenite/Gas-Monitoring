class AppUrl {
  static const String liveBaseURL = "https://41.89.227.168:5001";
  static const String baseURL = liveBaseURL;

  static const String login = baseURL + "/api/user/login";
  static const String getToken = baseURL + "/api/identity/token";
  static const String register = baseURL + "/api/identity/user";
  static const String forgotPassword =
      baseURL + "/api/identity/user/forgot-password";
}
