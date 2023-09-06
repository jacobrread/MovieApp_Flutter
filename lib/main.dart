import 'package:flutter/material.dart';
import 'package:flutter_platform_demo/movies/bloc/selected_movie_bloc.dart';
import 'package:flutter_platform_demo/movies/bloc/watchlist_provider.dart';
import 'package:provider/provider.dart';

import 'movies/view/home_page.dart';
import 'movies/view/movie_details_page.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WatchlistProvider>(
          create: (context) => WatchlistProvider(),
        ),
        ChangeNotifierProvider<SelectedMovieBloc>(
          create: (context) => SelectedMovieBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        initialRoute: Routes.home,
        routes: {
          Routes.home: (context) => const MyHomePage(title: "WatchList"),
          Routes.details: (context) => const MovieDetailsPage(),
        },
      ),
    );
  }
}
