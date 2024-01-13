class ChristmasCarol {
  int id;
  String name;
  String image;
  String audio;
  String lyrics;
  bool viewIsVisible;

  ChristmasCarol({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    required this.lyrics,
    required this.viewIsVisible,
  });

  static List<ChristmasCarol> getChristmasCarol() {
    List<ChristmasCarol> christmas = <ChristmasCarol>[];

    christmas.add(ChristmasCarol(
      id: 0,
      name: "Peces en el rio",
      audio: "assets/audio/peces.mp3",
      lyrics: "peces",
      image: "assets/images/covers/peces.jpg",
      viewIsVisible: true,
    ));
    christmas.add(ChristmasCarol(
      id: 1,
      name: "Rin Rin",
      audio: "assets/audio/rin_rin.mp3",
      image: "assets/images/covers/rin rin.jpg",
      lyrics: "rin_rin",
      viewIsVisible: true,
    ));
    christmas.add(ChristmasCarol(
      id: 2,
      name: "Tamborilero",
      audio: "assets/audio/peces.mp3",
      image: "assets/images/covers/tambor.jpg",
      lyrics: "",
      viewIsVisible: true,
    ));
    christmas.add(ChristmasCarol(
      id: 3,
      name: "Campana sobre campana",
      audio: "assets/audio/peces.mp3",
      lyrics: "",
      image: "assets/images/covers/campanas.jpg",
      viewIsVisible: false,
    ));
    christmas.add(ChristmasCarol(
      id: 4,
      name: "A la nanita nana",
      audio: "assets/audio/peces.mp3",
      image: "assets/images/covers/last.jpg",
      lyrics: "",
      viewIsVisible: true,
    ));

    return christmas;
  }
}
