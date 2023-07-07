import 'package:codeunion_ui/codeunion_ui.dart';
import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const TextFieldPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Text Field',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CODEUNIONSpacing.lg),
        child: Column(
          children: [
            CODEUNIONTextField.emailTextField(
              onChanged: (_) {},
            ),
            const SizedBox(height: CODEUNIONSpacing.sm),
            CODEUNIONTextField.passwordTextField(
              onChanged: (_) {},
            ),
            const SizedBox(height: CODEUNIONSpacing.sm),
            CODEUNIONTextField(
              hintText: 'Default text field',
              onChanged: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}
