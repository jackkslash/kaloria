import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaloria/screens/settings.dart';
import 'package:kaloria/widgets/expanded_bottom_nav.dart';
import 'package:kaloria/screens/home.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: ExpandableBottomNav(),
        );
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => HomePage()),
        GoRoute(path: '/settings', builder: (context, state) => SettingPage()),
      ],
    ),
  ],
);
