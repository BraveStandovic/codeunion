// ignore_for_file: prefer_const_constructors

import 'package:codeunion/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginPage', () {
    test('is routable', () {
      expect(LoginPage.route(), isA<MaterialPageRoute<void>>());
    });
  });
}
