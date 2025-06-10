import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaloria/screens/add.dart';
import 'package:kaloria/screens/scan.dart';
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
        GoRoute(path: '/add', builder: (context, state) => AddPage()),
        GoRoute(path: '/scan', builder: (context, state) => ScanPage()),
      ],
    ),
  ],
);
