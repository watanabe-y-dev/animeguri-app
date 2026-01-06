import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

T? Function() useMountedContext<T>(
  T Function(BuildContext context) callback, {
  List<Object?> keys = const [],
}) {
  final context = useContext();
  return useCallback(
    () => context.mounted ? callback(context) : null,
    keys,
  );
}
