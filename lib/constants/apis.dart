// ignore_for_file: prefer_interpolation_to_compose_strings

/// [Apis] holds all api endpoints
class Apis {
  static const baseUrl = 'http://192.168.43.134:3000';

  static const verifyToken = baseUrl + '/api/token/verify';

  static const signUp = baseUrl + '/api/signup';
  static const signIn = baseUrl + '/api/signin';

  static const user = baseUrl + '/user';
}
