import 'package:flutter/material.dart';

/// Models:

/// Screens:
import '../screens/home/home_screen.dart';
import 'package:apnimandi_client/screens/login/login_screen.dart';

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:
import 'package:go_router/go_router.dart';

/// Entry Point:
final GoRouter goRouter = GoRouter(
  initialLocation: '/login',
  routes: <GoRoute>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (BuildContext context, GoRouterState state) =>
          const LoginScreen(),
    ),
  ],
  // errorBuilder: (context, state) => ErrorScreen(state.error),
);

/// GoRouter.of(context).go('/page2') OR context.go('/page2')
