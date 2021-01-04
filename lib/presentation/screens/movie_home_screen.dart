import 'package:cinemabook/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:cinemabook/data/model/movies_list.dart';
import 'package:cinemabook/presentation/constants.dart';
import 'package:cinemabook/presentation/screens/movie_detail_screen.dart';
import 'package:cinemabook/presentation/widgets/error.dart';
import 'package:cinemabook/presentation/widgets/loading.dart';
import 'package:cinemabook/data/core/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _loadMovies();
    super.initState();
  }

  _loadMovies() {
    context.read<MovieListBloc>().add(MovieListEvent.fetchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        title: Text(
          'Trending Movies',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocBuilder<MovieListBloc, MovieListState>(
          builder: (BuildContext context, MovieListState state) {
            if (state is MovieListError) {
              final error = state.error;
              String message = '${error.message}\nTap to Retry.';
              return ErrorTxt(
                message: message,
                onTap: _loadMovies,
              );
            }
            if (state is MovieListLoaded) {
              List<Result> movies = state.movies;
              return _buildMovieList(movies);
              // return _list(movies);
            }
            return Loading();
          },
        ),
      ),
    );
  }

  _buildMovieList(movies) {
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
                      print("detail info ----- for next screnn***" +
                          movies[index].id.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailScreen(
                              movieDetailId: movies[index].id),
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
                              movies[index].posterPath,
                        ),
                        Center(
                          child: Text(movies[index].title,
                              style: TextStyle(fontSize: 18.0),
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: movies.length,
            ),
          ),
        )
      ],
    );
  }
}
