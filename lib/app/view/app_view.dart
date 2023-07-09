import 'package:authentication_repository/authentication_repository.dart';
import 'package:codeunion/authentication/authentication.dart';
import 'package:codeunion/home/home.dart';
import 'package:codeunion/l10n/l10n.dart';
import 'package:codeunion/login/login.dart';
import 'package:codeunion/splash/splash.dart';
import 'package:codeunion_ui/codeunion_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_repository/user_repository.dart';

/// This class is the main entry point for the CodeUnion app.
/// It creates a [RepositoryProvider] with an [AuthenticationRepository] and a
/// [UserRepository]. It creates a BlocProvider with an [AuthenticationBloc]
/// that uses the AuthenticationRepository and UserRepository.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: _authenticationRepository,
          userRepository: _userRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

/// This class is the root widget for the CodeUnion app
/// It then creates a [MaterialApp] widget with a [CODEUNIONTheme] theme.
/// The listener function for the `BlocListener` checks the status of the
/// [AuthenticationState] and pushes the appropriate page to the navigator
/// depending on the status.
class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: CODEUNIONTheme().lightTheme,
          //darkTheme: CODEUNIONTheme().darkTheme,
          navigatorKey: _navigatorKey,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) {
            return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthenticationStatus.authenticated:
                    _navigator.pushAndRemoveUntil<void>(
                      HomePage.route(),
                      (route) => false,
                    );
                  case AuthenticationStatus.unauthenticated:
                    _navigator.pushAndRemoveUntil<void>(
                      LoginPage.route(),
                      (route) => false,
                    );
                  case AuthenticationStatus.unknown:
                    break;
                }
              },
              child: child,
            );
          },
          onGenerateRoute: (_) => SplashPage.route(),
        );
      },
    );
  }
}
