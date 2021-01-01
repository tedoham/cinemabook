import 'package:cinemabook/data/core/api_constants.dart';
import 'package:cinemabook/data/model/all_movie_model.dart';
import 'package:cinemabook/logic/bloc/movie_bloc.dart';
import 'package:cinemabook/presentation/constants.dart';
import 'package:cinemabook/presentation/screens/movie_detail_screen.dart';
// import 'package:cinemabook/presentation/cubit/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // get screen width
    // final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        title: Text('Trending Movies'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return buildLoading();
            } else if (state is MovieLoaded) {
              return state.movies != null
                  ? buildMovieList(state.movies, context)
                  : Text(
                      "Please Check your internet Coonection.",
                      style: TextStyle(color: Colors.red, fontSize: 24.0),
                      textAlign: TextAlign.center,
                    );
            } else {
              // (state is WeatherError)
              return buildLoadingError();
            }
          },
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildMovieList(List<AllMovieModel> movieList, context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.55,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  // color: Colors.black12,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailScreen(
                              movieDetailId: movieList[index].id),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          ApiConstants.BASE_IMAGE_URL +
                              movieList[index].posterPath,
                        ),
                        Center(
                          child: Text(movieList[index].title,
                              style: TextStyle(fontSize: 18.0),
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: movieList.length,
            ),
          ),
        )
      ],
    );
  }

  Widget buildLoadingError() {
    return Center(
      child: Text(
        "Please Check your internet Coonection.",
        style: TextStyle(color: Colors.red, fontSize: 24.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
