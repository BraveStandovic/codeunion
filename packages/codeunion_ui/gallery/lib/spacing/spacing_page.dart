import 'package:codeunion_ui/codeunion_ui.dart';
import 'package:flutter/material.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SpacingPage());
  }

  @override
  Widget build(BuildContext context) {
    const spacingList = [
      _SpacingItem(spacing: CODEUNIONSpacing.xxxs, name: 'xxxs'),
      _SpacingItem(spacing: CODEUNIONSpacing.xxs, name: 'xxs'),
      _SpacingItem(spacing: CODEUNIONSpacing.xs, name: 'xs'),
      _SpacingItem(spacing: CODEUNIONSpacing.sm, name: 'sm'),
      _SpacingItem(spacing: CODEUNIONSpacing.md, name: 'md'),
      _SpacingItem(spacing: CODEUNIONSpacing.lg, name: 'lg'),
      _SpacingItem(spacing: CODEUNIONSpacing.xlg, name: 'xlg'),
      _SpacingItem(spacing: CODEUNIONSpacing.xxlg, name: 'xxlg'),
      _SpacingItem(spacing: CODEUNIONSpacing.xxxlg, name: 'xxxlg'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Spacing')),
      body: ListView.builder(
        itemCount: spacingList.length,
        itemBuilder: (_, index) => spacingList[index],
      ),
    );
  }
}

class _SpacingItem extends StatelessWidget {
  const _SpacingItem({required this.spacing, required this.name});

  final double spacing;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CODEUNIONSpacing.sm),
      child: Row(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                color: CODEUNIONColors.black,
                width: CODEUNIONSpacing.xxs,
                height: CODEUNIONSpacing.lg,
              ),
              Container(
                width: spacing,
                height: CODEUNIONSpacing.lg,
                color: CODEUNIONColors.skyBlue,
              ),
              Container(
                color: CODEUNIONColors.black,
                width: CODEUNIONSpacing.xxs,
                height: CODEUNIONSpacing.lg,
              ),
            ],
          ),
          const SizedBox(width: CODEUNIONSpacing.sm),
          Text(name),
        ],
      ),
    );
  }
}
