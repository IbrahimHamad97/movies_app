import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movies_app/movies_service.dart';
import 'package:movies_app/widgets/card.dart';

class MovieDisplayer extends StatefulWidget {
  var movieList;

  MovieDisplayer({required this.movieList});

  @override
  State<MovieDisplayer> createState() => _MovieDisplayerState();
}

class _MovieDisplayerState extends State<MovieDisplayer> {
  String posterLink = 'https://image.tmdb.org/t/p/original';

  @override
  Widget build(BuildContext context) {
    return widget.movieList != []
        ? SingleChildScrollView(
            child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.fromLTRB(1, 5, 1, 0),
                child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: widget.movieList.map((e) {
                      return CardWidget(
                          movieImage: e['poster_path'] == null
                              ? null
                              : posterLink + e['poster_path'],
                          movieTitle: e['original_title']);
                    }).toList().cast<Widget>())),
          )
        : Container(
            child: Text("ha"));
  }
}
