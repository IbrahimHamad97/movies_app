import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movies_app/movies_service.dart';
import 'package:movies_app/widgets/movies_displayer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  dynamic meow;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    meow = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          title: Text(
            "Book Movie",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                text: "Popular",
              ),
              Tab(
                text: "Top-Rated",
              ),
              Tab(
                text: "Upcoming",
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            MovieDisplayer(movieList: meow),
            Center(
              child: Icon(Icons.car_rental),
            ),
            Center(
              child: Icon(Icons.ac_unit),
            ),
          ],
        ));
  }
}
