import 'package:cinemabook/data/core/api_constants.dart';
import 'package:cinemabook/data/model/all_movie_model.dart';
import 'package:cinemabook/data/model/movie_model.dart';
import 'package:cinemabook/data/model/movies_result_model.dart';
import 'package:cinemabook/logic/bloc/movie_bloc.dart';
import 'package:cinemabook/presentation/constants.dart';
// import 'package:cinemabook/presentation/cubit/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  @override
  Widget build(BuildContext context) {
    // get screen width
    final Size screenSize = MediaQuery.of(context).size;

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
              print("**********---loaded----***********");
              print(state.movies.length);
              print("**********---loaded----***********");
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
    // return GridView.builder(
    //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //       maxCrossAxisExtent: 200,
    //       childAspectRatio: 1,
    //       crossAxisSpacing: 10,
    //       mainAxisSpacing: 0),
    //   itemCount: movieList.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       alignment: Alignment.center,
    //       child: Image.network(
    //         ApiConstants.BASE_IMAGE_URL + movieList[index].posterPath,
    //       ),
    //     );
    //   },
    //   // ),
    // );
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        ApiConstants.BASE_IMAGE_URL +
                            movieList[index].posterPath,
                        // width: 300,
                        // height: 300,
                      ),
                      Center(
                        child: Text(movieList[index].title,
                            style: TextStyle(fontSize: 18.0),
                            overflow: TextOverflow.ellipsis),
                      ),
                      // Text(movieList[index].voteCount.toString()),
                      // Text(movieList[index].title),
                      // Text(movieList[index].title),
                      // Text(movieList[index].title),
                      // Text(movieList[index].mediaType),
                    ],
                  ),
                );
              },
              childCount: movieList.length,
            ),
          ),
        )
      ],
    );
    //         // crossAxisSpacing: 10,
    //         // mainAxisSpacing: 10,
    //         // crossAxisCount: 2,
    //         // children: <Widget>[
    //         // ListView.builder(
    //         //   itemCount: movieList.length,
    //         //   itemBuilder: (context, index) {
    //         //     return Container(
    //         //       height: 50,
    //         //       color: Colors.grey[(index * 200) % 400],
    //         //       child: Center(
    //         //         child: Text(
    //         //           movieList[index].title,
    //         //           style: TextStyle(fontSize: 20),
    //         //         ),
    //         //       ),
    //         //     );
    //         //   },
    //         // ),
    //         // Container(
    //         //   padding: const EdgeInsets.all(8),
    //         //   child: const Text("movieList"),
    //         //   color: Colors.green[100],
    //         // ),
    //         // ],
  }

//     child: ListView(
//       children: schedules.map((schedule) {
//         return Card(
//           child: ListTile(
//             leading: Text(schedule.busName, style: TextStyle(fontSize: 20)),
//             title: Text(schedule.departureDestination +
//                 " - " +
//                 schedule.arrivalDestination),
//             subtitle: Text('Price ${schedule.ticketPrice} birr'),
//             onTap: () {},
//           ),
//         );
//       }).toList(),
//     ),
//   );
// }

  // ListView.builder(
  //   itemCount: schedules.length,
  //   itemBuilder: (context, index) {
  //     return Container(
  //       height: 50,
  //       color: Colors.grey[(index * 200) % 400],
  //       child: Center(
  //         child: Text(
  //           schedules[index].busName,
  //           style: TextStyle(fontSize: 20),
  //         ),
  //       ),
  //     );
  //   },
  // )

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

  Widget buildLoadedData() {
    return Center(
      child: Text("data...."),
    );
  }
}
//   Column buildColumnWithData(List<Movie> movie) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Text(
//           movie.toString(),
//           style: TextStyle(
//             fontSize: 40,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         Text(
//           // Display the temperature with 1 decimal place
//           movie.toString(),
//           style: TextStyle(fontSize: 80),
//         ),
//         // CityInputField(),
//       ],
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: kPrimaryColor,
//         elevation: 0.0,
//         title: Text('Trending Movies'),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Container(
//               height: 200,
//               child: Placeholder(),
//             )
//           ],
//         ),
//       ),
//     );
//   }

// height: 80.0,
// width: MediaQuery.of(context).size.width / 2,
// decoration: BoxDecoration(
//   color: kTextColor,
//   borderRadius: BorderRadius.all(Radius.circular(48.0)),
// ),
// child: Center(
//   child: Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Text(
//       "Trending Movies",
//       style: TextStyle(color: Colors.white, fontSize: 22.0),
//     ),
//   ),
// )
// Icon(
//   Icons.add_business_sharp,
//   color: Colors.white,
//   size: 28.0,
// ),
// AppBar buildAppBar() {
//   return AppBar(
//     backgroundColor: Colors.white,
//     elevation: 0,
//     title: Text("Now Showing"),
//     leading: IconButton(
//       // icon: SvgPicture.asset("assets/icons/back.svg"),
//       icon: Icon(
//         Icons.access_alarm,
//         color: kTextColor,
//       ),
//       onPressed: () {},
//     ),
//     actions: <Widget>[
//       IconButton(
//         // icon: SvgPicture.asset(
//         //   "assets/icons/search.svg",
//         //   // By default our  icon color is white
//         //   color: kTextColor,
//         // ),
//         icon: Icon(
//           Icons.account_circle_rounded,
//           color: kTextColor,
//         ),
//         onPressed: () {},
//       ),
//       IconButton(
//         // icon: SvgPicture.asset(
//         //   "assets/icons/cart.svg",
//         //   // By default our  icon color is white
//         //   color: kTextColor,
//         // ),
//         icon: Icon(
//           Icons.airline_seat_legroom_extra,
//           color: kTextColor,
//         ),
//         onPressed: () {},
//       ),
//       SizedBox(width: kDefaultPaddin / 2)
//     ],
//   );
// }
// }
