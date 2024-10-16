import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../navigaion.dart';

class ErrorWidgett extends StatelessWidget {
  const ErrorWidgett({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.warning_amber,size:150,),
            const Text("Something Went Wrong",style: TextStyle(fontSize: 18),),
            const Text("Please Try Again Later ...",style: TextStyle(fontSize: 15),),
            const SizedBox(height: 40,),
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width*.3,
                    height: 40,
                    child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor:  Colors.green.shade200 ,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),

                          ),
                        ),
                        onPressed: ()async {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Navigation( isAdmin: false,)));
                        },
                        child: const Text("Reload", style: TextStyle(color: Colors.white, fontSize: 18),))))

          ]
      ),
    );
  }
}
