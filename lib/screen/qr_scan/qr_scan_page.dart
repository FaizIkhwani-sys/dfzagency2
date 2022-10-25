import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:dfzagency/dfz.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class QrScanPage extends StatelessWidget {
  const QrScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _BarCodeScanner(),
    );
  }
}

class _BarCodeScanner extends StatefulWidget {
  const _BarCodeScanner({Key? key}) : super(key: key);

  @override
  State<_BarCodeScanner> createState() => _BarCodeScannerState();
}

class _BarCodeScannerState extends State<_BarCodeScanner> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    scanBarcodeNormal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (_scanBarcode != 'Unknown')
          ? Center(child: Text(_scanBarcode))
          : Container(),
    );
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print('barcodescanres $barcodeScanRes');
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
}
