import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Center(
        child: Text('Account Page'),
      ),
    );
  }
}
