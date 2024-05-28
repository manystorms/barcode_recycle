import 'package:flutter/material.dart';
import 'package:barcode_recycle/res_screen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Button and Text Input',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  void OpenResScreen(String barcode) {
    int barcodeNum = int.parse(barcode);
    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => res_screen(barcode_num: barcodeNum,)),
    );
  }

  Future<void> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', // 스캐너 라인 색상
      'Cancel', // 취소 버튼 텍스트
      true, // 플래시 아이콘 사용 여부
      ScanMode.BARCODE, // 스캔 모드 (BARCODE or QRCODE)
    );

    OpenResScreen(barcodeScanRes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera_alt, size: 50.0),
              onPressed: () {
                scanBarcode();
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '바코드를 입력해주세요',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if(RegExp(r'^\d{13}$').hasMatch(_controller.text)) OpenResScreen(_controller.text);
                else print('error');
              },
              child: Text('검색'),
            ),
          ],
        ),
      ),
    );
  }
}