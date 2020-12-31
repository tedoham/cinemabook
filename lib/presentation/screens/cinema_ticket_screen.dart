import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cinemabook/presentation/constants.dart';
import 'package:cinemabook/presentation/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker_saver/image_picker_saver.dart';

class CinemaTicketScreen extends StatefulWidget {
  @override
  _CinemaTicketScreenState createState() => _CinemaTicketScreenState();
}

class _CinemaTicketScreenState extends State<CinemaTicketScreen> {
  GlobalKey globalKey = new GlobalKey();

  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage();
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      // var bs64 = base64Encode(pngBytes);

      final path = await getApplicationDocumentsDirectory();

      // final tempDir = await getTemporaryDirectory();
      // final file = await new File('${tempDir.path}/image.png').create();
      // await file.writeAsBytes(pngBytes);
      //   var filePath = await ImagePickerSaver.saveFile(
      //     fileData:byteData.buffer.asUint8List() );
      // print(filePath);

      print("----33----2222-----999");
      print(image);
      // print(tempDir);
      print(byteData);
      // print(file);
      // print(bs64.length.toString());
      print("----33----2222-----999");

      return pngBytes;

      // final channel = const MethodChannel('channel:me.alfian.share/share');
      // channel.invokeMethod('shareFile', 'image.png');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _capturePng() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();

    //Request permissions if not already granted
    if (!(await Permission.storage.status.isGranted))
      await Permission.storage.request();

    var filePath = await ImagePickerSaver.saveFile(fileData: pngBytes);

    print(pngBytes);
    print(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        title: Text('Your Ticket'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RepaintBoundary(
              key: globalKey,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      "Movie Title",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    QrImage(
                      size: 280,
                      gapless: false,
                      data: '1234567890',
                      version: QrVersions.auto,
                      foregroundColor: Colors.black87,
                      backgroundColor: Colors.white,
                    ),
                    Divider(
                      color: Colors.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date", style: TextStyle(color: Colors.blue)),
                            Text("Friday 12, 2020"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Time", style: TextStyle(color: Colors.blue)),
                            Text("4:30 PM"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.blue)),
                            Text("Friday 12, 2020"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Time", style: TextStyle(color: Colors.blue)),
                            Text("4:30 PM"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Notice",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("1. Keep this receipt safe and private."),
                          Text("2. Do not share or duplicate this recipt."),
                          Text("3. The above Code is valid for only one use."),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            LargeButton(
                label: "Save your ticket as image",
                iconData: Icons.arrow_forward,
                onTap: _capturePng
                // () {
                //   print("----44444440000000000000--------------->>>>>>>>");

                //   // Navigator.push(
                //   //   context,
                //   //   MaterialPageRoute(builder: (context) => CinemaTicketScreen()),
                //   // );
                // },
                ),
          ],
        ),
      ),
    );
  }
}
