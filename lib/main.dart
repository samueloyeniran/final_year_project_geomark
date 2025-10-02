import 'package:flutter/material.dart';
//import 'package:geomark/logics/login_logic.dart';
//import 'package:geomark/splashscreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geomark/components/SignInBox.dart';
import 'package:geomark/pages/Attendance_history.dart';
import 'package:geomark/pages/Auth/Signinpage.dart';
import 'package:geomark/pages/Auth/forgettenPasswordPage.dart';
import 'package:geomark/pages/Auth/registerPage.dart';
import 'package:geomark/pages/homePage.dart';
import 'package:geomark/pages/lectures/Lecturers_homePage.dart';
//import 'package:geomark/pages/lectures/Lecturers_homePage.dart';
import 'package:geomark/splashscreen.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  // await Supabase.initialize(
  //   url: 'https://jrlwvdcplzkcgsmrusfm.supabase.co',
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpybHd2ZGNwbHprY2dzbXJ1c2ZtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTg5MjExNjAsImV4cCI6MjA3NDQ5NzE2MH0.EAd3SXyWUDcX03jN-7iofEzZqO5_BcqbsNaBUvDGwvs',
  // );

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
    GoRoute(path: '/homePage', builder: (context, state) => Homepage()),
    GoRoute(path: '/scanner', builder: (context, state) => MobileScanner()),
    GoRoute(path: '/registerpage', builder: (context, state) => Registerpage()),
    GoRoute(
      path: '/forgotten_password',
      builder: (context, state) => Forgettenpasswordpage(),
    ),
    GoRoute(
      path: '/attendancehistory',
      builder: (context, state) => AttendanceHistory(),
    ),
    GoRoute(path: '/signinbox', builder: (context, state) => Signinbox()),
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Geomark',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: LecturersHomepage(),
        );
      },
    );
  }
}
