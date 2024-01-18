class BaseModel {
  String name;
  String fileName;
  bool haveNext;
  dynamic next;
  String image;
  String type;

  BaseModel({
    required this.name,
    required this.fileName,
    required this.image,
    required this.type,
    required this.haveNext,
  });
}
