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
    required super.haveNext,
  });

  static List<PrayerModel> getPrayers() {
    List<PrayerModel> prayers = [];

    prayers.add(PrayerModel(
      name: "Novena de aguinaldos",
      fileName: "NdeA",
      type: "Todos los dias",
      image: "assets/images/one.jpg",
      boxColor: const Color(0xFF119FC2),
      haveNext: true,
    ));

    prayers.add(PrayerModel(
      name: "Santisima virgen",
      fileName: "SV",
      type: "Todos los dias",
      image: "assets/images/two.jpg",
      boxColor: const Color(0xFF119FC2),
      haveNext: true,
    ));

    prayers.add(PrayerModel(
      name: "San jose",
      fileName: "SJ",
      type: "Todos los dias",
      image: "assets/images/three.jpg",
      boxColor: const Color(0xFF119FC2),
      haveNext: true,
    ));
    prayers.add(PrayerModel(
      name: "Nino jesus",
      fileName: "NJ",
      type: "Todos los dias",
      image: "assets/images/four.jpg",
      boxColor: const Color(0xFF119FC2),
      haveNext: false,
    ));

    prayers[0].next = prayers[1];
    prayers[1].next = prayers[2];
    prayers[2].next = prayers[3];

    return prayers;
  }
}
