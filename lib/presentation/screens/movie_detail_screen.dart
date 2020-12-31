import 'package:cinemabook/data/core/api_constants.dart';
import 'package:cinemabook/data/model/all_movie_model.dart';
import 'package:cinemabook/get_it.dart';
import 'package:cinemabook/logic/bloc/movie_detail_bloc/moviedetail_bloc.dart';
import 'package:cinemabook/presentation/constants.dart';
import 'package:cinemabook/presentation/screens/cinema_seat_screen.dart';
import 'package:cinemabook/presentation/widgets/Button.dart';
import 'package:cinemabook/presentation/widgets/OutlineButton.dart';
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
  MoviedetailBloc _movieDetailBloc;
  // @override
  void initState() {
    // print("----init----" + widget.movieDetailId.toString());
    _movieDetailBloc = BlocProvider.of<MoviedetailBloc>(context);
    _movieDetailBloc.add(LoadMovieDetail(widget.movieDetailId));

    super.initState();
  }

  @override
  void dispose() {
    _movieDetailBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    DateTime startDate = now;
    DateTime endDate = now.add(Duration(days: 14));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        title: Text('Movie Detail'),
      ),
      body: BlocBuilder<MoviedetailBloc, MoviedetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            
            return buildLoading();
          } else if (state is MovieDetailLoaded) {
            
            return state.movie != null
                ? _movieDetailWidget(
                    context, startDate, endDate, now, state.movie)
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
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadingEmpty() {
    return Center(
      child: Text("empty...."),
    );
  }

  Widget buildLoadingError() {
    return Center(
      child: Text("error...."),
    );
  }

  Widget _movieDetailWidget(BuildContext context, DateTime startDate,
      DateTime endDate, DateTime now, movie) {
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
                    "4.9",
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
                    "111 mins",
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
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Synopsis",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Action"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Drama"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Drama"),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
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
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     SmallButton(
                //       label: "Continue to seat selector",
                //       onTap: () {
                //         print("----7d7d7d7d7d7d7--------------->>>>>>>>");
                //         // Navigator.push(
                //         //   context,
                //         //   MaterialPageRoute(
                //         //       builder: (context) => MovieDetailScreen()),
                //         // );
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          LargeButton(
            label: "Continue to seat selector",
            iconData: Icons.arrow_forward,
            onTap: () {
              print("----44444440000000000000--------------->>>>>>>>");
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) =>
              //           CinemaSeatScreen("movieInfo: widget.movieDetail")),
              // );
            },
          ),
        ],
      ),
    );
  }
}
