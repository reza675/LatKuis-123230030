import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';
import 'package:latihan_kuis_a/screen/movie_detail.dart';

class MovieListPage extends StatefulWidget {
  final String username;
  const MovieListPage({super.key, required this.username});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome, ${widget.username}!",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal.shade300,
        centerTitle: false,
      ),
      backgroundColor: Colors.grey.shade50, 
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 2,
            child: ListTile(
              title: Text("${movie.title} (${movie.year})"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.genre),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 6),
                      Text("${movie.rating}/10"),
                    ],
                  ),
                ],
              ),
              leading: SizedBox(
                width: 56,
                height: 80,
                child: Image.network(movie.imgUrl, fit: BoxFit.cover),
              ),
              trailing: IconButton(
                icon: Icon(
                  movie.isSaved ? Icons.bookmark : Icons.bookmark_outline,
                  color: movie.isSaved ? Colors.blueAccent : null,
                ),
                onPressed: () {
                  setState(() {
                    movie.isSaved = !movie.isSaved;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        movie.isSaved
                            ? 'Ditambahkan ke daftar: ${movie.title}'
                            : 'Dihapus dari daftar: ${movie.title}',
                      ),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
              isThreeLine: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetail(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
