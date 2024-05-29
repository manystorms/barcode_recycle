import 'package:flutter/material.dart';
import 'package:barcode_recycle/getData.dart';

class ResScreen extends StatefulWidget {
  final int Barcode_num;

  ResScreen({required this.Barcode_num});

  @override
  _ResScreenState createState() => _ResScreenState();
}

class _ResScreenState extends State<ResScreen> {
  int Barcode_num = 0;

  RecycleData Data = RecycleData();

  void getData() async{
    await Data.getRecycleData(widget.Barcode_num);
    setState(() {});
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: Text('재활용 방법'),
      ),
      body:Padding(
        padding:EdgeInsets.all(16),
        child:SingleChildScrollView(
          child:
          Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisSize:MainAxisSize.max,
            children: [
              Text(
                Data.TitleOfRecycle,
                textAlign: TextAlign.start,
                overflow:TextOverflow.clip,
                style:TextStyle(
                  fontWeight:FontWeight.w700,
                  fontStyle:FontStyle.normal,
                  fontSize:20,
                  color:Color(0xffff5630),
                ),
              ),
              Padding(
                padding:EdgeInsets.fromLTRB(0, 8, 0, 16),
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisSize:MainAxisSize.max,
                  children:[
                    Expanded(
                      flex: 1,
                      child: Text(
                        Data.SubTitleOfRecycle,
                        textAlign: TextAlign.start,
                        overflow:TextOverflow.clip,
                        style:TextStyle(
                          fontWeight:FontWeight.w700,
                          fontStyle:FontStyle.normal,
                          fontSize:17,
                          color:Color(0xff000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if(Data.ImagePath != 'NoImage')
                ClipRRect(
                  borderRadius:BorderRadius.circular(12.0),
                  child: Image(
                    image: AssetImage(Data.ImagePath),
                    height:200,
                    width:MediaQuery.of(context).size.width,
                    fit:BoxFit.cover,
                  ),
                ),
              SizedBox(height: 20),
              Text(
                Data.WayToRecycle,
                textAlign: TextAlign.left,
                overflow:TextOverflow.clip,
                style:TextStyle(
                  fontWeight:FontWeight.w400,
                  fontStyle:FontStyle.normal,
                  fontSize:17,
                  color:Color(0xff000000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
