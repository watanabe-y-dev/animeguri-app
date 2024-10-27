import 'package:auto_route/auto_route.dart';
import 'package:presentation/hook/mounted_context.dart';

StackRouter? Function() useAutoRouter() => useMountedContext(AutoRouter.of);
