import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:design_pattern/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../domain/entities/book.dart';
import '../pages/book_details.dart';

class BookListWidget extends StatefulWidget {
  final List<Book> bookList;
  final bool isHome;
  const BookListWidget({super.key, required this.bookList, required this.isHome});

  @override
  State<BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {
  bool isChosen = false;
  bool isMarked = false;
  @override
  Widget build(BuildContext context) {

    return widget.isHome ?_homeBody():Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
          separatorBuilder: (context,index){
            return const SizedBox(height: 60,);},
          itemCount: widget.bookList.length,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  BookDetails(book: widget.bookList[index],)));
              },
              child: SizedBox(
                width: 250,
                child: Row(
                    children: [
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          //   image: DecorationImage(image: NetworkImage(bookList[index].smallThumbnail) )
                        ),
                        child: Image.network("${widget.bookList[index].smallThumbnail}",fit: BoxFit.cover,),),
                      const SizedBox(width: 30,),
                      SizedBox(
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${widget.bookList[index].title}" ,style: Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(height: 10,),
                            SizedBox(
                              height: 2,
                              child: RatingBar.builder(
                                initialRating:widget.bookList[index].averageRating ,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 18,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },

                              ),
                            )],),
                      ),
                    ]

                ),

              ),
            );
          }),
    );
  }

  Widget _homeBody(){
    String searchText="";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi,",style: TextStyle(color: AppColor.primary),),
          const SizedBox(height: 30,),
          AnimatedSearchBar(
            label: "Search",
            height: 45,
            closeIcon: const Icon(Icons.close_rounded),

            labelStyle: TextStyle(color: AppColor.primary,fontSize: 20 ),
            onChanged: (value) {
              debugPrint("value on Change");
              setState(() {
                searchText = value;
              });
            },
          ),

          const SizedBox(height: 50,),
          Expanded(
            flex: 1,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return SizedBox(
                    height: 10,
                    width: 100,
                    child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          elevation: 10,
                          shadowColor: AppColor.btnColor ,
                          foregroundColor:AppColor.btnColor ,
                          backgroundColor: isChosen?AppColor.lightMode:AppColor.btnColor,
                          overlayColor:AppColor.btnColor  ,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            isChosen = !isChosen;
                          });
                        },
                        child: Text("filter", style: TextStyle(color: isChosen?AppColor.btnColor:AppColor.lightMode , fontSize: 20),)),
                  );
                },
                separatorBuilder:  (context,index){
                  return const SizedBox(width: 20,);
                },
                itemCount: 3),
          ),
          const SizedBox(height: 30,),
          Expanded(
            flex: 5,
            child: ListView.separated(
                separatorBuilder: (context,index){
                  return const SizedBox(height: 60,);},
                itemCount: widget.bookList.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  BookDetails(book: widget.bookList[index],)));
                    },
                    child: SizedBox(
                      width: 250,
                      child: Row(
                          children: [
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                //   image: DecorationImage(image: NetworkImage(bookList[index].smallThumbnail) )
                              ),
                              child: Image.network("${widget.bookList[index].smallThumbnail}",fit: BoxFit.cover,),),
                            const SizedBox(width: 30,),
                            SizedBox(
                              width: 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${widget.bookList[index].title}" ,style: Theme.of(context).textTheme.headlineSmall),
                                  const SizedBox(height: 30,),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 2,
                                        child: RatingBar.builder(
                                          initialRating:widget.bookList[index].averageRating ,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 18,
                                          itemBuilder: (context, _) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },

                                        ),
                                      ),
                                      const SizedBox(width: 60,),
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                          });
                                        },
                                        child: isMarked ? Icon(Icons.bookmark_rounded,color: AppColor.iconColor,size: 40,):
                                        Icon(Icons.bookmark_outline,color:AppColor.iconColor,size: 30,),
                                      ),

                                    ],
                                  )],),
                            ),
                          ]

                      ),

                    ),
                  );
                }),
          )
        ],

      ),
    );
  }
}
