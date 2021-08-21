import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:ehrmis/models/Movies.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false, home: new Dashboard()));
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future fetchMovies(
      {category = "movies",
      language = "hindi",
      genre = "all",
      sort = "voting"}) async {
    final response = await http.post(
      Uri.parse('https://hoblist.com/movieList'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "category": category,
        "language": language,
        "genre": genre,
        "sort": sort
      }),
    );
    // if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Movies.fromJson(jsonDecode(response.body)).result;
    // } else {
    //   // If the server did not return a 201 CREATED response,
    //   // then throw an exception.
    //   // throw Exception('Failed to create album.');
    //   print("Error");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        FutureBuilder(
          builder: (context, projectSnap) {
            if (projectSnap.connectionState == ConnectionState.none &&
                projectSnap.hasData == null) {
              //print('project snapshot data is: ${projectSnap.data}');
              return Container();
            } else if (projectSnap.connectionState == ConnectionState.waiting) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: projectSnap.data.length,
                padding: EdgeInsets.only(bottom: 150),
                itemBuilder: (context, index) {
                  final movie = projectSnap.data[index];
                  final date = DateTime.fromMillisecondsSinceEpoch(
                      movie.releasedDate * 1000);
                  return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                blurRadius: 10)
                          ]),
                      // height: (MediaQuery.of(context).size.height / 4),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () => {},
                                      icon: Icon(Icons.arrow_upward)),
                                  Text(
                                    movie.totalVoted.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  IconButton(
                                      onPressed: () => {},
                                      icon: Icon(Icons.arrow_downward)),
                                  Text(
                                    "Votes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                              SizedBox(width: 5),
                              FadeInImage.assetNetwork(
                                placeholder: "Loading...",
                                image: movie.poster,
                                height:
                                    (MediaQuery.of(context).size.height / 4),
                                width: (MediaQuery.of(context).size.width / 5),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width / 1.8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(movie.title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        "Genre: ${movie.genre.toString()[0].toUpperCase()}${movie.genre.toString().substring(1, movie.genre.length)}"),
                                    Text(
                                        "Director: ${movie.director.toString()}",
                                        softWrap: true),
                                    Text(
                                      "Starring: ${movie.stars.toString()}",
                                      softWrap: true,
                                    ),
                                    Text(
                                        "${movie.runTime.toString()} Mins | ${movie.language} | ${date.toIso8601String().toString()}"),
                                    Text(
                                      "${movie.pageViews.toString()} views | Voted by ${movie.totalVoted.toString()} People ",
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 14),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.teal),
                                    // padding: MaterialStateProperty.all(
                                    //     EdgeInsets.all(50)),
                                    textStyle: MaterialStateProperty.all(
                                        TextStyle(fontSize: 16))),
                                onPressed: () => {},
                                child: Text("Watch Trailer")),
                          )
                        ],
                      ));
                },
              ),
            );
          },
          future: fetchMovies(),
        ),
      ],
    ));
  }
}

_gridItem(Image image, String text) {
  return FlatButton(
    onPressed: () {},
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.white,
          child: image,
          radius: 20,
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(fontSize: 13),
        ),
      ],
    ),
  );
}
