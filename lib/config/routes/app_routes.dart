import 'package:design_pattern/features/books/presentation/pages/home.dart';
import 'package:design_pattern/features/books/presentation/pages/wishlist.dart';
import '../../profile.dart';
import '../../welcome.dart';
import '../../features/favourites/presentation/pages/favourite_books.dart';

class Routes{
  static const String home = '/home';
  static const String welcome = '/';
  static const String favourites = '/fav';
  static const String profile = '/profile';
}

final routes ={
  Routes.welcome : (context)=> const Welcome(),
  Routes.home :(context)=> const Home(),
  Routes.favourites :(context)=> const Wishlist(),
  Routes.profile :(context)=> const Profile(),
};