import '../config.dart';

class BaseModel {
  String name;
  String fileName;
  bool haveNext;
  BaseModel? next;
  String image;
  String type;
  static const String url = kBaseUrl;

  BaseModel({
    required this.name,
    required this.fileName,
    required this.image,
    required this.type,
    required this.haveNext,
  });
}
