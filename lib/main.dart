import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:java_gem/app_theme.dart';
import 'package:java_gem/screens/HomeScreen.dart' show HomeScreen;
import 'package:java_gem/screens/WelcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state)=> WelcomeScreen()
      ),
      GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state)=> HomeScreen()
      )
    ]
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Java Gem',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      routerConfig: _router
    );
  }
}
