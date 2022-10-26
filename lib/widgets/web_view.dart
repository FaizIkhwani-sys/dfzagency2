import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:dfzagency/dfz.dart';
class AppWebViewPage extends StatelessWidget {
  final String appBarTitle;
  final String url;

  const AppWebViewPage({
    required this.appBarTitle,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return AppSecondaryBar(
      title: appBarTitle ,
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}