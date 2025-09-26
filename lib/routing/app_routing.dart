import 'package:flutter/material.dart';
import 'package:geomark/pages/SignInpage.dart';
import 'package:geomark/pages/Attendance_history.dart';
import 'package:geomark/pages/forgettenPasswordPage.dart';
import 'package:geomark/pages/homePage.dart';
import 'package:geomark/pages/mobile_Scanner.dart';
import 'package:geomark/pages/registerPage.dart';
import 'package:geomark/routing/paths.dart';
import 'package:geomark/routing/routing_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:geomark/splashscreen.dart';

class AppRouting {
  static final router = GoRouter(
    initialLocation: '/splashscreen',
    refreshListenable: RoutingNotifier(),
    redirect: (context, state) {
      return _redirect(context, state);
    },
    routes: <RouteBase>[
      GoRoute(path: '/', redirect: (context, state) => '/'),
      GoRoute(
        path: '/splashscreen',
        name: 'splashscreen',
        builder: (BuildContext context, GoRouterState state) {
          return const Splashscreen();
        },
      ),
      GoRoute(
        path: '/signinpage',
        name: 'signinpage',
        builder: (BuildContext context, GoRouterState state) {
          return Signinpage();
        },
      ),
      GoRoute(
        path: '/registerpage',
        name: 'registerpage',
        builder: (BuildContext context, GoRouterState state) {
          return Registerpage();
        },
      ),
      GoRoute(
        path: '/homepage',
        name: 'homepage',
        builder: (BuildContext context, GoRouterState state) {
          return const Homepage();
        },
      ),
      GoRoute(
        path: '/attendance_history',
        name: 'attendance-history',
        builder: (BuildContext context, GoRouterState state) {
          return const AttendanceHistory();
        },
      ),
      GoRoute(
        path: '/scanner',
        name: 'scanner',
        builder: (BuildContext context, GoRouterState state) {
          return const MobileScannerPage();
        },
      ),
      GoRoute(
        path: '/forgot_password',
        name: 'forgot-password',
        builder: (BuildContext context, GoRouterState state) {
          return const Forgettenpasswordpage();
        },
      ),
      GoRoute(
        path: '',
        name: 'forgot-password',
        builder: (BuildContext context, GoRouterState state) {
          return const Forgettenpasswordpage();
        },
      ),
    ],
  );

  static String? _redirect(BuildContext context, GoRouterState state) {
    // Implement your redirect logic
    // Return null for no redirection or a String path for redirection
    final isLoggedIn =
        false; // You should replace this with your actual auth check

    // If user is not logged in and trying to access protected routes
    if (!isLoggedIn && (state.fullPath == Paths.homepage.path)) {
      // Redirect to sign in page
      return '/signinpage';
    }

    // If user is logged in and trying to access auth pages
    if (isLoggedIn &&
        (state.fullPath == Paths.signinpage.path ||
            state.fullPath == Paths.registerpage.path)) {
      // Redirect to home page
      return '/homepage';
    }

    return null; // No redirect needed
  }
}
