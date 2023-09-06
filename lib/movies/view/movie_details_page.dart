import 'package:flutter/material.dart';
import 'package:flutter_platform_demo/movies/bloc/selected_movie_bloc.dart';
import 'package:provider/provider.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieName = context.watch<SelectedMovieBloc>().movieName;

    return Scaffold(
      appBar: AppBar(
        title: Text(movieName ?? "No Movie Selected"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Placeholder(),
            ),
            Text("Lorem Ipsum ...."),
          ],
        ),
      ),
    );
  }
}
