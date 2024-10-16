import 'package:flutter/material.dart';

class FavouriteBooks extends StatefulWidget {
  const FavouriteBooks({super.key});

  @override
  State<FavouriteBooks> createState() => _FavouriteBooksState();
}


class _FavouriteBooksState extends State<FavouriteBooks> {
  List<String> categories =[
    "clothes",
    "appliance",
    "accessories",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child:Text("Home",style: TextStyle(color: Colors.green.shade400,fontSize: 30 ,fontWeight: FontWeight.bold),) ,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.builder(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
            ),
            itemCount: categories.length,
            itemBuilder: (context , i){
              return Card(
                elevation: 10,
                color:Colors.white ,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child:MaterialButton(
                    onPressed: (){

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(categories[i],
                          style:const TextStyle(fontSize: 20,
                              fontWeight:FontWeight.bold,color: Colors.white ),),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
