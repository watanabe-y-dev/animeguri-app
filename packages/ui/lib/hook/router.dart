import 'package:auto_route/auto_route.dart';
import 'package:ui/hook/mounted_context.dart';

StackRouter? Function() useAutoRouter() => useMountedContext(AutoRouter.of);

/// AutoRoute の StackRouter を取得するフック
///
/// ページ遷移を行う際に使用する
StackRouter? Function() useRouter() =>
    useMountedContext((context) => context.router);
