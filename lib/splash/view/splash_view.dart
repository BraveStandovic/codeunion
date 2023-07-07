import 'package:codeunion_ui/codeunion_ui.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Assets.images.logo
            .image(fit: BoxFit.contain)
            .paddingAll(CODEUNIONSpacing.xxxxlg),
        CircularProgressIndicator(),
      ]),
    );
  }
}
