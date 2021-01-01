import 'package:cinemabook/data/repository/movie_repository.dart';
import 'package:cinemabook/presentation/constants.dart';
import 'package:flutter/material.dart';
import '../../get_it.dart' as getIt;

class SeatSelector extends StatefulWidget {
  final String movieID;
  const SeatSelector(this.movieID, {Key key}) : super(key: key);

  @override
  _SeatSelectorState createState() => _SeatSelectorState();
}

class _SeatSelectorState extends State<SeatSelector> {
  //row=9
  //column=11
  // 1 is free seats
  // 2 is selected seats
  // 3 is reserved seats
  var _chairStatus = [
    [2, 2, 2, 2, 2, 3, 2, 2, 2, 2, 2],
    [2, 2, 2, 2, 3, 2, 2, 2, 2, 2, 2],
    [1, 2, 2, 2, 2, 3, 3, 2, 2, 2, 2],
    [2, 2, 2, 2, 3, 2, 2, 2, 2, 2, 2],
    [2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2],
    [2, 2, 2, 1, 2, 3, 2, 2, 2, 2, 2],
    [2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2],
    [2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2],
    [2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3],
  ];

  @override
  Widget build(BuildContext context) {
    return _chairList();
  }

  Widget _chairList() {
    Future<void> changeRawData() async {
      final _chairStatus2 = await getSeatdata();
    }

    changeRawData();
    Size size = MediaQuery.of(context).size;

    var _chairLetters = ['I', 'H', 'G', 'F', 'E', 'D', 'C', 'B', 'A'];

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          for (int i = 0; i < 9; i++)
            Container(
              color: Colors.grey[200],
              margin: EdgeInsets.only(top: i % 3 == 0 ? size.height * .02 : 0),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    for (int x = 0; x < 11; x++)
                      Expanded(
                        child: x == 0
                            ? Text(_chairLetters[i])
                            : Container(
                                height: size.width / 11 - 10,
                                margin: EdgeInsets.all(3),
                                child: _chairStatus[i][x - 1] == 1
                                    ? selectedChair("1", i, x)
                                    : _chairStatus[i][x - 1] == 2
                                        ? selectedChair("2", i, x)
                                        : selectedChair("3", i, x),
                              ),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  getSeatdata() async {
    //widget.movieID.toString()
    MovieRepository repositoryInstance = getIt.getItInstance();
    final movieXml = await repositoryInstance.getMovieDataFromXML("508442");

    return movieXml;
  }

  Widget selectedChair(String flag, int i, int x) {
    return GestureDetector(
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: flag == "1"
            ? BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(6.0))
            : BoxDecoration(
                color: flag == "2" ? kPrimaryColor : kTextColor,
                borderRadius: BorderRadius.circular(6.0),
              ),
      ),
      onTap: () {
        if (flag == "3") {
          print("You can't change them..");
        } else {
          print("Tapped a Container-------" +
              _chairStatus[i][x].toString() +
              "---" +
              i.toString() +
              "---" +
              x.toString());
          _chairStatus[i][x] = _chairStatus[i][x] == 1 ? 2 : 1;
          setState(() {});
        }
      },
    );
  }
}
