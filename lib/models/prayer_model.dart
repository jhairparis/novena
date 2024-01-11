import 'package:flutter/material.dart';
import 'package:novena/models/model.dart';

class PrayerModel extends BaseModel {
  Color boxColor;

  PrayerModel({
    required this.boxColor,
    required super.name,
    required super.fileName,
    required super.image,
    required super.type,
  });

  static List<PrayerModel> getPrayesrs() {
    List<PrayerModel> prayers = [];

    prayers.add(PrayerModel(
      name: "Novena de aguinaldos",
      fileName: "NdeA",
      type: "Todos los dias",
      image: "assets/images/one.jpg",
      boxColor: const Color(0xFF119FC2),
    ));

    prayers.add(PrayerModel(
      name: "Santisima virgen",
      fileName: "SV",
      type: "Todos los dias",
      image: "assets/images/two.jpg",
      boxColor: const Color(0xFF119FC2),
    ));

    prayers.add(PrayerModel(
      name: "San jose",
      fileName: "SJ",
      type: "Todos los dias",
      image: "assets/images/three.jpg",
      boxColor: const Color(0xFF119FC2),
    ));
    prayers.add(PrayerModel(
      name: "Nino jesus",
      fileName: "NJ",
      type: "Todos los dias",
      image: "assets/images/four.jpg",
      boxColor: const Color(0xFF119FC2),
    ));
    return prayers;
  }
}
