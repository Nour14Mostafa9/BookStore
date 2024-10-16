import 'package:design_pattern/features/books/presentation/manager/get_books_bloc/books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../widgets/book_list_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body(){
    return Padding(
        padding: const EdgeInsets.all(20),
      child: BlocBuilder<BooksBloc,BooksState>(
       builder: (context,state){
         if(state is LoadingBooksState){
           return  const LaodingWidget();
         }else if(state is ErrorBooksState){
           return  const ErrorWidgett();
         }else if(state is LoadedBooksState){
           return BookListWidget(bookList: state.books,isHome: true,);
         }else{
           return const LaodingWidget();
         }
       },

      ),
    );
  }
}
