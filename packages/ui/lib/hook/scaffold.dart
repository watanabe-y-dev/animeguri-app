import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// ScaffoldMessenger を取得するフック
ScaffoldMessengerState useScaffoldMessenger() {
  final context = useContext();
  return ScaffoldMessenger.of(context);
}
