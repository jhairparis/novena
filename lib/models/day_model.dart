import 'package:novena/models/model.dart';

class DayModel extends BaseModel {
  String description;
  bool viewIsVisible;

  DayModel({
    required this.description,
    required this.viewIsVisible,
    required super.name,
    required super.fileName,
    required super.image,
    required super.type,
  });

  static List<DayModel> getDiets() {
    int year = DateTime.now().year;
    int day = DateTime.now().day;
    List<DayModel> days = <DayModel>[];

    days.add(DayModel(
      name: "Dia 1",
      fileName: "day_1",
      image: "assets/images/days/1.jpg",
      type: "16/12/$year",
      description:
          "Lorem ipsum dolor sit amet consectetur. Nulla proin leo non dignissim sodales feugiat porttitor.",
      viewIsVisible: 16 == day,
    ));
    days.add(DayModel(
      name: "Dia 2",
      fileName: "day_2",
      image: "assets/images/days/1.jpg",
      type: '17/12/$year',
      description:
          "Lorem ipsum dolor sit amet consectetur. Nulla proin leo non dignissim sodales feugiat porttitor.",
      viewIsVisible: 17 == day,
    ));
    days.add(DayModel(
      name: "Dia 3",
      fileName: "day_3",
      image: "assets/images/days/1.jpg",
      type: '18/12/$year',
      description:
          "Lorem ipsum dolor sit amet consectetur. Nulla proin leo non dignissim sodales feugiat porttitor.",
      viewIsVisible: 18 == day,
    ));
    days.add(DayModel(
      name: "Dia 4",
      fileName: "day_4",
      image: "assets/images/days/1.jpg",
      type: '19/12/$year',
      description:
          "Lorem ipsum dolor sit amet consectetur. Nulla proin leo non dignissim sodales feugiat porttitor.",
      viewIsVisible: 19 == day,
    ));
    days.add(DayModel(
      name: "Dia 5",
      fileName: "day_5",
      image: "assets/images/days/1.jpg",
      type: '20/12/$year',
      description:
          "Lorem ipsum dolor sit amet consectetur. Nulla proin leo non dignissim sodales feugiat porttitor.",
      viewIsVisible: 20 == day,
    ));
    days.add(DayModel(
      name: "Dia 6",
      fileName: "day_6",
      image: "assets/images/days/1.jpg",
      type: '21/12/$year',
      description:
          "Lorem ipsum dolor sit amet consectetur. Nulla proin leo non dignissim sodales feugiat porttitor.",
      viewIsVisible: 21 == day,
    ));
    days.add(DayModel(
      name: "Dia 7",
      fileName: "day_7",
      image: "assets/images/days/1.jpg",
      type: '22/12/$year',
      description:
          "Lorem ipsum dolor sit amet consectetur. Nulla proin leo non dignissim sodales feugiat porttitor.",
      viewIsVisible: 22 == day,
    ));
    days.add(DayModel(
      name: "Dia 8",
      fileName: "day_8",
      image: "assets/images/days/1.jpg",
      type: '23/12/$year',
      description:
          "Lorem ipsum dolor sit amet consectetur. Nulla proin leo non dignissim sodales feugiat porttitor.",
      viewIsVisible: 23 == day,
    ));
    days.add(DayModel(
      name: "Dia 9",
      fileName: "day_9",
      image: "assets/images/days/1.jpg",
      type: '24/12/$year',
      description:
          "Lorem ipsum dolor sit amet consectetur. Nulla proin leo non dignissim sodales feugiat porttitor.",
      viewIsVisible: 24 == day,
    ));

    return days;
  }
}
