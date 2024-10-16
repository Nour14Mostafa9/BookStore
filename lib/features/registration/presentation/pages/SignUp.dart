//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_pattern/Admin.dart';
import 'package:design_pattern/core/utils/app_colors.dart';
import 'package:design_pattern/navigaion.dart';
import 'package:flutter/material.dart';
import 'package:design_pattern/Models/UserModel.dart';


class SignUp extends StatefulWidget {

  bool registration;
  SignUp({super.key,required this.registration});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email=TextEditingController();
  final credit=TextEditingController();
  final name=TextEditingController();
  final password=TextEditingController();
  var formkey = GlobalKey<FormState>();
  static String globalId  ="";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: widget.registration ? Form(
        key:formkey ,
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
                              offset: Offset(0,10)

                          )
                        ]
                    ),
                    child:  TextFormField(
                      controller: name,
                      autovalidateMode:AutovalidateMode.always ,
                      keyboardType: TextInputType.name,
                      decoration:  InputDecoration(

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        hintText: 'Enter Your Name',

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
                              offset: Offset(0,10)

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
                              offset: Offset(0,10)

                          )
                        ]
                    ),
                    child:  TextFormField(
                      controller: password,
                      autovalidateMode:AutovalidateMode.always ,
                      keyboardType: TextInputType.visiblePassword,
                      decoration:  InputDecoration(

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
                    child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor:  AppColor.btnColor ,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0),

                        ),
                      ),
                        onPressed: ()async {
                        final user = User(userName: name.text, password: password.text ,creditCardno:int.parse(credit.text), phone:int.parse(email.text) );
                        //Admin admin = Admin.getInstance();
                       // admin.addUser(user);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Navigation( isAdmin: false,)));
                        },
                      child: const Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 20),)),
                  ),
                )

              ],
            ),
          ),
        ),
      ):Form(
      key:formkey ,
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
                            offset: Offset(0,10)

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
                            offset: Offset(0,10)

                        )
                      ]
                  ),
                  child:  TextFormField(
                    controller: password,
                    autovalidateMode:AutovalidateMode.always ,
                    keyboardType: TextInputType.visiblePassword,
                    decoration:  InputDecoration(

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
                child:  SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: AppColor.btnColor ,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),

                        ),
                      ),
                      onPressed: (){
                        if(email.text=="admin" && password.text=="admin"){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Navigation(isAdmin: true,)));
                        }else{
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Navigation(isAdmin: false,)));
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
