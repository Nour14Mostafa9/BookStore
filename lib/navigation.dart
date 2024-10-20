
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:design_pattern/core/utils/app_colors.dart';
import 'package:design_pattern/features/books/presentation/pages/home.dart';
import 'package:design_pattern/profile.dart';
import 'package:design_pattern/features/books/presentation/pages/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  late String name;


  int selectedPage=0;
  List <Widget> pages=[
    Home(name: ""),
    const Wishlist(),
    const Profile(name: ""),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();

  }

  Future <void> getUserName()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = preferences.getString("UserName")??"User";
    pages = [
      Home(name: name),
      const Wishlist(),
      Profile(name: name),
    ];
  }

  @override
  Widget build(BuildContext context) {

    Color backgroundColor =AppColor.lightMode;
    Color navBarColor =AppColor.lightMode;
    Color buttonBackgroundColor =AppColor.lightMode;

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    backgroundColor = isDarkMode ? AppColor.darkMode : AppColor.lightMode;
    navBarColor = isDarkMode ? AppColor.darkMode : AppColor.lightMode;
    buttonBackgroundColor = isDarkMode ? AppColor.darkMode : AppColor.lightMode;


    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index:selectedPage ,
        backgroundColor:backgroundColor,
        color:navBarColor,
        buttonBackgroundColor: buttonBackgroundColor,
        height: 60,
        animationDuration:const Duration(milliseconds: 300),
        onTap: (index){
          setState(() {
            selectedPage=index;
          });
        },
        items:const [
          Icon(Icons.home),
          Icon(Icons.bookmark_outline),
       //   Icon(Icons.wallet_rounded),
          Icon(Icons.person),
        ],
      ),
        body: pages.elementAt(selectedPage),
    );
  }
}
