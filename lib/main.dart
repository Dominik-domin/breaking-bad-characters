import 'package:breaking_bad_characters/bloc/characters/characters_bloc.dart';
import 'package:breaking_bad_characters/config/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharactersBloc()
            ..add(
              LoadCharactersFromNetworkEvent(),
            ),
        ),
      ],
      child: App(),
    ),
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
