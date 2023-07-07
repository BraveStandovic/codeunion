import 'package:codeunion_ui/codeunion_ui.dart';
import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AppBarPage());
  }

  @override
  State<AppBarPage> createState() => _AppBarPage();
}

class _AppBarPage extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    const contentSpacing = CODEUNIONSpacing.sm;
    final appBarList = [
      const SizedBox(height: contentSpacing),
      CODEUNIONAppBar.redAppBar(
        textTitle: 'Red AppBar',
      ),
      const SizedBox(height: contentSpacing),
      CODEUNIONAppBar.actionAppBar(
        textTitle: 'Action AppBar',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('App Assets')),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: appBarList.map((appBar) {
              return appBar;
            }).toList(),
          ),
        ),
      ),
    );
  }
}
