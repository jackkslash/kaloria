import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaloria/screens/add.dart';
import 'package:kaloria/screens/scan.dart';
import 'package:kaloria/widgets/expanded_bottom_nav.dart';
import 'package:kaloria/screens/home.dart';
import 'package:kaloria/utils/curver_drawer.dart'; // Import the CurvedCornerPainter

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AppBar(
                  backgroundColor: Colors.black,
                  toolbarHeight:
                      75, // Make sure toolbarHeight matches preferredSize
                  elevation: 0, // Remove the default shadow
                ),
                Positioned(
                  bottom: -75, // Position the curve at the bottom
                  left: 0,
                  right: 0,
                  child: Row(
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(
                          3.14159,
                        ), // 180 degrees in radians
                        child: CustomPaint(
                          size: const Size(75, 75),
                          painter: CurvedCornerPainter(),
                        ),
                      ),
                      const Spacer(),
                      Transform.flip(
                        flipX: true,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationX(
                            3.14159,
                          ), // 180 degrees in radians
                          child: CustomPaint(
                            size: const Size(75, 75),
                            painter: CurvedCornerPainter(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
