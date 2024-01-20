import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:novena/models/model.dart';
import 'dart:async' show Future;

class PrayWidget extends StatelessWidget {
  final String fileName;
  const PrayWidget({super.key, required this.fileName});

  Future<String> loadText(BuildContext context, String source) async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/txt/$source.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: loadText(context, fileName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            if (kDebugMode) {
              print("Error: ${snapshot.error}");
            }
            return Text(
              "Ops! Algo salió mal.",
              style: Theme.of(context).textTheme.bodyLarge,
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
                    style: Theme.of(context).textTheme.bodyLarge,
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
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              info.type,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Regresar',
          icon: const Icon(Icons.arrow_back),
        ),
        actions: info.haveNext
            ? [
                IconButton(
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
                  tooltip: 'Leer ${info.next.name}',
                  icon: const Icon(Icons.arrow_forward),
                ),
              ]
            : [],
      ),
      body: PrayWidget(fileName: info.fileName),
    );
  }
}
