
import 'package:flutter/material.dart';
import 'package:design_pattern/Login.dart';
import 'package:design_pattern/features/registration/presentation/pages/SignUp.dart';

import 'core/utils/app_colors.dart';



class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize:const Size.fromHeight(180.0),
              child: Column(
                children: [
                  Text(
                      "Shopify", style: TextStyle(fontSize: 28, color: AppColor.primary , fontWeight: FontWeight.bold)),
                  const SizedBox(height: 100,),
                  TabBar(
                    indicatorColor: Colors.blue[700]!,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs:  [
                      Text("SIGN UP", style: TextStyle(fontSize: 20,color:AppColor.primary),),
                      Text("LOG IN", style: TextStyle(fontSize: 20,color: AppColor.primary),),

                    ],
                  ),
                ],
              ),
            ),
          ),
          // backgroundColor: Colors.brown.shade200,
          body:  TabBarView(
            children: [
              SignUp(registration: true),
              SignUp(registration: false,),
            //  Login(),
            ],
          )


      ),
    );
  }
}

