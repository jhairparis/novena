class ChristmasCarol {
  String name;
  String image;
  String audio;
  bool viewIsVisible;

  ChristmasCarol({
    required this.name,
    required this.image,
    required this.audio,
    required this.viewIsVisible,
  });

  static List<ChristmasCarol> getChristmasCarol() {
    List<ChristmasCarol> christmas = <ChristmasCarol>[];

    christmas.add(ChristmasCarol(
      name: "Peces en el rio",
      audio: "assets/audio/peces.mp3",
      image: "assets/images/covers/peces.jpg",
      viewIsVisible: true,
    ));
    christmas.add(ChristmasCarol(
      name: "Rin Rin",
      audio: "",
      image: "assets/images/covers/rin rin.jpg",
      viewIsVisible: true,
    ));
    christmas.add(ChristmasCarol(
      name: "Tamborilero",
      audio: "",
      image: "assets/images/covers/tambor.jpg",
      viewIsVisible: true,
    ));
    christmas.add(ChristmasCarol(
      name: "Campana sobre campana",
      audio: "",
      image: "assets/images/covers/campanas.jpg",
      viewIsVisible: false,
    ));
    christmas.add(ChristmasCarol(
      name: "A la nanita nana",
      audio: "",
      image: "assets/images/covers/last.jpg",
      viewIsVisible: true,
    ));

    return christmas;
  }
}
