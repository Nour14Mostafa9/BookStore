import 'package:design_pattern/core/utils/snackbar_msg.dart';
import 'package:design_pattern/core/widgets/loading_widget.dart';
import 'package:design_pattern/features/books/presentation/manager/add_fav_bloc/add_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/book.dart';

class BookDetails extends StatefulWidget {
  final Book book;
  const BookDetails({super.key, required this.book});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  bool isMarked = false;


  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    bool isDarkMode= theme.brightness == Brightness.light;
    Color btnColor= isDarkMode?AppColor.lightMode:AppColor.darkMode;


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 20),
        child: ListView(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:  Icon(Icons.arrow_back_ios,color: AppColor.iconColor)),
                  SizedBox(width: MediaQuery.of(context).size.width*.67,),
                  BlocConsumer<AddBloc,AddState>(
                      listener: (context,state){
                        if(state is MsgAddFavBook){
                          SnackBarMsg().showSuccessMsg(state.msg,context);
                        }else if(state is ErrorAddFavBook){
                          SnackBarMsg().showErrorMsg(state.msg,context);
                        }
                      },
                      builder: (context,state){
                        if(state is LoadingAddFavBook) {
                          return const LaodingWidget();
                        }else {
                          return _body();
                        }

                      }
                  ),

                ],
              ),
              const SizedBox(height: 30,),
              SizedBox(
                height: MediaQuery.of(context).size.height*.3,
                width: MediaQuery.of(context).size.width*.2,

                child: Image.network("${widget.book.smallThumbnail}",fit: BoxFit.contain,),),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.book.title }",style: Theme.of(context).textTheme.headlineSmall,),
                      const SizedBox(height: 12,),
                      Text("${widget.book.description}",style: Theme.of(context).textTheme.bodySmall,overflow:TextOverflow.visible ,),
                      const SizedBox(height: 10,),
                      Text("Rate : ",style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(width: 10,),
                      SizedBox(
                        height: 2,
                        child: RatingBar.builder(
                          initialRating:widget.book.averageRating ,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 25,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },

                        ),
                      ),
                      const SizedBox(height: 50,),
                      Row(
                        children: [
                          Center(
                            child: Container(
                              width: 150,
                              height: 40,
                              child: ElevatedButton(
                                  style:ElevatedButton.styleFrom(
                                    elevation: 10,
                                    backgroundColor:  AppColor.btnColor  ,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),

                                    ),
                                  ),
                                  onPressed: ()async {

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Navigation()));
                                  },
                                  child: const Text("READ", style: TextStyle(color: Colors.white, fontSize: 20),)),
                            ),
                          ),
                          const SizedBox(width: 30,),
                          Center(
                            child: SizedBox(
                              width: 150,
                              height: 40,
                              child: ElevatedButton(
                                  style:ElevatedButton.styleFrom(
                                    elevation: 50,
                                    backgroundColor: btnColor ,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: ()async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Navigation()));
                                  },
                                  child: Text("BUY", style: TextStyle(color: AppColor.primary, fontSize: 20),)),
                            ),
                          )
                        ],
                      )],),
                ),
              ),
            ]
        ),
      ),
    );
  }

  Widget _body(){
    return InkWell(
      onTap: (){
        setState(() {
          isMarked = !isMarked;
        });
        if(isMarked = true){
          addToFavourites();
        }
      },
      child: isMarked ? Icon(Icons.bookmark_rounded,color: AppColor.iconColor,size: 40,):
      Icon(Icons.bookmark_outline,color:AppColor.iconColor,size: 40,),
    );
  }

  void addToFavourites() {
    BlocProvider.of<AddBloc>(context).add(AddFavBookEvent(favBook: widget.book));
  }

}
