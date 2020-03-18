import 'dart:async';
import 'package:flutter/material.dart';

import 'ConnectionStatusSingleton.dart';

class TestWidget extends StatefulWidget {
  @override
  TestWidgetState createState() => new TestWidgetState();
}

class TestWidgetState extends State<TestWidget> {
  StreamSubscription _connectionChangeStream;

  bool isOffline = false;

  @override
  initState() {
    super.initState();

    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      print("Changed State");
    });
  }

  @override
  Widget build(BuildContext ctxt) {
    return Text("HEllO"); /*new Container(
      child: Center(
        child: isOffline ? showInternetDialog(ctxt, "", "Hurray Connected") : showInternetDialog(ctxt, "", "Oops NotConnected"),
      )
    );*/
  }
}



showInternetDialog(BuildContext context,String title,String subText) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(subText),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
