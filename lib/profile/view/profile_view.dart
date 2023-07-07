import 'package:codeunion/authentication/bloc/authentication_bloc.dart';
import 'package:codeunion/l10n/l10n.dart';
import 'package:codeunion_ui/codeunion_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10 = context.l10n;
    return Column(
      children: [
        const SizedBox(height: CODEUNIONSpacing.lg),
        theme.icons.profileIcon(size: 64.h).paddingAll(CODEUNIONSpacing.lg),
        Builder(
          builder: (context) {
            final userId = context.select(
              (AuthenticationBloc bloc) => bloc.state.user.result.name,
              // (AuthenticationBloc bloc) => bloc.state.user.user.nickname,
            );
            return Text(
              userId,
              style: theme.textTheme.displaySmall,
            ).paddingSymmetric(horizontal: CODEUNIONSpacing.lg);
          },
        ),
        Builder(
          builder: (context) {
            final userId = context.select(
              // (AuthenticationBloc bloc) => bloc.state.user.user.email,
              (AuthenticationBloc bloc) => bloc.state.user.result.email,
            );
            return Text(
              userId,
            ).paddingSymmetric(
              horizontal: CODEUNIONSpacing.lg,
              vertical: CODEUNIONSpacing.md,
            );
          },
        ),
        Container(
          height: 55.h,
          padding: const EdgeInsets.symmetric(horizontal: CODEUNIONSpacing.xlg),
          width: double.infinity,
          alignment: Alignment.centerLeft,
          color: CODEUNIONColors.white,
          child: TextButton(
            child: Text(
              l10.logOut,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: CODEUNIONColors.red),
            ),
            onPressed: () async {
              await onLogout(context, l10).then(
                (value) {
                  if (value ?? false) {
                    context
                        .read<AuthenticationBloc>()
                        .add(AuthenticationLogoutRequested());
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future<bool?> onLogout(BuildContext context, AppLocalizations l10) {
    return showCupertinoDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(l10.confirmation),
          content: Text(l10.ruSure),
          actions: [
            CupertinoDialogAction(
              child: Text(l10.no),
              onPressed: () {
                Navigator.pop(context, false); // Return false
              },
            ),
            CupertinoDialogAction(
              child: Text(l10.yes),
              onPressed: () {
                Navigator.pop(context, true); // Return true
              },
            ),
          ],
        );
      },
    );
  }
}
