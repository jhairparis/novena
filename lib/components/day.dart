import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:novena/components/image_error.dart';
import 'package:novena/models/day_model.dart';
import 'package:novena/pages/reading.dart';

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
                child: CachedNetworkImage(
                  imageUrl: days[index].image,
                  placeholder: (context, url) =>
                      const ImageError(width: 80, height: 80),
                  errorWidget: (context, url, error) =>
                      const ImageError(width: 80, height: 80),
                  imageBuilder: (ctx, imageProvider) {
                    return Ink.image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
