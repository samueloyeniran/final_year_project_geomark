import 'package:flutter/material.dart';
//import 'package:geomark/logics/login_logic.dart';
//import 'package:geomark/splashscreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geomark/pages/SignInpage.dart';
import 'package:geomark/pages/lectures/Lecturers_homePage.dart';
import 'package:geomark/splashscreen.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Splashscreen()),
    //GoRoute(path: "/home", builder: (context, state) => const Lecturers_homePage()),
    GoRoute(
      path: "/splashscreen",
      builder: (context, state) => const Splashscreen(),
    ),
    GoRoute(path: '/signinpage', builder: (context, state) => Signinpage()),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Geomark',
          theme: ThemeData(primarySwatch: Colors.blue),
          routerConfig: _router,
        );
      },
    );
  }
}
