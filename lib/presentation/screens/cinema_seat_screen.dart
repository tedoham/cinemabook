import 'package:cinemabook/data/model/all_movie_model.dart';
import 'package:cinemabook/presentation/constants.dart';
import 'package:cinemabook/presentation/screens/CinemaSeatSelector.dart';
import 'package:cinemabook/presentation/screens/SeatSelector.dart';
import 'package:cinemabook/presentation/widgets/Button.dart';
import 'package:flutter/material.dart';

class CinemaSeatScreen extends StatefulWidget {
  final AllMovieModel movieInfo;

  const CinemaSeatScreen({Key key, this.movieInfo}) : super(key: key);

  @override
  _CinemaSeatScreenState createState() => _CinemaSeatScreenState();
}

class _CinemaSeatScreenState extends State<CinemaSeatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        title: Text('Select Your Seat'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  child: Text(
                    widget.movieInfo.title,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Schedule Selected",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[500],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "FRIDAY, 12 | 09:30 AM",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // TicketPage()
            // FlightTicketApp()
            // Container(
            //   color: Colors.grey,
            SizedBox(height: 5),
            Divider(color: Colors.grey[500]),
            // SizedBox(height: 5),
            Container(
              // color: Colors.grey[300],
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Hall 1 :Block A",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Tap on your prefered seat",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SeatSelector(),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          child: BuildChairs.availableChair(),
                        ),
                        SizedBox(width: 10),
                        Text("Available"),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          child: BuildChairs.reservedChair(),
                        ),
                        SizedBox(width: 10),
                        Text("Booked"),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          child: BuildChairs.selectedChair(),
                        ),
                        SizedBox(width: 10),
                        Text("Your Selection"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            //   shape: RoundedRectangleBorder(
            // side: BorderSide(
            //     color: Colors.grey[400], width: 2, style: BorderStyle.solid),
            // borderRadius: BorderRadius.circular(15.0)),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400]),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("TICKET QTY "),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "2",
                  //       style: TextStyle(color: Colors.black, fontSize: 30),
                  //     ),
                  //     _ticketQty("1")
                  //   ],
                  // ),
                  _ticketQty("1"),
                  // Divider(
                  //   thickness: 3,
                  //   height: 20,
                  // ),
                  Text("TOTAL PAYABLE: "),
                  Text(
                    "75 Br",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            LargeButton(
              label: "Confirm your purchase",
              iconData: Icons.arrow_forward,
              onTap: () {
                print("----44444440000000000000--------------->>>>>>>>");
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) =>
                //           CinemaSeatScreen(movieInfo: widget.movieDetail)),
                // );
              },
            ),

            // ),
          ],
        ),
      ),

      // ],
      // ),
      // ),
    );
  }

  DropdownButton _ticketQty(_value) => DropdownButton<String>(
        iconEnabledColor: Colors.black,
        style: TextStyle(color: Colors.black, fontSize: 30),
        items: [
          DropdownMenuItem(
            value: "1",
            child: Text(
              "1",
            ),
          ),
          DropdownMenuItem(
            value: "2",
            child: Text(
              "2",
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
        value: _value,
      );
}
