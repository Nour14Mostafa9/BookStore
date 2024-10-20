
import 'package:design_pattern/config/theme/theme_bloc.dart';
import 'package:design_pattern/core/utils/app_strings.dart';
import 'package:design_pattern/features/books/presentation/manager/add_fav_bloc/add_bloc.dart';
import 'package:design_pattern/features/books/presentation/manager/get_books_bloc/books_bloc.dart';
import 'package:design_pattern/features/books/presentation/manager/get_fav_books/favourite_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection_container.dart' as di;
import 'config/routes/app_routes.dart';
import 'config/theme/app_theme.dart';


 Future  main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   await di.init();
   SharedPreferences  preferences = await SharedPreferences.getInstance();
   preferences.setBool("Dark", false);

  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>di.sl<BooksBloc>()..add(const GetAllBooksEvent(subject: "fiction"))),
        BlocProvider(create: (_)=>di.sl<FavouriteBloc>()..add(GetAllFavBooksEvent())),
        BlocProvider(create: (_)=>di.sl<AddBloc>()),
        BlocProvider(create: (_)=>di.sl<ThemeBloc>()..add(GetCurrentThemeEvent()))

      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if(state is LoadedThemeState){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state.theme,
              title:AppStrings.appName,
              routes: routes,

            );
          }
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title:AppStrings.appName,
            theme: appTheme() ,
            routes: routes,
          );

        },
      ),
    );
  }
}




