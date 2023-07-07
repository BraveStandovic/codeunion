/// Abstract class for structure and handle
/// all endpoints in the application
abstract class APIEdnPoints {
  /// Base url of our domain
  static const baseUrl = 'https://apingweb.com';
  // static const baseUrl = 'http://45.10.110.181:8080';

  /// Login api for v1
  static const loginPath = '/api/login';
  // static const loginApi = '/api/v1/auth/login';
}
