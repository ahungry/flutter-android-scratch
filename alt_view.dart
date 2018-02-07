library alt_view;

import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';

class AltView extends StatefulWidget {
  BuildContext context;
  String ipAddress = 'Unknown';
  TextEditingController controller;
  Function getIPAddress;

  AltView({Key key, this.context, this.ipAddress, this.controller, this.getIPAddress}) : super(key: key);


  @override
  _AltViewState createState() => new _AltViewState();
}

class _AltViewState extends State<AltView> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.


    // Scaffold.of(context).showSnackBar(new SnackBar(
    //   content: new Text("Snack Time!")));

    return new Center(
      child: new Container(
        width: 320.0,
        height: 240.0,
        color: Colors.grey[900],

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Text(
          "Your IP Address: \n ipAddress",
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}
