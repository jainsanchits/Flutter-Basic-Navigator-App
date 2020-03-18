import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ConnectionStatusSingleton.dart';

class PageTwo extends StatefulWidget {
  @override
  PageTwoState createState() => new PageTwoState();
}

class PageTwoState extends State<PageTwo> {
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
    print("PageTwo");

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("PageTwo"),
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/pageThree');
              },
              child: new Text("Click to Page Three"),
            ),
            new SizedBox(
              height: 15.0,
            ),
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