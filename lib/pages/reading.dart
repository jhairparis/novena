import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:novena/models/model.dart';
import 'package:novena/styles/styles.dart';

Styles styles = Styles();

class PrayWidget extends StatelessWidget {
  final String fileName;
  const PrayWidget({super.key, required this.fileName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: styles.loadText(context, fileName),
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
  const ReadingPage({super.key, required this.info});

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
        leading: IconButton.filledTonal(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: info.haveNext
            ? [
                IconButton.filledTonal(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadingPage(
                          info: info.next,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
              ]
            : [],
      ),
      body: PrayWidget(fileName: info.fileName),
      backgroundColor: const Color(0xff392467),
    );
  }
}
