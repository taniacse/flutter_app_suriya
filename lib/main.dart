import 'package:flutter/material.dart';
import 'package:flutter_app_suriya/ui/movie_list.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: SvgPicture.asset(
                  'assets/images/loginHeader.svg',
                  alignment: Alignment.bottomRight,
                ),
              ),

              ListView(
                children: <Widget>[
                 Container(
                   height: 100,
                   child: Text('Bangladesh',
                   style: TextStyle(
                     fontSize: 30
                   ),
                   ),
                 ),Container(
                    height: 100,
                   child: Text('Bangladesh',
                   style: TextStyle(
                     fontSize: 30
                   ),
                   ),
                 ),Container(
                    height: 100,
                   child: Text('Bangladesh',
                   style: TextStyle(
                     fontSize: 30
                   ),
                   ),
                 ),Container(
                    height: 100,
                   child: Text('Bangladesh',
                   style: TextStyle(
                     fontSize: 30
                   ),
                   ),
                 ),Container(
                    height: 100,
                   child: Text('Bangladesh',
                   style: TextStyle(
                     fontSize: 30
                   ),
                   ),
                 ),Container(
                    height: 100,
                   child: Text('Bangladesh',
                   style: TextStyle(
                     fontSize: 30
                   ),
                   ),
                 )
                ],

              ),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: null),
      ),
    );
  }
}
