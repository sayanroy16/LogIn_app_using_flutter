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
    return movies.fromJson(jsonDecode(response.body)).result;
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
            }
            return Container(
              height: 700,
              width: double.infinity,
              child: ListView.builder(
                itemCount: projectSnap.data.length,
                itemBuilder: (context, index) {
                  final movie = projectSnap.data[index];
                  return Container(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.teal.shade700,
                    height: (MediaQuery.of(context).size.height / 5),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            backgroundColor: Colors.teal.shade800,
                            radius: 50,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 48,
                              child: Text(
                                movie.title,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Category: Movies',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight + Alignment(0, .5),
                          child: Text(
                            'Langauge:${movie.language}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight + Alignment(0, 1),
                          child: Text(
                            'Sort:Voting',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight + Alignment(0, 1),
                          child: Text(
                            'Sort:Voting',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center + Alignment(0, 2.1),
                          child: MaterialButton(
                            onPressed: () {
                              //Implement login functionality.
                              // Navigator.pushNamed(context, HomeScreen.id);
                            },
                            child: Text(
                              "Watch Trailer",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
          future: fetchMovies(),
        ),
        CarouselSlider(
            options: CarouselOptions(
              height: (MediaQuery.of(context).size.height / 5),
              aspectRatio: 2,
              viewportFraction: 1.0,
              initialPage: 0,
            ),
            items: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.teal.shade700,
                height: (MediaQuery.of(context).size.height / 5),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundColor: Colors.teal.shade800,
                        radius: 50,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 48,
                          child: Text(
                            'Bond 25',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Category: Movies',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight + Alignment(0, .5),
                      child: Text(
                        'Langauge:Kannda',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight + Alignment(0, 1),
                      child: Text(
                        'Sort:Voting',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight + Alignment(0, 1),
                      child: Text(
                        'Sort:Voting',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center + Alignment(0, 2.1),
                      child: MaterialButton(
                        onPressed: () {
                          //Implement login functionality.
                          // Navigator.pushNamed(context, HomeScreen.id);
                        },
                        child: Text(
                          "Watch Trailer",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
        Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.white,
          height: (MediaQuery.of(context).size.height / 5),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 48,
                    child: Text(
                      'Venom',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Category: Movies',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.teal,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight + Alignment(0, .5),
                child: Text(
                  'Langauge:English',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              Align(
                alignment: Alignment.centerRight + Alignment(0, 1),
                child: Text(
                  'Sort:Voting',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              Align(
                alignment: Alignment.center + Alignment(0, 2.1),
                child: MaterialButton(
                  onPressed: () {
                    //Implement login functionality.
                    // Navigator.pushNamed(context, HomeScreen.id);
                  },
                  child: Text(
                    "Watch Trailer",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.teal.shade700,
          height: (MediaQuery.of(context).size.height / 5),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.teal.shade800,
                  radius: 50,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 48,
                    child: Text('Eternals',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Category: Movies',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight + Alignment(0, .5),
                child: Text(
                  'Langauge:English',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.centerRight + Alignment(0, 1),
                child: Text(
                  'Sort:Voting',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.center + Alignment(0, 2.1),
                child: MaterialButton(
                  onPressed: () {
                    //Implement login functionality.
                    // Navigator.pushNamed(context, HomeScreen.id);
                  },
                  child: Text(
                    "Watch Trailer",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
