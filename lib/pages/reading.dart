import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:novena/models/model.dart';
import 'dart:async' show Future;
import 'package:novena/styles/styles.dart';

Styles styles = Styles();

class PrayWidget extends StatelessWidget {
  final String fileName;
  const PrayWidget({Key? key, required this.fileName}) : super(key: key);

  Future<String> loadAsset(BuildContext context, String source) async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/txt/$source.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: loadAsset(context, fileName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            if (kDebugMode) {
              print("Error: ${snapshot.error}");
            }
            return Text(
              "Ops! Algo salió mal.",
              style: styles.heading6.copyWith(
                color: const Color(0xffFFD1E3),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: ListView(
                children: [
                  Text(
                    snapshot.data ?? "default value",
                    style: styles.heading6.copyWith(
                      color: const Color(0xffFFD1E3),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class ReadingPage extends StatelessWidget {
  final BaseModel info;
  const ReadingPage({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        title: Column(
          children: [
            Text(
              info.name,
              style: styles.heading3.copyWith(
                color: const Color(0xffFFD1E3),
              ),
            ),
            Text(
              info.type,
              style: styles.subtitle.copyWith(
                color: const Color(0xffA367B1),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xff392467),
        leading: Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 6),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0x1FFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  "assets/icons/chevron-left.svg",
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                      Color(0xffFFD1E3), BlendMode.srcIn),
                ),
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 6),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 37,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0x1FFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  "assets/icons/chevron-right.svg",
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                      Color(0xffFFD1E3), BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ],
      ),
      body: PrayWidget(fileName: info.fileName),
      backgroundColor: const Color(0xff392467),
    );
  }
}
