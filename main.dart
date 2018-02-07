// import 'dart:convert';
// import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

import 'ip_address.dart';
import 'home_view.dart';
import 'alt_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'What\'s my ip?'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = new TextEditingController();
  var _ipAddress = 'Unknown';

  Future<Null> _getIPAddress(BuildContext context) async {
    String result;
    var ip = new IPAddress();
    result = await ip.get();

    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text("Snack time!")));

    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Widget buildPage(BuildContext context) {
    var page;

    page = (new HomeView(
      context: context,
      ipAddress: _ipAddress,
      controller: _controller,
      getIPAddress: _getIPAddress,
    )).getCenter(widget.title);

    // if (_ipAddress != 'Unknown') {
    //   page = (new HomeView(
    //     context: context,
    //     ipAddress: _ipAddress,
    //     controller: _controller,
    //     getIPAddress: _getIPAddress,
    //   )).getCenter(widget.title);
    // }

    // if (_ipAddress == 'Unknown') {
    //   Scaffold.of(context).showSnackBar(new SnackBar(
    //     content: new Text("Snack time!")));

    //   page = (new AltView(
    //     context: context,
    //     ipAddress: _ipAddress,
    //     controller: _controller,
    //     getIPAddress: _getIPAddress,
    //   )); // .getCenter('good job!');
    // }

    return new SafeArea(
      top: false,
      bottom: false,
      child: page,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      body: new Builder(builder: buildPage),
    );
  }
}
