import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:codeunion/login/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('LoginBloc', () {
    late LoginBloc loginBloc;
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      loginBloc = LoginBloc(authenticationRepository: authenticationRepository);
    });

    tearDown(() {
      loginBloc.close();
    });

    test('initial state is correct', () {
      expect(loginBloc.state, const LoginState());
    });

    blocTest<LoginBloc, LoginState>(
      'emits [valid state] when username is changed',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginUsernameChanged('test_username')),
      expect: () => [
        const LoginState(
          username: Username.dirty('test_username'),
          isValid: true,
        ),
      ],
    );

    group('LoginSubmitted', () {
      blocTest<LoginBloc, LoginState>(
        'emits [valid state] when password is changed',
        build: () => loginBloc,
        act: (bloc) => bloc.add(const LoginPasswordChanged('test_password')),
        expect: () => [
          const LoginState(
            password: Password.dirty('test_password'),
            isValid: true,
          ),
        ],
      );

      blocTest<LoginBloc, LoginState>(
        'emits [submissionInProgress, submissionSuccess] '
        'when login succeeds',
        setUp: () {
          when(
            () => authenticationRepository.logIn(
              username: 'username',
              password: 'password',
            ),
          ).thenAnswer((_) => Future<String>.value('user'));
        },
        build: () => LoginBloc(
          authenticationRepository: authenticationRepository,
        ),
        act: (bloc) {
          bloc
            ..add(const LoginUsernameChanged('username'))
            ..add(const LoginPasswordChanged('password'))
            ..add(const LoginSubmitted());
        },
        expect: () => const <LoginState>[
          LoginState(username: Username.dirty('username')),
          LoginState(
            username: Username.dirty('username'),
            password: Password.dirty('password'),
            isValid: true,
          ),
          LoginState(
            username: Username.dirty('username'),
            password: Password.dirty('password'),
            isValid: true,
            status: FormzSubmissionStatus.inProgress,
          ),
          LoginState(
            username: Username.dirty('username'),
            password: Password.dirty('password'),
            isValid: true,
            status: FormzSubmissionStatus.success,
          ),
        ],
      );
    });

    blocTest<LoginBloc, LoginState>(
      'emits [LoginInProgress, LoginFailure] when logIn fails',
      setUp: () {
        when(
          () => authenticationRepository.logIn(
            username: 'username',
            password: 'password',
          ),
        ).thenThrow(Exception('oops'));
      },
      build: () => LoginBloc(
        authenticationRepository: authenticationRepository,
      ),
      act: (bloc) {
        bloc
          ..add(const LoginUsernameChanged('username'))
          ..add(const LoginPasswordChanged('password'))
          ..add(const LoginSubmitted());
      },
      expect: () => const <LoginState>[
        LoginState(
          username: Username.dirty('username'),
        ),
        LoginState(
          username: Username.dirty('username'),
          password: Password.dirty('password'),
          isValid: true,
        ),
        LoginState(
          username: Username.dirty('username'),
          password: Password.dirty('password'),
          isValid: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        LoginState(
          username: Username.dirty('username'),
          password: Password.dirty('password'),
          isValid: true,
          status: FormzSubmissionStatus.failure,
        ),
      ],
    );
  });
}
