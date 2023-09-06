import 'package:flutter/material.dart';
import 'package:flutter_platform_demo/movies/bloc/watchlist_provider.dart';
import 'package:provider/provider.dart';

class NewMovieSheet extends StatelessWidget {
  const NewMovieSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            "Adding Movie to Watch List",
          ),
          Row(
            children: [
              Flexible(
                child: TextField(
                  decoration: const InputDecoration(hintText: "Movie Title"),
                  onSubmitted: (value) {
                    final watchlistProvider = context.read<WatchlistProvider>();
                    watchlistProvider.add(value);
                    Navigator.pop(context);
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.done),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
