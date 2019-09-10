import 'package:flutter/material.dart';
import 'package:flutter_app_suriya/blocs/movie_detail_bloc_provider.dart';
import 'package:flutter_app_suriya/ui/movie_detail.dart';
import '../models/items_model.dart';
import '../blocs/movies_bloc.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }


  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.horizontal,

        itemBuilder: (BuildContext context, int index) {

          return GridTile(
              child: InkResponse(
                child:Column(
                  children: <Widget>[

                    SafeArea(child:Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
                          fit: BoxFit.cover,

                          height: 150,
                          width: 150,
                        )) ,),
                    Text('${snapshot.data.results[index].title}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.amber
                      ),),
                    Text('${snapshot.data.results[index].popularity}')
                  ],
                ),
                onTap: () => openDetailPage(snapshot.data, index) ,
              )


          );
        });



  }


  openDetailPage(ItemModel data, int index) {
    final page = MovieDetailBlocProvider(
      child: MovieDetail(
        title: data.results[index].title,
        posterUrl: data.results[index].backdrop_path,
        description: data.results[index].overview,
        releaseDate: data.results[index].release_date,
        voteAverage: data.results[index].vote_average.toString(),
        movieId: data.results[index].id,
      ) ,
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return page;
      }),
    );
  }

}







