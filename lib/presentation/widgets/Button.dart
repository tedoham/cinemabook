import 'package:cinemabook/presentation/constants.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Function onTap;

  const LargeButton({Key key, this.label, this.onTap, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      minWidth: MediaQuery.of(context).size.width,
      color: kPrimaryColor,
      //`Icon` to display
      label: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ), //`Text` to display

      icon: Icon(
        iconData,
        color: Colors.white,
      ),

      onPressed: onTap,

      padding: EdgeInsets.fromLTRB(35, 20, 35, 20),
      splashColor: Colors.grey,
      // shape:
      //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
    );
  }
}
