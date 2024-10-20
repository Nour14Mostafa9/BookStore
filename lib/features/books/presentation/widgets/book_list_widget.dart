import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:design_pattern/core/utils/app_colors.dart';
import 'package:design_pattern/features/books/domain/use_cases/get_all_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../domain/entities/book.dart';
import '../manager/get_books_bloc/books_bloc.dart';
import '../manager/get_fav_books/favourite_bloc.dart';
import '../pages/book_details.dart';

class BookListWidget extends StatefulWidget {
  final List<Book> bookList;
  final bool isHome;
  const BookListWidget({super.key, required this.bookList, required this.isHome});

  @override
  State<BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {

  List<String> sub= ['Fiction', 'History', 'Science', 'Technology', 'Art'];
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
                                  //print(rating);
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
            searchIcon: IconButton(
                onPressed: (){
                   showSearch(context: context , delegate: SearchClass(bookList: widget.bookList));
                },
                icon: const Icon(Icons.search_outlined)),
            onChanged: (value) {},
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
                            BlocProvider.of<BooksBloc>(context).add(GetAllBooksEvent(subject: sub[index].toLowerCase()));
                          });
                        },
                        child: Text(sub[index], style: TextStyle(color: isChosen?AppColor.btnColor:AppColor.lightMode , fontSize: 15),)),
                  );
                },
                separatorBuilder:  (context,index){
                  return const SizedBox(width: 20,);
                },
                itemCount: sub.length),
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
                                            //print(rating);
                                          },

                                        ),
                                      ),
                                      const SizedBox(width: 60,),
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                            isMarked = !isMarked;
                                          });
                                        },
                                        child: isMarked ? Icon(Icons.bookmark_rounded,color: AppColor.iconColor,size: 30,):
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

class SearchClass extends SearchDelegate {
  final List<Book> bookList;

  SearchClass({required this.bookList});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close,),
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_outlined, size: 30,),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final result = findBookName(bookList, query);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 30),
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: 60,);
          },
          itemCount: result.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BookDetails(book: result[index],)));
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
                        child: Image.network("${result[index].smallThumbnail}",
                          fit: BoxFit.cover,),),
                      const SizedBox(width: 30,),
                      SizedBox(
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${result[index].title}", style: Theme
                                .of(context)
                                .textTheme
                                .headlineSmall),
                            const SizedBox(height: 10,),
                            SizedBox(
                              height: 2,
                              child: RatingBar.builder(
                                initialRating: result[index].averageRating,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 18,
                                itemBuilder: (context, _) =>
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  //print(rating);
                                },

                              ),
                            )
                          ],),
                      ),
                    ]

                ),

              ),
            );
          }),
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return const Center(
      child: Text("Search Book Name"),
    );
  }
}

  List<Book> findBookName(List<Book> allBooks , String query) {
    List<Book> results=[];
    for(Book searchBook in allBooks){
      if(searchBook.title!.toLowerCase().contains(query.toLowerCase())){
         results.add(searchBook);
      }
    }
    return results;
  }


