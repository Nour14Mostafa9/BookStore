import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:design_pattern/config/theme/app_theme.dart';
import 'package:design_pattern/config/theme/theme_bloc.dart';
import 'package:design_pattern/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

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
                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person,size: 30 ,),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*.05,),
                Column(
                  children: [
                    Text("User Name"),
                    TextButton(
                      onPressed: (){},
                      child: Text("Edit",),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            Divider(height: 1,),
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
                       isDarkMode = isDarkModeEnabled;
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
                child: Container(
                   width: double.infinity,
                    child: const Text("Notifications",style: TextStyle(fontSize: 20),))),
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
              onTap: (){},
                child: Container(
                  width: double.infinity,
                    child: const Text("Clear Cache ",style: TextStyle(fontSize: 20),))),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            InkWell(
                onTap: (){},
                child: const Text("Contact ",style: TextStyle(fontSize: 20),)),



          ],
        ),
      ),
    );
  }
}
