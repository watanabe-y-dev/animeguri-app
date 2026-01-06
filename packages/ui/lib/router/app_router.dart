import 'package:auto_route/auto_route.dart';
import 'package:ui/export/page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RootRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(
              page: AccountRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: DebugHomeRoute.page,
        ),
        AutoRoute(
          page: DebugTypographyRoute.page,
        ),
      ];
}
