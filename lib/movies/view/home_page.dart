import 'package:flutter/material.dart';
import 'package:flutter_platform_demo/movies/bloc/selected_movie_bloc.dart';
import 'package:flutter_platform_demo/movies/bloc/watchlist_provider.dart';
import 'package:flutter_platform_demo/routes.dart';
import 'package:provider/provider.dart';

import 'new_movie_sheet.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<WatchlistProvider>();
    final selectedMovieBloc = context.watch<SelectedMovieBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView(
        children: [
          for (final todo in todoProvider.todos)
            ListTile(
              title: Text(todo),
              leading: selectedMovieBloc.movieName == todo
                  ? const Icon(Icons.star)
                  : null,
              tileColor: selectedMovieBloc.movieName == todo
                  ? Colors.blue.withOpacity(0.3)
                  : null,
              subtitle: const Text("Line 1"),
              isThreeLine: false,
              onTap: () {
                selectedMovieBloc.setMovieName(todo);
                Navigator.pushNamed(context, Routes.details);
              },
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return BottomSheet(
                onClosing: () {},
                builder: (context) {
                  return const NewMovieSheet();
                },
              );
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
