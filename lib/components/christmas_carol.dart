import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:novena/components/image_error.dart';
import 'package:novena/models/christmas_carol_model.dart';
import 'package:novena/pages/listen.dart';

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
                child: CachedNetworkImage(
                  imageUrl: C[index].image,
                  placeholder: (context, url) => const ImageError(),
                  errorWidget: (context, url, error) => const ImageError(),
                  imageBuilder: (ctx, imageProvider) {
                    return Ink.image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    );
                  },
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
