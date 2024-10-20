import 'package:design_pattern/navigation.dart';
import 'package:design_pattern/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Routes{
  static const String home = '/home';
  static const String welcome = '/';
  static const String profile = '/profile';
}

final routes ={
  Routes.welcome : (context)=> FirebaseAuth.instance.currentUser == null? const SplashScreen():const Navigation(),
};