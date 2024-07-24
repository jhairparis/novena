import 'package:novena/models/model.dart';

class ChristmasCarolModel {
  int id;
  String name;
  String image;
  String audio;
  String lyrics;
  bool viewIsVisible;

  ChristmasCarolModel({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    required this.lyrics,
    required this.viewIsVisible,
  });

  static List<ChristmasCarolModel> getChristmasCarol() {
    List<ChristmasCarolModel> christmas = <ChristmasCarolModel>[];

    christmas.add(ChristmasCarolModel(
      id: 0,
      name: "Peces en el rio",
      audio: "assets/audio/peces.mp3",
      lyrics: "${BaseModel.url}/source/txt/covers/peces.txt",
      image: "${BaseModel.url}/source/img/covers/peces.webp",
      viewIsVisible: true,
    ));
    christmas.add(ChristmasCarolModel(
      id: 1,
      name: "Rin Rin",
      audio: "assets/audio/rin_rin.mp3",
      lyrics: "${BaseModel.url}/source/txt/covers/rin_rin.txt",
      image: "${BaseModel.url}/source/img/covers/rin_rin.webp",
      viewIsVisible: true,
    ));
    christmas.add(ChristmasCarolModel(
      id: 2,
      name: "Tamborilero",
      audio: "assets/audio/tamborilero.mp3",
      image: "${BaseModel.url}/source/img/covers/tambor.webp",
      lyrics: "${BaseModel.url}/source/txt/covers/tamborilero.txt",
      viewIsVisible: true,
    ));
    christmas.add(ChristmasCarolModel(
      id: 3,
      name: "Campana sobre campana",
      audio: "assets/audio/campana_sobre_campana.mp3",
      lyrics: "${BaseModel.url}/source/txt/covers/campana_sobre_campana.txt",
      image: "${BaseModel.url}/source/img/covers/campanas.webp",
      viewIsVisible: true,
    ));
    christmas.add(ChristmasCarolModel(
      id: 4,
      name: "A la nanita nana",
      audio: "assets/audio/la_anita_nana.mp3",
      image: "${BaseModel.url}/source/img/covers/last.webp",
      lyrics: "${BaseModel.url}/source/txt/covers/la_anita_nana.txt",
      viewIsVisible: true,
    ));

    return christmas;
  }
}
