import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';
import 'package:ui/hook/scaffold.dart';

/// スナックバー表示用のフック
///
/// 返り値の関数を呼び出すことで、SnackBar を表示できます。
/// マウント状態をチェックするため、安全にスナックバーを表示できます。
void Function(String message, {SnackbarType? type}) useSnackbar() {
  final context = useContext();
  final colorScheme = useColorScheme();
  final messenger = useScaffoldMessenger();

  return useCallback(
    (String message, {SnackbarType? type}) {
      if (!context.mounted) return;

      final backgroundColor = switch (type) {
        SnackbarType.success => colorScheme.primaryContainer,
        SnackbarType.error => colorScheme.errorContainer,
        SnackbarType.warning => colorScheme.tertiaryContainer,
        SnackbarType.info || null => colorScheme.surfaceContainerHighest,
      };

      final textColor = switch (type) {
        SnackbarType.success => colorScheme.onPrimaryContainer,
        SnackbarType.error => colorScheme.onErrorContainer,
        SnackbarType.warning => colorScheme.onTertiaryContainer,
        SnackbarType.info || null => colorScheme.onSurface,
      };

      messenger.showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(color: textColor),
          ),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
    },
    [],
  );
}

/// スナックバーの種類
enum SnackbarType {
  /// 成功メッセージ
  success,

  /// エラーメッセージ
  error,

  /// 警告メッセージ
  warning,

  /// 情報メッセージ
  info,
}
