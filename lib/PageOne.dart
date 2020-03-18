import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ConnectionStatusSingleton.dart';

class PageOne extends StatefulWidget {
  @override
  PageOneState createState() => new PageOneState();
}

class PageOneState extends State<PageOne> {
  StreamSubscription _connectionChangeStream;

  bool isOffline = false;
  BuildContext ctx = null;

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
        showDialogInternet(ctx, isOffline);
      });
    }
  }

  @override
  Widget build(BuildContext ctxt) {
    ctx = ctxt;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("PageOne"),
      ),
      body: new Center(
        child:new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/pageTwo');
                },
                child: new Text("Click to Page Two"),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new RaisedButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: new Text("Exit"),
              ),
            ],
          ),
      ),
    );
  }

  showDialogInternet(BuildContext context,bool state) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { Navigator.of(context).pop();},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Connectivity"),
      content: Text(state ? "No Internet Connected": "Internet Connected"),
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
}