class ChirimasCarol {
  String name;
  String image;
  String url;
  bool viewIsVisible;

  ChirimasCarol({
    required this.name,
    required this.image,
    required this.url,
    required this.viewIsVisible,
  });

  static List<ChirimasCarol> getChirimasCarol() {
    List<ChirimasCarol> chirimas = <ChirimasCarol>[];

    chirimas.add(ChirimasCarol(
      name: "Peces en el rio",
      url: "",
      image: "assets/images/covers/preces.jpg",
      viewIsVisible: true,
    ));
    chirimas.add(ChirimasCarol(
      name: "Rin Rin",
      url: "",
      image: "assets/images/covers/rin rin.jpg",
      viewIsVisible: true,
    ));
    chirimas.add(ChirimasCarol(
      name: "Tamborilero",
      url: "",
      image: "assets/images/covers/tambor.jpg",
      viewIsVisible: true,
    ));
    chirimas.add(ChirimasCarol(
      name: "Campana sobre campana",
      url: "",
      image: "assets/images/covers/campanas.jpg",
      viewIsVisible: false,
    ));
    chirimas.add(ChirimasCarol(
      name: "A la nanita nana",
      url: "",
      image: "assets/images/covers/last.jpg",
      viewIsVisible: true,
    ));

    return chirimas;
  }
}
