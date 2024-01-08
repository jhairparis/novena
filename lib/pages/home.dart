import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/models/prayer_model.dart';
import 'package:myapp/models/chrismas_carol_model.dart';
import 'package:myapp/models/day_model.dart';
import 'package:myapp/styles/styles.dart';

import 'Read.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<PrayerModel> prayers = [];
  List<DayModel> days = [];
  List<ChirimasCarol> C = [];
  Styles styles = Styles();

  void _getInitialInfo() {
    prayers = PrayerModel.getPrayesrs();
    days = DayModel.getDiets();
    C = ChirimasCarol.getChirimasCarol();
  }

  Widget build(BuildContext context) {
    _getInitialInfo();

    return Scaffold(
      backgroundColor: const Color(0xffFFD1E3),
      body: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                height: 250,
                width: 250,
                top: 20,
                right: -40,
                child: Transform.rotate(
                  angle: -1.25855692, //72.11 degres
                  child: SvgPicture.asset(
                    "assets/icons/candy-cane.svg",
                    width: 198,
                    height: 232,
                    colorFilter: const ColorFilter.mode(
                      Color(0x33A367B1),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 25),
                    child: Text(
                      "En familia\nes mejor",
                      style: styles.heading1.copyWith(
                        color: const Color(0xff5D3587),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _prayerSection(context),
                  const SizedBox(
                    height: 16,
                  ),
                  _daySection(),
                  const SizedBox(
                    height: 16,
                  ),
                  _chrismasCarolSection(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Column _chrismasCarolSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Villancico",
            style: styles.heading6,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 320,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(11.2),
                    ),
                    child: Image.asset(C[index].image, fit: BoxFit.cover),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        right: 14,
                        left: 14,
                      ),
                      child: Text(C[index].name, style: styles.subtitle),
                    ),
                  )
                ],
              );
            },
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemCount: C.length,
          ),
        )
      ],
    );
  }

  Column _daySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Dias",
            style: styles.heading6,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 495),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReadPage(info: days[index]),
                    ),
                  );
                },
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: const Color(0xffA367B1),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: days[index].viewIsVisible
                        ? [
                            BoxShadow(
                              color: const Color(0xff1D1617).withOpacity(0.51),
                              blurRadius: 40,
                              spreadRadius: 0.0,
                            )
                          ]
                        : [],
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          width: 110,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(19),
                              bottomLeft: Radius.circular(19),
                              topRight: Radius.circular(19),
                            ),
                          ),
                          child: Image.asset(
                            days[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            // bottom: 20,
                            left: 10,
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                days[index].name,
                                style: styles.heading6.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                days[index].description,
                                overflow: TextOverflow.fade,
                                maxLines: 5,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: days.length,
          ),
        ),
      ],
    );
  }

  Column _prayerSection(ctx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 300,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ReadPage(info: prayers[index]),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 230,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: prayers[index].boxColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Image.asset(
                          prayers[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        Text(
                          prayers[index].name,
                          style: styles.heading6,
                        ),
                        Text(
                          prayers[index].type,
                          style: styles.subtitle2,
                        )
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 45),
              itemCount: prayers.length),
        )
      ],
    );
  }
}
