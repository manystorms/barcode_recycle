import 'package:flutter/material.dart';

class ResScreen extends StatelessWidget {
  int Barcode_num = 0;
  ResScreen({required this.Barcode_num});

  String TitleOfRecycle = "No data";
  String SubTitleOfRecycle = "No data";
  String WayToRecycle = "No data";

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
                Barcode_num.toString(),
                textAlign: TextAlign.start,
                overflow:TextOverflow.clip,
                style:TextStyle(
                  fontWeight:FontWeight.w700,
                  fontStyle:FontStyle.normal,
                  fontSize:16,
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
                        SubTitleOfRecycle,
                        textAlign: TextAlign.start,
                        overflow:TextOverflow.clip,
                        style:TextStyle(
                          fontWeight:FontWeight.w700,
                          fontStyle:FontStyle.normal,
                          fontSize:14,
                          color:Color(0xff000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius:BorderRadius.circular(12.0),
                child:
                ///***If you have exported images you must have to copy those images in assets/images directory.
                Image(
                  image:NetworkImage("https://image.freepik.com/free-photo/happy-lady-stylish-skirt-boater-posing-pink-wall_197531-23653.jpg"),
                  height:200,
                  width:MediaQuery.of(context).size.width,
                  fit:BoxFit.cover,
                ),
              ),
              Text(
                WayToRecycle,
                textAlign: TextAlign.left,
                overflow:TextOverflow.clip,
                style:TextStyle(
                  fontWeight:FontWeight.w400,
                  fontStyle:FontStyle.normal,
                  fontSize:14,
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
