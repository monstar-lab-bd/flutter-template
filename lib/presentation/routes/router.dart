import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: SplashRoute.page),
    AutoRoute(
      path: '/dashboard',
      page: MainRoute.page,
      children: [
        AutoRoute(path: '', page: HomeRoute.page),
        AutoRoute(path: 'news', page: NewsRoute.page),
        AutoRoute(path: 'profile', page: ProfileRoute.page),
      ],
    ),
  ];
}
