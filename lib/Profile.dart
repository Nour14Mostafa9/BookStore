import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*.25,),
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children:[
                  Card(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*.35,
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20,),
                            Text("Name :" , style: TextStyle(fontSize: 22, color: Colors.green.shade200 , fontWeight: FontWeight.bold),),
                            const SizedBox(height: 50,),
                            Text("Email :", style: TextStyle(fontSize: 22, color: Colors.green.shade200 , fontWeight: FontWeight.bold)),
                            const SizedBox(height: 50,),
                            Text("Password :", style: TextStyle(fontSize: 22, color: Colors.green.shade200, fontWeight: FontWeight.bold)),

                          ],
                        ),
                      ) ,
                    ),

                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height*.3,
                      right:MediaQuery.of(context).size.width*.25,
                      child:const CircleAvatar(
                        radius: 50,
                    child: Icon(Icons.person),
                  )),


                ]
              ),
            ),
            SizedBox(height: 10,),
            TextButton(
                onPressed: (){},
                child: Text("Edit", style: TextStyle(color:  Colors.green.shade200, fontSize: 20)),)

           /* SizedBox(
              height: 60,
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

                  },
                  child: const Text("Edit", style: TextStyle(color: Colors.white, fontSize: 20),)),
            ),*/
          ],
        ),
      ),
    );
  }
}
