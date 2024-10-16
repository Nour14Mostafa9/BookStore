import 'package:design_pattern/features/books/presentation/pages/home.dart';
import '../../Profile.dart';
import '../../Welcome.dart';
import '../../features/favourites/presentation/pages/favourite_books.dart';

class Routes{
  static const String home = '/home';
  static const String welcome = '/';
  static const String favourtes = '/fav';
  static const String profile = '/profile';
}

final routes ={
  Routes.welcome : (context)=> const Welcome(),
  Routes.home :(context)=> const Home(),
  Routes.favourtes :(context)=> const FavouriteBooks(),
  Routes.profile :(context)=> const Profile(),
};