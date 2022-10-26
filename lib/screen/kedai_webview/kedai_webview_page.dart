import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';

class KedaiWebviewPage extends StatefulWidget {
  @override
  State<KedaiWebviewPage> createState() => _KedaiWebviewPageState();
}

class _KedaiWebviewPageState extends State<KedaiWebviewPage> {
  @override
  Widget build(BuildContext context) {
    return const AppWebViewPage(
      appBarTitle: "DFZRIDER",
      url: 'https://dfzrider.my/',
    );
  }
}