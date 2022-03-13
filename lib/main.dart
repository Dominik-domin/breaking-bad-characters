import 'package:breaking_bad_characters/config/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

// assuing this is the root widget of your App
class App extends StatelessWidget {
  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (context, router) => router!,
    );
  }
}
