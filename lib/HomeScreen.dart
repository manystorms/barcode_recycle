import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:barcode_recycle/ResScreen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  void OpenResScreen(String barcode) {
    int barcodeNum = int.parse(barcode);
    if(barcodeNum == -1) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResScreen(Barcode_num: barcodeNum,)),
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
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation:0,
        centerTitle:false,
        automaticallyImplyLeading: false,
        backgroundColor:Color(0x00ffffff),
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.zero,
        ),
      ),
      body:Padding(
        padding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
        child:SingleChildScrollView(
          child:
          Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisSize:MainAxisSize.max,
            children: [
              Padding(
                padding:EdgeInsets.fromLTRB(0, 0, 0, 30),
                child:Lottie.asset(
                  "assets/question_people_lottie.json",
                  height:200,
                  width:200,
                  fit:BoxFit.contain,
                  repeat: true,
                  animate: true,
                ),
              ),
              Text(
                "Did someone forgot their Password?",
                textAlign: TextAlign.center,
                overflow:TextOverflow.clip,
                style:TextStyle(
                  fontWeight:FontWeight.w700,
                  fontStyle:FontStyle.normal,
                  fontSize:16,
                  color:Color(0xff000000),
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 30,horizontal:0),
                child:TextField(
                  controller: _controller,
                  obscureText:false,
                  textAlign:TextAlign.start,
                  maxLines:1,
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:14,
                    color:Color(0xff000000),
                  ),
                  decoration:InputDecoration(
                    disabledBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(30.0),
                      borderSide:BorderSide(
                          color:Color(0xff696767),
                          width:1.5
                      ),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(30.0),
                      borderSide:BorderSide(
                          color:Color(0xff696767),
                          width:1.5
                      ),
                    ),
                    enabledBorder:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(30.0),
                      borderSide:BorderSide(
                          color:Color(0xff696767),
                          width:1.5
                      ),
                    ),
                    hintText:"바코드를 입력하시오",
                    hintStyle:TextStyle(
                      fontWeight:FontWeight.w400,
                      fontStyle:FontStyle.normal,
                      fontSize:14,
                      color:Color(0xff696767),
                    ),
                    filled:true,
                    fillColor:Color(0x00ffffff),
                    isDense:false,
                    contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
                  ),
                ),
              ),
              MaterialButton(
                onPressed:(){
                  OpenResScreen(_controller.text);
                },
                color:Color(0xff3a57e8),
                elevation:0,
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(30.0),
                ),
                padding:EdgeInsets.all(16),
                child:Text("바코드 검색", style: TextStyle(fontSize:16,
                    fontWeight:FontWeight.w700,
                    fontStyle:FontStyle.normal,
                  ),
                ),
                textColor:Color(0xffffffff),
                height:50,
                minWidth:MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 20),
              MaterialButton(
                onPressed:(){
                  scanBarcode();
                },
                color:Color(0xff3a57e8),
                elevation:0,
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(30.0),
                ),
                padding:EdgeInsets.all(16),
                child:Text("바코드 스캔", style: TextStyle(fontSize:16,
                  fontWeight:FontWeight.w700,
                  fontStyle:FontStyle.normal,
                ),
                ),
                textColor:Color(0xffffffff),
                height:50,
                minWidth:MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
