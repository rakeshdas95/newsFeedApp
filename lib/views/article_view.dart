import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {


  final String blogUrl;
  ArticleView({this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();
  bool _loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("My"),
        Text("News",style: TextStyle(
            color: Colors.blue
        ),)
      ],
    ),
    actions: <Widget>[
      Opacity(
          opacity: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.add),
          ),)
    ],
    elevation: 0.0,
    ),
      body:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            initialUrl: widget.blogUrl,
            onWebViewCreated: ((WebViewController webViewController){
              _completer.complete(webViewController);

            }),
          ),
        ),
      );

  }
}
