import 'package:cinemabook/presentation/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeatSelector extends StatefulWidget {
  @override
  _SeatSelectorState createState() => _SeatSelectorState();
}

class _SeatSelectorState extends State<SeatSelector> {
  List<Seat> _item;
  int _row = 9;
  int _column = 11;
  List<List<Seat>> _tmp;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return _chairList();
  }

  Widget _chairList() {
    Size size = MediaQuery.of(context).size;

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
                    for (int x = 0; x < 11; x++) //BuildChairs.reservedChair(),
                      // Text("*" + " __ " + x.toString() + "#")
                      Expanded(
                        // child: BuildChairs.selectedChair(),
                        // flex: 1,
                        // child: BuildChairs.reservedChair(),
                        child: x == 0
                            ? Text(_chairLetters[i])
                            : Container(
                                height: size.width / 11 - 10,
                                margin: EdgeInsets.all(4),
                                child: _chairStatus[i][x - 1] == 1
                                    ? selectedChair("1")
                                    : _chairStatus[i][x - 1] == 2
                                        ? selectedChair("2")
                                        : selectedChair("3"),
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

  Widget selectedChair(flag) {
    return InkWell(
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
          print("Tapped a Container-------" + flag);
        }
      },
    );
  }
}

class Seat {
  final bool isAvailable;

  Seat({this.isAvailable});
}
