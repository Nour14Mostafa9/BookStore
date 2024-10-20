
import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:design_pattern/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:animations/animations.dart';
import '../../domain/entities/book.dart';
import '../manager/add_fav_bloc/add_bloc.dart';
import '../pages/book_details.dart';

class BookListWidget extends StatefulWidget {
  final List<Book> bookList;
  final bool isHome;
  const BookListWidget({super.key, required this.bookList, required this.isHome});

  @override
  State<BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {

  List<bool> chosen = [];
  List<String> favBooks = [];
  List<String> addFavBooks = [];

  @override
  void initState() {
    super.initState();
    chosen = List<bool>.generate(widget.bookList.length, (index) => false);
  }


  void addToFavourites(int index) {
    BlocProvider.of<AddBloc>(context).add(AddFavBookEvent(favBook: widget.bookList[index]));
  }

  @override
  Widget build(BuildContext context) {
    return widget.isHome ? _homeBody() : _favBody();
  }

  Widget _favBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: 60,);
          },
          itemCount: widget.bookList.length,
          itemBuilder: (context, index) {
            return OpenContainer(
              closedElevation: 0,
              transitionType: ContainerTransitionType.fade,
              closedColor: Theme
                  .of(context)
                  .brightness == Brightness.dark ? AppColor.darkMode : AppColor
                  .lightMode,
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
                return SizedBox(
                  width: 250,
                  child: Row(
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.network("${widget.bookList[index]
                              .smallThumbnail}", fit: BoxFit.cover,),),
                        const SizedBox(width: 30,),
                        SizedBox(
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${widget.bookList[index].title}",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineSmall),
                              const SizedBox(height: 10,),
                              SizedBox(
                                height: 2,
                                child: RatingBar.builder(
                                  initialRating: widget.bookList[index]
                                      .averageRating,
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

                );
              },
              openBuilder: (BuildContext _, VoidCallback __) {
                return BookDetails(book: widget.bookList[index],);
              },
            );
          }),
    );
  }

  Widget _homeBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSearchBar(
            label: "Search",
            height: 45,
            closeIcon: const Icon(Icons.close_rounded),
            labelStyle: TextStyle(
                color: AppColor.primary, fontSize: 20),
            searchIcon: IconButton(
                onPressed: () {
                  showSearch(context: context,
                      delegate: SearchClass(bookList: widget.bookList));
                },
                icon: const Icon(Icons.search_outlined)),
            onChanged: (value) {},
          ),
          const SizedBox(height: 25,),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 50,);
                },
                itemCount: widget.bookList.length,
                itemBuilder: (context, index) {
                  return OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    closedColor: Theme.of(context).brightness == Brightness.dark ? AppColor.darkMode : AppColor.lightMode,
                    closedBuilder: (BuildContext _,
                        VoidCallback openContainer) {
                      return SizedBox(
                        height: 150,
                        child: Row(
                            children: [
                              Container(
                                height: 140,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Image.network("${widget.bookList[index].smallThumbnail}",
                                  fit: BoxFit.cover,),),
                              const SizedBox(width: 30,),
                              SizedBox(
                                width: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${widget.bookList[index].title}",
                                      style: Theme.of(context).textTheme.headlineSmall,
                                      overflow: TextOverflow.ellipsis,),
                                    const SizedBox(height: 10,),
                                    Text("${widget.bookList[index].description}",
                                      style: Theme.of(context).textTheme.displaySmall,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,),
                                    const SizedBox(height: 40,),
                                    SizedBox(
                                      height: 2,
                                      child: RatingBar.builder(
                                        initialRating: widget.bookList[index].averageRating,
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
                                    ),

                                  ],),
                              ),
                            ]

                        ),
                      );
                    },
                    openBuilder: (BuildContext _, VoidCallback __) {
                      return BookDetails(book: widget.bookList[index],);
                    },
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



