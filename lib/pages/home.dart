import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:novena/components/christmas_carol.dart';
import 'package:novena/components/day.dart';
import 'package:novena/components/prayer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary.withOpacity(0.25),
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
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 48,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const PrayerSection(),
                  const SizedBox(
                    height: 16,
                  ),
                  const DaySection(),
                  const SizedBox(
                    height: 20,
                  ),
                  const ChristmasCarol(),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
