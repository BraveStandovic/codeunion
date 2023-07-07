import 'dart:async';

import 'package:codeunion/l10n/l10n.dart';
import 'package:codeunion/login/bloc/login_bloc.dart';
import 'package:codeunion_ui/codeunion_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state.status.isFailure) {
          unawaited(
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  content: Text(l10.authError),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            ),
          );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 175.h),
            _UsernameInput(),
            Divider(
              height: 0,
              color: CODEUNIONColors.brightGrey,
              indent: CODEUNIONSpacing.lg.h,
              endIndent: CODEUNIONSpacing.lg.h,
            ),
            _PasswordInput(),
            SizedBox(height: CODEUNIONSpacing.lg2.h),
            _LoginButton(),
            SizedBox(height: CODEUNIONSpacing.lg.h),
            _RegisterButton(),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return CODEUNIONTextField.userNameTextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          errorText:
              state.username.displayError != null ? l10.invalidLogin : null,
          hintText: l10.loginOrMail,
          contentPadding: EdgeInsets.symmetric(
            horizontal: CODEUNIONSpacing.lg.h,
            vertical: CODEUNIONSpacing.xlg.h,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CODEUNIONTextField.passwordTextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          errorText:
              state.password.displayError != null ? l10.invalidPassword : null,
          hintText: l10.password,
          contentPadding: EdgeInsets.symmetric(
            horizontal: CODEUNIONSpacing.lg.h,
            vertical: CODEUNIONSpacing.xlg.h,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10 = context.l10n;
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return SizedBox(
          height: CODEUNIONSpacing.xxxlg.h,
          width: double.infinity,
          child: state.status.isInProgress
              ? const CircularProgressIndicator().toCenter()
              : ElevatedButton(
                  key: const Key('loginForm_continue_raisedButton'),
                  onPressed: state.isValid
                      ? () {
                          context.read<LoginBloc>().add(const LoginSubmitted());
                        }
                      : null,
                  style: theme.elevatedButtonTheme.style,
                  child: Text(l10.signIn),
                ),
        ).paddingSymmetric(
          horizontal: CODEUNIONSpacing.lg,
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10 = context.l10n;
    return SizedBox(
      height: CODEUNIONSpacing.xxxlg.h,
      width: double.infinity,
      child: ElevatedButton(
        key: const Key('registerForm_continue_raisedButton'),
        onPressed: null,
        style: theme.elevatedButtonTheme.style,
        child: Text(l10.register),
      ),
    ).paddingSymmetric(
      horizontal: CODEUNIONSpacing.lg,
    );
  }
}
