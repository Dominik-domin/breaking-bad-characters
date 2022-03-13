// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return MaterialPageX<void>(routeData: routeData, child: const HomePage());
    },
    CharacterDetailsPageRoute.name: (routeData) {
      return MaterialPageX<void>(
          routeData: routeData, child: const CharacterDetailsPage());
    },
    CharactersListPageRoute.name: (routeData) {
      return MaterialPageX<void>(
          routeData: routeData, child: const CharactersListPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomePageRoute.name, path: '/'),
        RouteConfig(CharacterDetailsPageRoute.name,
            path: '/character-details-page'),
        RouteConfig(CharactersListPageRoute.name, path: '/characters-list-page')
      ];
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [CharacterDetailsPage]
class CharacterDetailsPageRoute extends PageRouteInfo<void> {
  const CharacterDetailsPageRoute()
      : super(CharacterDetailsPageRoute.name, path: '/character-details-page');

  static const String name = 'CharacterDetailsPageRoute';
}

/// generated route for
/// [CharactersListPage]
class CharactersListPageRoute extends PageRouteInfo<void> {
  const CharactersListPageRoute()
      : super(CharactersListPageRoute.name, path: '/characters-list-page');

  static const String name = 'CharactersListPageRoute';
}
