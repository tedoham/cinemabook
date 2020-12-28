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
            // print("**********7887878***********");
            // // print(context.read());
            // print(state);
            // print("**********7887878***********");

            if (state is MovieLoading) {
              print("**********loading***********");
              return buildLoading();
            } else if (state is MovieLoaded) {
              print("**********---loaded----***********");
              print(state.movies.length.toString());
              print("**********---loaded----***********");
              return buildMovieLoaded(state.movies);
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

  Widget buildMovieLoaded(List<Movie> movie) {
    return Center(
      child: Text("movie.toString()"),
    );
  }

  Widget buildLoadingError() {
    return Center(
      child: Text("error...."),
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
