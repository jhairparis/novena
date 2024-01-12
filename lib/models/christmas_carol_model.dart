class ChristmasCarol {
  String name;
  String image;
  String url;
  bool viewIsVisible;

  ChristmasCarol({
    required this.name,
    required this.image,
    required this.url,
    required this.viewIsVisible,
  });

  static List<ChristmasCarol> getChristmasCarol() {
    List<ChristmasCarol> christmas = <ChristmasCarol>[];

    christmas.add(ChristmasCarol(
      name: "Peces en el rio",
      url: "",
      image: "assets/images/covers/preces.jpg",
      viewIsVisible: true,
    ));
    christmas.add(ChristmasCarol(
      name: "Rin Rin",
      url: "",
      image: "assets/images/covers/rin rin.jpg",
      viewIsVisible: true,
    ));
    christmas.add(ChristmasCarol(
      name: "Tamborilero",
      url: "",
      image: "assets/images/covers/tambor.jpg",
      viewIsVisible: true,
    ));
    christmas.add(ChristmasCarol(
      name: "Campana sobre campana",
      url: "",
      image: "assets/images/covers/campanas.jpg",
      viewIsVisible: false,
    ));
    christmas.add(ChristmasCarol(
      name: "A la nanita nana",
      url: "",
      image: "assets/images/covers/last.jpg",
      viewIsVisible: true,
    ));

    return christmas;
  }
}
