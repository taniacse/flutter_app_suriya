import 'package:flutter/material.dart';
import 'package:flutter_app_suriya/ui/movie_list.dart';

void main() => runApp(App());


class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MovieList(),
      ),



    );
  }


}



