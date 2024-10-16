//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_pattern/features/books/presentation/pages/home.dart';
import 'package:design_pattern/navigaion.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email=TextEditingController();
  final password=TextEditingController();
  var formkey = GlobalKey<FormState>();
  static String globalId  ="";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
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
                        const[
                          BoxShadow(
                              color: Color.fromRGBO(95, 227, 27, .3),
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
                        const[
                          BoxShadow(
                              color: Color.fromRGBO(95, 227, 27, .3),
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
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child:  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor:  Colors.green.shade200 ,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),

                          ),
                        ),
                        onPressed: (){
                          if(email.text=="admin" && password.text=="admin"){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Navigation(isAdmin: true,)));
                          }else{
                          /*FirebaseFirestore.instance.collection('User').get().then((value)  {
                            List usrs = value.docs;
                            for(int i =0 ; i <usrs.length;i++){
                              if(usrs[i].data()['email']==email.text &&usrs[i].data()['password']==password.text ){
                                globalId = usrs[i].data()['userId'];
                              }
                            }
                          });*/
                          Navigator.push(
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
