import 'package:codeunion/l10n/l10n.dart';
import 'package:codeunion_ui/codeunion_ui.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    return Text(l10.favorite).toCenter();
  }
}
