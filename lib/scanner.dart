import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<Scan> {
  final GlobalKey qrKey = GlobalKey();
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Barcode Scanner Example'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: QRView(
                key: qrKey,
                onQRViewCreated: (controller) {
                  controller.scannedDataStream.listen((value) {
                    setState(() {
                      barcode = value;
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
