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
    required super.haveNext,
  });

  static List<DayModel> getDays() {
    int year = DateTime.now().year;
    int day = DateTime.now().day;
    List<DayModel> days = <DayModel>[];

    days.add(DayModel(
      name: "Dia 1",
      fileName: "${BaseModel.url}/source/txt/days/day_1.txt",
      image: "${BaseModel.url}/source/img/days/day_1.webp",
      type: "16/12/$year",
      description:
          "Verbo Eterno se hace hombre para redimir, en amorosa obediencia, expiando desobediencia y rebeldía.",
      viewIsVisible: 16 == day,
      haveNext: true,
    ));
    days.add(DayModel(
      name: "Dia 2",
      fileName: "${BaseModel.url}/source/txt/days/day_2.txt",
      image: "${BaseModel.url}/source/img/days/day_1.webp",
      type: '17/12/$year',
      description:
          "María, acepta con humildad la encarnación divina. El Verbo toma posesión, cumpliendo la voluntad eterna.",
      viewIsVisible: 17 == day,
      haveNext: true,
    ));
    days.add(DayModel(
      name: "Dia 3",
      fileName: "${BaseModel.url}/source/txt/days/day_3.txt",
      image: "${BaseModel.url}/source/img/days/day_1.webp",
      type: '18/12/$year',
      description:
          "Vida encarnada: alma gloriosa y cuerpo divino. Maravilla de niño Jesús, purificando con amor y perdón en Navidad.",
      viewIsVisible: 18 == day,
      haveNext: true,
    ));
    days.add(DayModel(
      name: "Dia 4",
      fileName: "${BaseModel.url}/source/txt/days/day_4.txt",
      image: "${BaseModel.url}/source/img/days/day_1.webp",
      type: '19/12/$year',
      description:
          "Jesús ejemplificó sumisión eterna a Dios, guiándonos a la adoración profunda y sacrificio total.",
      viewIsVisible: 19 == day,
      haveNext: true,
    ));
    days.add(DayModel(
      name: "Dia 5",
      fileName: "${BaseModel.url}/source/txt/days/day_5.txt",
      image: "${BaseModel.url}/source/img/days/day_1.webp",
      type: '20/12/$year',
      description:
          "María anhela ver la faz divina de Jesús encarnado, anticipando felicidad eterna y amor filial.",
      viewIsVisible: 20 == day,
      haveNext: true,
    ));
    days.add(DayModel(
      name: "Dia 6",
      fileName: "${BaseModel.url}/source/txt/days/day_6.txt",
      image: "${BaseModel.url}/source/img/days/day_1.webp",
      type: '21/12/$year',
      description:
          "Contra las expectativas de Nazaret, el nacimiento divino se cumplió en Belén según la profecía.",
      viewIsVisible: 21 == day,
      haveNext: true,
    ));
    days.add(DayModel(
      name: "Dia 7",
      fileName: "${BaseModel.url}/source/txt/days/day_7.txt",
      image: "${BaseModel.url}/source/img/days/day_1.webp",
      type: '22/12/$year',
      description:
          "María y José llevan al creador del universo, humildad y obediencia en un niño, anhelos celestiales se cumplen.",
      viewIsVisible: 22 == day,
      haveNext: true,
    ));
    days.add(DayModel(
      name: "Dia 8",
      fileName: "${BaseModel.url}/source/txt/days/day_8.txt",
      image: "${BaseModel.url}/source/img/days/day_1.webp",
      type: '23/12/$year',
      description:
          "Jose y María, rechazados en Belén, hallan paz en la divina travesía. El ruido de puertas cerradas, dulce melodía para sus odios.",
      viewIsVisible: 23 == day,
      haveNext: true,
    ));
    days.add(DayModel(
      name: "Dia 9",
      fileName: "${BaseModel.url}/source/txt/days/day_9.txt",
      image: "${BaseModel.url}/source/img/days/day_1.webp",
      type: '24/12/$year',
      description:
          "Nace Divino Niño, adorado por ángeles, pastores, Reyes Magos. Una guía eterna hacia virtud.",
      viewIsVisible: 24 == day,
      haveNext: false,
    ));

    days[0].next = days[1];
    days[1].next = days[2];
    days[2].next = days[3];
    days[3].next = days[4];
    days[4].next = days[5];
    days[5].next = days[6];
    days[6].next = days[7];
    days[7].next = days[8];

    return days;
  }
}
