
import 'package:flutter/material.dart';
import 'package:design_pattern/features/books/presentation/pages/signup.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_strings.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


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
                  Animate(
                  child: GradientText(
                      AppStrings.appName, style:const TextStyle(fontSize: 30,  fontWeight: FontWeight.bold),colors: [AppColor.primary,AppColor.shadesColor],).animate().fadeIn(duration: 3000.ms)
                      .then(delay: 500.ms) // baseline=800ms
                      .slide() ),
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
          body: const TabBarView(
            children:  [
              SignUp(registration: true),
              SignUp(registration: false,),

            ],
          )


      ),
    );
  }
}

