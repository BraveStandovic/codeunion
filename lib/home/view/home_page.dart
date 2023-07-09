import 'package:codeunion/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This class is the home page for the CodeUnion app. It is a stateless widget
/// that uses the `BlocProvider` widget to provide a [HomeCubit] to its child
/// which manges the state of the home page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeTabs(),
    );
  }
}
