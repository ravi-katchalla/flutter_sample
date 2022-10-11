import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/vivek_official/news_project/internet_connectivity/cubit/internet_cubit.dart';
import 'package:provider/provider.dart';

import '../screens/news_screen.dart';
import '../viewmodels/news_article_list_view_model.dart';

class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.

  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFEFDFD),
        appBarTheme: const AppBarTheme(
          color: Color(0xffFEFDFD),
          elevation: 0,
          textTheme: TextTheme(
            titleSmall: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => NewsArticleListViewModel(),
          )
        ],
        child: BlocProvider(
          create: (context) => InternetCubit(),
          child: const NewsScreen(),
        ),
      ),
    );
  }
}
