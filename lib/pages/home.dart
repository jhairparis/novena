import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:novena/models/prayer_model.dart';
import 'package:novena/models/christmas_carol_model.dart';
import 'package:novena/models/day_model.dart';
import 'package:novena/pages/listen.dart';
import 'package:novena/pages/reading.dart';

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

class ChristmasCarol extends StatelessWidget {
  const ChristmasCarol({super.key});

  static final C = ChristmasCarolModel.getChristmasCarol();
  static final _playlist = ConcatenatingAudioSource(children: []);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Villancicos",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              _playlist.add(AudioSource.asset(C[index].audio, tag: C[index]));

              return christmasCarolBuilder(context, index);
            },
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemCount: C.length,
          ),
        )
      ],
    );
  }

  Card christmasCarolBuilder(BuildContext context, int index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ListenPage(info: C[index], playlist: _playlist),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  C[index].image,
                  fit: BoxFit.cover,
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(C[index].name, style: Theme.of(context).textTheme.titleLarge)
            ],
          ),
        ),
      ),
    );
  }
}

class DaySection extends StatelessWidget {
  const DaySection({
    super.key,
  });

  static final days = DayModel.getDays();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Dias de la novena",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 495),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return dayBuilder(context, index);
            },
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: days.length,
          ),
        ),
      ],
    );
  }

  Card dayBuilder(BuildContext context, int index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReadingPage(info: days[index]),
            ),
          );
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      days[index].name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      days[index].description,
                      overflow: TextOverflow.fade,
                      maxLines: 5,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  width: 80,
                  height: 80,
                  days[index].image,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrayerSection extends StatelessWidget {
  const PrayerSection({
    super.key,
  });

  static final prayers = PrayerModel.getPrayers();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 320,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return prayerBuilder(index, context);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 45),
              itemCount: prayers.length),
        )
      ],
    );
  }

  Column prayerBuilder(int index, BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          child: Ink.image(
            image: AssetImage(prayers[index].image),
            fit: BoxFit.cover,
            width: 150,
            height: 230,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadingPage(info: prayers[index]),
                  ),
                );
              },
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
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              prayers[index].type,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ],
    );
  }
}
