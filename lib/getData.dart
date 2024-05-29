import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class RecycleData {
  String TitleOfRecycle = "No data";
  String SubTitleOfRecycle = "No data";
  String WayToRecycle = "No data";
  String ImagePath = "NoImage";

  Future<void> getRecycleData(int Barcode_num) async{
    const csvFilePath = "assets/Barcode_Data.csv";

    final rawData = await rootBundle.loadString(csvFilePath);
    List<List<dynamic>> listData = CsvToListConverter().convert(rawData);
    for (var row in listData) {
      if(int.parse(row[0].toString()) == Barcode_num) {
        TitleOfRecycle = row[1];
        SubTitleOfRecycle = row[2];
        WayToRecycle = row[3].toString().replaceAll(r'\n', '\n');;

        String ImageName = row[4];
        ImagePath = "assets/"+ImageName+".jpg";
        return;
      }
    }
  }
}