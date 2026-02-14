import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:ui/component/notification_button/notification_button.dart';
import 'package:ui/theme/app_theme.dart';
import 'package:ui/theme/app_theme_data.dart';

@Preview(name: 'Notification Button', group: 'Component')
Widget previewNotificationButton() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: const Center(
          child: NotificationButton(),
        ),
      ),
    ),
  );
}
