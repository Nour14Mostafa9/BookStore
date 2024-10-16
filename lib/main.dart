//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_pattern/core/utils/app_colors.dart';
import 'package:design_pattern/core/utils/app_strings.dart';
import 'package:design_pattern/features/books/presentation/manager/add_fav_bloc/add_bloc.dart';
import 'package:design_pattern/features/books/presentation/manager/get_books_bloc/books_bloc.dart';
import 'package:design_pattern/features/books/presentation/manager/get_fav_books/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:design_pattern/features/books/presentation/pages/home.dart';
import 'package:design_pattern/navigaion.dart';
import 'package:design_pattern/Welcome.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/network/network_info.dart';
import 'injection_container.dart' as di;

import 'config/routes/app_routes.dart';
import 'config/theme/app_theme.dart';


 Future  main() async {
   WidgetsFlutterBinding.ensureInitialized();
   //await Firebase.initializeApp();
   await di.init();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>di.sl<BooksBloc>()..add(GetAllBooksEvent())),
        BlocProvider(create: (_)=>di.sl<FavouriteBloc>()..add(GetAllFavBooksEvent())),
        BlocProvider(create: (_)=>di.sl<AddBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title:AppStrings.appName,
        theme: appTheme(),
        routes: routes,
      ),
    );
  }
}




