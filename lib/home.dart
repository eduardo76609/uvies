import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/models/movieList.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/utils/constants.dart';

class Home extends StatefulWidget {
  @override
  createState() => _Home();
}

class _Home extends State<Home> {
  MovieList _uncomingMovies;
  MovieList _popularMovies;

  Color _teal = const Color.fromRGBO(26, 210, 194, 1);
  Color _gray = const Color.fromRGBO(28, 32, 43, 1);

  // second
  @override
  void initState() {
    super.initState();
    fetchUncomingMovies();
    fetchPopularMovies();
  }

  void fetchUncomingMovies() async {
    var response = await http.get(Constants.upcomingFull);
    var decodeJson = jsonDecode(response.body);
    setState(() {
      _uncomingMovies = MovieList.fromJson(decodeJson);
    });
  }

  void fetchPopularMovies() async {
    var response = await http.get(Constants.popularFull);
    var decodeJson = jsonDecode(response.body);
    setState(() {
      _popularMovies = MovieList.fromJson(decodeJson);
    });
  }

  // first
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("UVIES",
              style: TextStyle(
                  color: _teal, fontSize: 50.0, fontWeight: FontWeight.bold))),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: _gray, borderRadius: BorderRadius.circular(30.0)),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.blueGrey[300])),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text("Premieres",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: _teal,
                  size: 30.0,
                ),
              ],
            ),
            Expanded(child: _listUncomingMovies()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text("Popular Now",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: _teal,
                  size: 30.0,
                ),
              ],
            ),
            Expanded(child: _listPopularMovies()),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: _gray),
        child: BottomNavigationBar(
          iconSize: 35.0,
          selectedItemColor: _teal,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.videocam), title: Text("Movies")),
            BottomNavigationBarItem(
                icon: Icon(Icons.live_tv), title: Text("TV Shows")),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border), title: Text("Favorites")),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity), title: Text("Profile")),
          ],
        ),
      ),
    );
  }

  Widget _listUncomingMovies() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _uncomingMovies.totalResults,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width * .8,
                margin: EdgeInsets.only(right: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    image: DecorationImage(
                      image: NetworkImage(
                          "${Constants.baseUrlImageExtraBig}${_uncomingMovies.movies[index].backdropPath}"),
                      fit: BoxFit.fill,
                    )),
              )),
              Container(
                  decoration: BoxDecoration(
                      color: _gray,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(right: 20.0),
                  width: MediaQuery.of(context).size.width * .8,
                  child: Text(
                    _uncomingMovies.movies[index].originalTitle,
                    style: TextStyle(color: Colors.white70),
                  )),
            ],
          );
        });
  }

  Widget _listPopularMovies() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _popularMovies.totalResults,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width * .4,
                margin: EdgeInsets.only(right: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    image: DecorationImage(
                        image: NetworkImage(
                            "${Constants.baseUrlImageExtraSmall}${_popularMovies.movies[index].posterPath}"),
                        fit: BoxFit.cover)),
              )),
              Container(
                  decoration: BoxDecoration(
                      color: _gray,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(right: 20.0),
                  width: MediaQuery.of(context).size.width * .4,
                  child: Text(
                    _popularMovies.movies[index].originalTitle,
                    style: TextStyle(color: Colors.white70),
                  )),
            ],
          );
        });
  }
}
