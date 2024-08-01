import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:novena/components/image_error.dart';
import 'package:novena/models/prayer_model.dart';
import 'package:novena/pages/reading.dart';

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
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReadingPage(info: prayers[index]),
                ),
              );
            },
            child: CachedNetworkImage(
              imageUrl: prayers[index].image,
              placeholder: (context, url) =>
                  const ImageError(width: 150, height: 230),
              errorWidget: (context, url, error) =>
                  const ImageError(width: 150, height: 230),
              imageBuilder: (ctx, imageProvider) {
                return Ink.image(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 230,
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
