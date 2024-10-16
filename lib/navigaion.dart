
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:design_pattern/features/books/presentation/pages/home.dart';
import 'package:design_pattern/Order.dart';
import 'package:design_pattern/Profile.dart';
import 'package:design_pattern/features/books/presentation/pages/wishlist.dart';
import 'package:flutter/material.dart';


class Navigation extends StatefulWidget {
  final bool isAdmin;
  const Navigation({super.key, required this.isAdmin});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {


   var isAdmin = false;
  int selectedPage=0;
  List <Widget> pages = const[
    Home(),
    Wishlist(),
    Order(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        index:selectedPage ,
        backgroundColor:Colors.white,
        color:Colors.white,
        buttonBackgroundColor: Colors.white10,
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
          Icon(Icons.wallet_rounded),
          Icon(Icons.person),
        ],
      ),
        body: pages.elementAt(selectedPage),
    );
  }
}
