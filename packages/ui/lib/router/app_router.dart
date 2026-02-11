import 'package:auto_route/auto_route.dart';
import 'package:ui/pages.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'PageConsumer|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RootRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: ExploreRoute.page,
              initial: true,
            ),
            AutoRoute(
              page: MapRoute.page,
            ),
            AutoRoute(
              page: SavedRoute.page,
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
        AutoRoute(
          page: SampleRoute.page,
        ),
      ];
}
