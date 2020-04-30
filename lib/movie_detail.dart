import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("detail movie"),
        centerTitle: true
      ),
      body: Center(
        child: Text("example detail"),
      ),
    );
  }

}