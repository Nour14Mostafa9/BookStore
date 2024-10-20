
import 'package:design_pattern/core/utils/app_strings.dart';
import 'package:design_pattern/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'core/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    navToSign();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                 Animate(child: Image.asset("assets/Book.png",width: 200,height: 180,).animate().scaleX(duration: 500.ms)),
                  const SizedBox(height: 15,),
                  Animate(
                      child: GradientText(
                        AppStrings.appName, style:const TextStyle(fontSize: 30,  fontWeight: FontWeight.bold),colors: [AppColor.primary,AppColor.shadesColor],).animate().fade(duration: 3500.ms)),
                ])

        )
    );
  }

  void navToSign()async {
    await Future.delayed(const Duration(milliseconds: 6000),(){
    });
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const Welcome()));

  }

}