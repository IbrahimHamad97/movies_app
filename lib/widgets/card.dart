import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  late dynamic movieTitle;
  late dynamic movieImage;

  CardWidget({required this.movieImage, required this.movieTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: movieImage.runtimeType != Null
                    ? Image.network(
                        movieImage,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        'https://imgc.allpostersimages.com/img/posters/blizzard_u-L-EYJQK0.jpg?h=550&p=0&w=550&background=ffffff',
                        fit: BoxFit.cover,
                      )),
            movieTitle.runtimeType != Null
                ? Text(movieTitle,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
                : Text('no title')
          ],
        ),
      ),
    );
  }
}
