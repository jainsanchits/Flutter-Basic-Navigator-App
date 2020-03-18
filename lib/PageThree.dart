import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ConnectionStatusSingleton.dart';

class PageThree extends StatefulWidget {
  @override
  PageThreeState createState() => new PageThreeState();
}

class PageThreeState extends State<PageThree> {
  StreamSubscription _connectionChangeStream;

  bool isOffline = false;

  @override
  initState() {
    super.initState();

    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);
  }

  void connectionChanged(dynamic hasConnection) {
    if(this.mounted) {
      setState(() {
        isOffline = !hasConnection;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("PageThree");

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("PageThree"),
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text("Last Page Three"),
            new SizedBox(
              height: 15.0,
            ), //Last Page Text
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: new Text("Back"),
            )
          ],
        ),
      ),
    );
  }
}