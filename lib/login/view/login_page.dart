import 'package:authentication_repository/authentication_repository.dart';
import 'package:codeunion/l10n/l10n.dart';
import 'package:codeunion/login/bloc/login_bloc.dart';
import 'package:codeunion/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10.authentication)),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationRepository:
                RepositoryProvider.of<AuthenticationRepository>(context),
          );
        },
        child: const LoginForm(),
      ),
    );
  }
}
