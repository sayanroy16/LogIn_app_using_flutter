import 'package:flutter/material.dart';

void main() {
  runApp(
      new MaterialApp(debugShowCheckedModeBanner: false, home: new Transfer()));
}

class Transfer extends StatefulWidget {
  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Transfer'),
    );
  }
}
