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
      final args = routeData.argsAs<CharacterDetailsPageRouteArgs>();
      return MaterialPageX<void>(
          routeData: routeData,
          child:
              CharacterDetailsPage(key: args.key, character: args.character));
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
class CharacterDetailsPageRoute
    extends PageRouteInfo<CharacterDetailsPageRouteArgs> {
  CharacterDetailsPageRoute({Key? key, required Character character})
      : super(CharacterDetailsPageRoute.name,
            path: '/character-details-page',
            args:
                CharacterDetailsPageRouteArgs(key: key, character: character));

  static const String name = 'CharacterDetailsPageRoute';
}

class CharacterDetailsPageRouteArgs {
  const CharacterDetailsPageRouteArgs({this.key, required this.character});

  final Key? key;

  final Character character;

  @override
  String toString() {
    return 'CharacterDetailsPageRouteArgs{key: $key, character: $character}';
  }
}

/// generated route for
/// [CharactersListPage]
class CharactersListPageRoute extends PageRouteInfo<void> {
  const CharactersListPageRoute()
      : super(CharactersListPageRoute.name, path: '/characters-list-page');

  static const String name = 'CharactersListPageRoute';
}
