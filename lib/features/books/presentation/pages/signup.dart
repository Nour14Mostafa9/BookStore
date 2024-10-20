
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:design_pattern/core/utils/app_colors.dart';
import 'package:design_pattern/core/utils/app_strings.dart';
import 'package:design_pattern/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';




class SignUp extends StatefulWidget {
  final bool registration;
  const SignUp({super.key,required this.registration});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email=TextEditingController();
  final credit=TextEditingController();
  final name=TextEditingController();
  final password=TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passwordVisible= false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: widget.registration ? Form(
        key:formKey ,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                    height: 30
                ),
                Center(
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow:
                        [
                          BoxShadow(
                              color: AppColor.shadesColor,
                              blurRadius: 15,
                              offset: const Offset(0,10)

                          )
                        ]
                    ),
                    child:  TextFormField(
                      controller: name,
                      autovalidateMode:AutovalidateMode.always ,
                      keyboardType: TextInputType.name,
                      style:TextStyle(color: Theme.of(context).brightness!=Brightness.dark?AppColor.darkMode:AppColor.lightMode) ,
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: AppColor.darkMode)
                        ),
                        hintText: 'Enter Your Name',

                        fillColor: Theme.of(context).brightness!=Brightness.dark?AppColor.darkMode:AppColor.lightMode

                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow:
                        [
                          BoxShadow(
                              color:AppColor.shadesColor,
                              blurRadius: 15,
                              offset: const Offset(0,10)

                          )
                        ]
                    ),
                    child:  TextFormField(
                      controller: email,
                      autovalidateMode:AutovalidateMode.always ,
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        hintText: 'Enter Your Email',

                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                Center(
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow:
                        [
                          BoxShadow(
                              color: AppColor.shadesColor,
                              blurRadius: 15,
                              offset: const Offset(0,10)

                          )
                        ]
                    ),
                    child:   TextFormField(
                      controller: password,
                      obscureText: !passwordVisible,
                      autovalidateMode:AutovalidateMode.always ,
                      keyboardType: TextInputType.text,
                      decoration:  InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          icon: Icon( passwordVisible ? Icons.visibility : Icons.visibility_off,),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        hintText: 'Enter Your Password',

                      ),
                    ),
                  ),
                ),
                 SizedBox(
                    height: MediaQuery.of(context).size.height*.1
                ),
                Center(
                  child: Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: LinearGradient(
                            colors: [
                             AppColor.btnColor,
                              AppColor.shadesColor
                            ])),
                    child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        elevation: 10,
                          backgroundColor: Colors.transparent,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0),

                        ),
                      ),
                        onPressed: ()async {
                          try {
                             await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            );
                             SharedPreferences preferences = await SharedPreferences.getInstance();
                             preferences.setString("UserName", name.text);

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (
                                context) => const Navigation()));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              AwesomeDialog(
                                context: context,
                                animType: AnimType.scale,
                                dialogType: DialogType.warning,
                                body:  Center(child: Text(AppStrings.WEAK_PASSWORD_MSG, style:Theme.of(context).textTheme.bodySmall,
                                ),),
                                title: 'Weak Password',
                                btnOkText: "Back",
                                btnOkColor: AppColor.btnColor,
                                buttonsTextStyle: TextStyle(color:AppColor.lightMode ),
                                btnOkOnPress: () {},
                              ).show();

                           //   print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              AwesomeDialog(
                                context: context,
                                animType: AnimType.scale,
                                dialogType: DialogType.warning,
                                body:  Center(child: Text(AppStrings.EMAIL_EXIST_MSG, style:Theme.of(context).textTheme.displaySmall,
                                ),),
                                title: 'The account already exists',
                                btnOkText: "Back",
                                btnOkColor: AppColor.btnColor,
                                buttonsTextStyle: TextStyle(color:AppColor.lightMode ),
                                btnOkOnPress: () {},
                              ).show();
                              //print('The account already exists for that email.');
                            }
                          } catch (e) {
                            FailSignInException();
                          }
                        },
                      child: const Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 20),)),
                  ),
                )

              ],
            ),
          ),
        ),
      ):Form(
      key:formKey ,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                  height: 60
              ),
              Center(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:
                      [
                        BoxShadow(
                            color:AppColor.shadesColor,
                            blurRadius: 15,
                            offset: const Offset(0,10)

                        )
                      ]
                  ),
                  child:  TextFormField(
                    controller: email,
                    autovalidateMode:AutovalidateMode.always ,
                    keyboardType: TextInputType.emailAddress,
                    decoration:  InputDecoration(

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      hintText: 'Enter Your Email',

                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // const Text(" Password",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              const SizedBox(
                  height: 10
              ),
              Center(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:
                      [
                        BoxShadow(
                            color:AppColor.shadesColor,
                            blurRadius: 15,
                            offset: const Offset(0,10)

                        )
                      ]
                  ),
                  child:  TextFormField(
                    controller: password,
                    obscureText: !passwordVisible,
                    autovalidateMode:AutovalidateMode.always ,
                    keyboardType: TextInputType.text,
                    decoration:  InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                          icon: Icon( passwordVisible ? Icons.visibility : Icons.visibility_off,),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      hintText: 'Enter Your Password',

                    ),
                  ),
                ),
              ),
               SizedBox(
                  height: MediaQuery.of(context).size.height*.1
              ),
              Center(
                child:  Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                          colors: [
                            AppColor.btnColor,
                            AppColor.shadesColor
                          ])),
                  child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),),),
                      onPressed: () async{
                        try {
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: email.text,
                              password: password.text
                          );

                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_,)=> const Navigation()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.warning,
                              body:  Center(child: Text(AppStrings.NO_EMAIL_EXIST_MSG, style:Theme.of(context).textTheme.displaySmall,
                              ),),
                              title: 'No user found',
                              btnOkText: "Back",
                              btnOkColor: AppColor.btnColor,
                              buttonsTextStyle: TextStyle(color:AppColor.lightMode ),
                              btnOkOnPress: () {},
                            ).show();
                            //    print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.warning,
                              body:  Center(child: Text(AppStrings.WRONG_PASSWORD_MSG, style:Theme.of(context).textTheme.displaySmall,
                              ),),
                              title: 'Wrong password',
                              btnOkText: "Back",
                              btnOkColor: AppColor.btnColor,
                              buttonsTextStyle: TextStyle(color:AppColor.lightMode ),
                              btnOkOnPress: () {},
                            ).show();
                            //print('Wrong password provided for that user.');
                          }
                        }


                      },
                      child: const Text("LOG IN", style: TextStyle(color: Colors.white, fontSize: 20),)),
                ),
              )



            ],
          ),
        ),
      ),
    ),
    );
  }
}
