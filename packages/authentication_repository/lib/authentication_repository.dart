import 'dart:async';

import 'package:data_provider/data_provider.dart';
import 'package:user_repository/user_repository.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final _http = ApiClient(baseUrl: APIEdnPoints.baseUrl);
  final _userRepository = UserRepository();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    final user = await _userRepository.getUser();
    if (user == null) {
      yield AuthenticationStatus.unauthenticated;
    } else {
      yield AuthenticationStatus.authenticated;
    }
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> bodyMap = <String, dynamic>{
        APIScheme.email: username,
        APIScheme.password: password,
      };
      final response = await _http.client.post(
        APIEdnPoints.loginPath,
        data: bodyMap,
        options: Options(contentType: Headers.jsonContentType),
      );
      if (response.statusCode == 200) {
        final user = User.fromJson(response.data);
        await _userRepository.setUser(user: user);
        _controller.add(AuthenticationStatus.authenticated);
      }
    } on DioException catch (e) {
      _controller.add(AuthenticationStatus.unauthenticated);
      throw e;
    } catch (e) {
      _controller.add(AuthenticationStatus.unauthenticated);
      throw e;
    }
  }

  void logOut() async {
    await _userRepository.setUser();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
