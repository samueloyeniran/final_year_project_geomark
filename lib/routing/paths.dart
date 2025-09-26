import 'package:geomark/splashscreen.dart';

class Path {
  const Path({required this.path, required this.name});

  // Path string
  final String path;

  // Route name
  final String name;
}

class Paths {
  static const splashscreen = Path(path: '/splashscreen', name: 'splashscreen');
  static const signinpage = Path(path: '/signinpage', name: 'signinpage');
  static const registerpage = Path(path: '/registerpage', name: 'registerpage');
  static const homepage = Path(path: '/homepage', name: 'homepage');
  static const attendanceHistory = Path(
    path: '/attendance-history',
    name: 'attendance-history',
  );
  static const scanner = Path(path: '/scanner', name: 'scanner');
  static const forgotPassword = Path(
    path: '/forgot-password',
    name: 'forgot-password',
  );
}
