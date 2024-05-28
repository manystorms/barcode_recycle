import 'package:flutter/material.dart';

class res_screen extends StatelessWidget {
  int barcode_num = 0;
  res_screen({required this.barcode_num});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('재활용 방법'),
      ),
      body: Center(
        child: Text(barcode_num.toString()),
      ),
    );
  }
}