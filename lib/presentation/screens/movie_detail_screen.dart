import 'package:cinemabook/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:cinemabook/data/core/api_constants.dart';
import 'package:cinemabook/data/model/movie_detail.dart';
import 'package:cinemabook/presentation/constants.dart';
import 'package:cinemabook/presentation/screens/cinema_seat_screen.dart';
import 'package:cinemabook/presentation/widgets/Button.dart';
import 'package:cinemabook/presentation/widgets/OutlineButton.dart';
import 'package:cinemabook/presentation/widgets/error.dart';
import 'package:cinemabook/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:horizontal_center_date_picker/datepicker_controller.dart';
import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';

class MovieDetailScreen extends StatefulWidget {
  final int movieDetailId;

  const MovieDetailScreen({Key key, this.movieDetailId}) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    _loadMovies();
    super.initState();
  }

  _loadMovies() {
    context.read<MovieDetailBloc>().add(
        FetchMovieDetail(movieId: int.parse(widget.movieDetailId.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        title: Text(
          'Movie Detail',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieListError) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            return ErrorTxt(
              message: message,
              onTap: _loadMovies,
            );
          }

          if (state is MovieListLoaded) {
            MovieDetailModel movie = state.movie;
            print("**************************************33333333333333333");
            print(state.movie.title);
            print("**************************************33333333333333333");

            return _movieDetailWidget(movie);
          }
          return Loading();
        },
      ),
    );
  }

  _movieDetailWidget(movie) {
    var now = DateTime.now();
    DateTime startDate = now;
    DateTime endDate = now.add(Duration(days: 14));

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            ApiConstants.BASE_IMAGE_URL + movie.backdropPath,
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
          ),
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: Text(
              movie.title,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star_border,
                    color: Colors.grey[500],
                  ),
                  SizedBox(width: 5),
                  Text(
                    movie.voteAverage.toString(),
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: Colors.grey[500],
                  ),
                  SizedBox(width: 5),
                  Text(
                    movie.runtime.toString(),
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.local_movies_outlined,
                    color: Colors.grey[500],
                  ),
                  SizedBox(width: 5),
                  Text(
                    "3D",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Divider(color: Colors.grey[500]),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Synopsis",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: movie.genres.map<Widget>((entry) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          " " + entry.name.toString() + " ",
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Container(
                  child: Text(movie.overview,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14, letterSpacing: 1.5, wordSpacing: 2)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Date",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      // color: Colors.grey,
                      alignment: Alignment.center,
                      child: HorizontalDatePickerWidget(
                        startDate: startDate,
                        endDate: endDate,
                        selectedDate: now,

                        widgetWidth: MediaQuery.of(context).size.width,
                        datePickerController: DatePickerController(),
                        onValueSelected: (date) {
                          print('selected = ${date.toIso8601String()}');
                        },
                        // normalColor: kPrimaryColor,
                        selectedColor: kPrimaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Time",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SmallButton(
                        label: "09:30 AM (Available)",
                        onTap: () {
                          print("----7d7d7d7d7d7d7--------------->>>>>>>>");
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => MovieDetailScreen()),
                          // );
                        },
                      ),
                      SizedBox(height: 10),
                      SmallButton(
                        label: "12:30 AM (Not-Available)",
                        onTap: () {
                          print("----888888--------------->>>>>>>>");
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => MovieDetailScreen()),
                          // );
                        },
                      ),
                      SizedBox(height: 10),
                      SmallButton(
                        label: "03:30 PM (Not-Available)",
                        onTap: () {
                          print("----99999999--------------->>>>>>>>");
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => MovieDetailScreen()),
                          // );
                        },
                      ),
                      SizedBox(height: 10),
                      SmallButton(
                        label: "8:40 PM (Not-Available)",
                        onTap: () {
                          print("----55555555--------------->>>>>>>>");
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => MovieDetailScreen()),
                          // );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          LargeButton(
            label: "Continue to seat selector",
            iconData: Icons.arrow_forward,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CinemaSeatScreen(movieInfo: movie),
                ),
              );
              // Navigator.pop(context, () {
              //   setState(() {});
              // });
            },
          ),
        ],
      ),
    );
  }
}
