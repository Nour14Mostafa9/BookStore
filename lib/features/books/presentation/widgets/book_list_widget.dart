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
  @override
  Widget build(BuildContext context) {

    return widget.isHome ?_body():Padding(
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

  Widget _body(){
    String searchText="";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi,",style: TextStyle(color: AppColor.primary),),
          const SizedBox(height: 50,),
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
          )
        ],

      ),
    );
  }
}
