library home_view;

import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';

class HomeView {
  BuildContext context;
  String ipAddress = 'Unknown';
  TextEditingController controller;
  Function getIPAddress;

  HomeView({this.context, this.ipAddress, this.controller, this.getIPAddress});

  // This method is rerun every time setState is called, for instance as done
  // by the _incrementCounter method above.
  //
  // The Flutter framework has been optimized to make rerunning build methods
  // fast, so that you can just rebuild anything that needs updating rather
  // than having to individually change instances of widgets.
  Center getCenter (String appBarTitle) {
    return new Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: new Column(
        // Column is also layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug paint" (press "p" in the console where you ran
        // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
        // window in IntelliJ) to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            controller: controller,
            decoration: new InputDecoration(
              hintText: 'Type something',
            ),
          ),
          new Text('Your input was: ' + controller.text),
          new Text(
            'Your IP address is:',
          ),
          new Text(
            '$ipAddress',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );
  }
}
