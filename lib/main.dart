import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:java_gem/app_theme.dart';
import 'package:java_gem/screens/coffee_details_screen.dart';
import 'package:java_gem/screens/home_screen.dart' show HomeScreen;
import 'package:java_gem/screens/order_screen.dart';
import 'package:java_gem/screens/welcome_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
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
      ),
      GoRoute(
          path: '/coffee/:coffee_name',
          builder: (BuildContext context, GoRouterState state){
            final name = state.pathParameters['coffee_name'];
            return CoffeeDetailsScreen(drinkName: name!);
          }
      ),
      GoRoute(
          path: '/order',
          builder: (BuildContext context, GoRouterState state)=> OrderScreen()
      ),
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
