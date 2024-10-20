import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

import 'package:design_pattern/config/theme/app_theme.dart';
import 'package:design_pattern/config/theme/theme_bloc.dart';
import 'package:design_pattern/core/utils/app_colors.dart';
import 'package:design_pattern/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  final String name ;
   const Profile({super.key, required this.name});

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  bool isDarkModeEnabled = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*.1,),
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person,size: 30 ,),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*.05,),
                Column(
                  children: [
                    Text(widget.name,style: TextStyle(color: AppColor.btnColor),),
                    TextButton(
                      onPressed: (){},
                      child: const Text("Edit",),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            const Divider(height: 1,),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            Row(
              children: [
                const Text("Mode :",style: TextStyle(fontSize: 22),),
                SizedBox(width: MediaQuery.of(context).size.width*.4,),
                SizedBox(
                  width: 60,
                  child: DayNightSwitcher(
                    isDarkModeEnabled: isDarkModeEnabled,
                    onStateChanged: (isDarkMode) {
                      setState(() {
                       isDarkModeEnabled = !isDarkModeEnabled;
                       context.read<ThemeBloc>().add(ChangeThemeEvent(theme: !isDarkModeEnabled?AppTheme.values[0]:AppTheme.values[1]));
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            InkWell(
              onTap: (){},
                child: const SizedBox(
                   width: double.infinity,
                    child: Text("Notifications",style: TextStyle(fontSize: 20),))),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            InkWell(
              onTap: (){},
              child: Row(
                children: [
                  const Text("Language :",style: TextStyle(fontSize: 20),),
                  SizedBox(width: MediaQuery.of(context).size.width*.35,),
                  const Text("EN",style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            InkWell(
              onTap: (){
                AwesomeDialog(
                  context: context,
                  animType: AnimType.scale,
                  dialogType: DialogType.warning,
                  body:  Center(child: Text("Do You Want To Exit?", style:Theme.of(context).textTheme.bodyMedium,
                  ),),
                  title: 'Exit',
                  desc:   'Do you want to clear your cache',
                  btnOkText: "Clear",
                  btnOkColor: AppColor.btnColor,
                  btnCancelColor: Theme.of(context).brightness==Brightness.dark?AppColor.darkMode:AppColor.lightMode ,
                  btnCancelText:"Cancel",
                  buttonsTextStyle: TextStyle(color: Theme.of(context).brightness!=Brightness.dark?AppColor.darkMode:AppColor.lightMode ),
                  btnCancelOnPress: (){},
                  btnOkOnPress: () async{
                   SharedPreferences preference = await SharedPreferences.getInstance();
                   await preference.setStringList("CachedBooks",[""]);
                  },
                ).show();
              },
                child: const SizedBox(
                  width: double.infinity,
                    child: Text("Clear Cache ",style: TextStyle(fontSize: 20),))),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            InkWell(
                onTap: (){},
                child: const Text("Contact ",style: TextStyle(fontSize: 20),)),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            InkWell(
                onTap: (){
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.warning,
                    body:  Center(child: Text("Do You Want To Exit?", style:Theme.of(context).textTheme.bodyMedium,
                    ),),
                    title: 'Exit',
                    desc:   'Do you want to exit',
                    btnOkText: "Exit",
                    btnOkColor: AppColor.btnColor,
                    btnCancelColor: Theme.of(context).brightness==Brightness.dark?AppColor.darkMode:AppColor.lightMode ,
                    btnCancelText:"Cancel",
                    buttonsTextStyle: TextStyle(color: Theme.of(context).brightness!=Brightness.dark?AppColor.darkMode:AppColor.lightMode ),
                    btnCancelOnPress: (){},
                    btnOkOnPress: () async{
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_,)=> const Welcome()));
                    },
                  ).show();
                },
                child: const SizedBox(
                    width: double.infinity,
                    child: Text("Sign Out ",style: TextStyle(fontSize: 20),))),



          ],
        ),
      ),
    );
  }
}
