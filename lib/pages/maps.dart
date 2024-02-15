// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io' show Platform;

class SearchPage extends StatefulWidget {
  @override
  _MapWebViewState createState() => _MapWebViewState();
}

class _MapWebViewState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isWindows) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
        ),
        body: Center(
          child: Text(
            'Map functionality is not supported on Windows.',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
        ),
        body: WebView(
          initialUrl: 'https://www.google.com/maps',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      );
    }
  }
}
