import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movies_app/movies_service.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List movieList = [];
  final int moviesNumber = 21;

  void displayMovies() async {
    MoviesService instance = MoviesService();
    try {
      movieList = await instance.getMovies(moviesNumber);
      Navigator.pushReplacementNamed(context, '/home', arguments: movieList);
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    displayMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SpinKitSpinningLines(
            color: Colors.blueGrey,
            size: 150.0,
          ),
        ));
  }
}
