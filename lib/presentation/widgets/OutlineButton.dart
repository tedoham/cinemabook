import 'package:cinemabook/presentation/constants.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const SmallButton({Key key, this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: MediaQuery.of(context).size.width,
      color: Colors.transparent,

      child: Text(
        label,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
        textAlign: TextAlign.left,
      ), //`Text` to display

      onPressed: onTap,

      padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
      splashColor: Colors.grey,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.grey[400], width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(15.0)),
    );
  }
}

// import 'package:cinemabook/presentation/constants.dart';
// import 'package:flutter/material.dart';

// class SmallButton extends StatelessWidget {
//   final String label;
//   final Function onTap;

//   const SmallButton({Key key, this.label, this.onTap}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       clipBehavior: Clip.none,
//       child: Text(
//         label,
//         style: TextStyle(color: Colors.black45, fontSize: 16),
//       ),

//       style: OutlinedButton.styleFrom(
//         primary: Colors.black,

//         // backgroundColor: Colors.amber,
//         // padding: EdgeInsets.all(25)
//       ),
//       // borderSide: BorderSide(color: Colors.grey[400], width: 2.0),
//       onPressed: onTap,
//       // padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
//       // splashColor: Colors.grey,
//       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//     );
//   }
// }
