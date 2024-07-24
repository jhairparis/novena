import 'package:novena/models/model.dart';

class PrayerModel extends BaseModel {
  PrayerModel({
    required super.name,
    required super.fileName,
    required super.image,
    required super.type,
    required super.haveNext,
  });

  static List<PrayerModel> getPrayers() {
    List<PrayerModel> prayers = [];

    prayers.add(PrayerModel(
      name: "Novena de aguinaldos",
      fileName: "${BaseModel.url}/source/txt/prayers/NdeA.txt",
      type: "Todos los dias",
      image: "${BaseModel.url}/source/img/prayers/NdeA.webp",
      haveNext: true,
    ));

    prayers.add(PrayerModel(
      name: "Santisima virgen",
      fileName: "${BaseModel.url}/source/txt/prayers/SV.txt",
      type: "Todos los dias",
      image: "${BaseModel.url}/source/img/prayers/SV.webp",
      haveNext: true,
    ));

    prayers.add(PrayerModel(
      name: "San jose",
      fileName: "${BaseModel.url}/source/txt/prayers/SJ.txt",
      type: "Todos los dias",
      image: "${BaseModel.url}/source/img/prayers/SJ.webp",
      haveNext: true,
    ));
    prayers.add(PrayerModel(
      name: "Nino jesus",
      fileName: "${BaseModel.url}/source/txt/prayers/NJ.txt",
      type: "Todos los dias",
      image: "${BaseModel.url}/source/img/prayers/NJ.webp",
      haveNext: false,
    ));

    prayers[0].next = prayers[1];
    prayers[1].next = prayers[2];
    prayers[2].next = prayers[3];

    return prayers;
  }
}
