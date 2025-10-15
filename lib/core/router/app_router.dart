import 'package:auto_route/auto_route.dart';
import 'package:dfa_media_flutter/core/router/app_router.gr.dart';

final router = AppRouter();

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          initial: true,
          path: '/home',
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          children: [
            CustomRoute(
              path: 'main',
              page: MainRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              path: 'shop',
              page: ShopRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              path: 'delivery',
              page: DeliveryRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              path: 'chat',
              page: ChatRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              path: 'empty',
              page: EmptyRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
          ],
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [];
}
