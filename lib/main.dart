import 'package:breaking_bad_characters/config/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    App(),
  );
}

class App extends StatelessWidget {
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
