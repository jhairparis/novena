class BaseModel {
  String name;
  String fileName;
  bool haveNext;
  dynamic next;
  String image;
  String type;
  static String url = "https://static.jhairparis.com/portfolio/projects/Novena";

  BaseModel({
    required this.name,
    required this.fileName,
    required this.image,
    required this.type,
    required this.haveNext,
  });
}
