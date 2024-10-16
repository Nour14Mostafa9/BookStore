import 'package:design_pattern/features/books/presentation/manager/get_books_bloc/books_bloc.dart';
import 'package:design_pattern/features/books/presentation/manager/get_fav_books/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../widgets/book_list_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}


class _WishlistState extends State<Wishlist> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavouriteBloc>(context).add(GetAllFavBooksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10.0),
          child: Text("WISHLIST", style: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          if (state is LoadingFavBooksState) {
            return const LaodingWidget();
          } else if (state is ErrorRetrievingFavBooksState) {
            return const ErrorWidgett();
          } else if (state is LoadedFavBooksState) {
            return BookListWidget(bookList: state.books,isHome: false,);
          } else {
            return const Center(child: Text("No favorite books available."));
          }
        },
      ),
    );
  }
}

