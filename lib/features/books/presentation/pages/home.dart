import 'package:design_pattern/features/books/presentation/manager/get_books_bloc/books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../widgets/book_list_widget.dart';

class Home extends StatefulWidget {
  final String name ;
   Home({super.key, required this.name});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> sub = ['Fiction', 'History', 'Science', 'Technology', 'Art'];
  List<bool> subChosen = [];



  @override
  void initState() {
    super.initState();
    subChosen = List<bool>.generate(sub.length, (index) => false);
    subChosen[0]=true;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi, ${widget.name}", style: TextStyle(color: AppColor.primary)),
          const SizedBox(height: 20),
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final theme = Theme.of(context);
                final isDark = theme.brightness == Brightness.dark ;
                Color btnColor= !isDark? AppColor.lightMode: AppColor.darkMode;
                Color textColor= !isDark? AppColor.lightMode: AppColor.darkMode;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    width: 130,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        shadowColor: AppColor.btnColor,
                        foregroundColor: AppColor.btnColor,
                        backgroundColor: !subChosen[index] ? AppColor.btnColor : btnColor,
                        overlayColor: AppColor.btnColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          BlocProvider.of<BooksBloc>(context).add(GetAllBooksEvent(subject: sub[index].toLowerCase()));
                          for (int i = 0; i < subChosen.length; i++) {
                            if(i != index){
                              subChosen[i] = false;
                            }else{
                              subChosen[i] = true;
                            }
                          }
                        });
                      },
                      child: Text(sub[index], style: TextStyle(color: !subChosen[index] ? textColor: AppColor.btnColor, fontSize: 16,fontWeight:  FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20);
              },
              itemCount: sub.length,
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilder<BooksBloc, BooksState>(
            builder: (context, state) {
              if (state is LoadingBooksState) {
                return const LoadingWidget();
              } else if (state is ErrorBooksState) {
                return const ErrorWidgett();
              } else if (state is LoadedBooksState) {
                return Expanded(
                  flex: 5,
                  child: BookListWidget(bookList: state.books, isHome: true),
                );
              } else {
                return const LoadingWidget();
              }
            },
          ),
        ],
      ),
    );
  }
}
