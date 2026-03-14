import 'package:flutter/material.dart';
import 'package:novena/models/model.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import '../components/predictive_back_wrapper.dart';
import '../utils/navigation_helper.dart';

class PrayWidget extends StatelessWidget {
  final String fileName;
  const PrayWidget({super.key, required this.fileName});

  Future<Map<String, String>> loadText(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final List<String> splitResponse = response.body.split("_1c_");
      return {"text": splitResponse[0], "info": splitResponse[1]};
    } else {
      throw Exception('Failed to load text from $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Map<String, String>>(
        future: loadText(fileName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            debugPrint('ReadingPage loadText error: ${snapshot.error}');
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
                    snapshot.data!["text"]!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Center(
                    child: Text(
                      snapshot.data!["info"]!,
                      style: Theme.of(context).textTheme.labelMedium,
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
    // No usar PopScope a menos que necesites lógica especial de back
    // Para predictive back gesture, dejar que Flutter maneje la navegación normalmente
    return Scaffold(
      appBar: PredictiveAppBar(
        toolbarHeight: 80,
        titleWidget: Column(
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
        actions: info.haveNext && info.next != null
            ? [
                IconButton(
                  onPressed: () {
                    NavigationHelper.push(
                      context,
                      ReadingPage(info: info.next!),
                      routeName: 'reading/${info.next!.name}',
                    );
                  },
                  tooltip: 'Leer ${info.next!.name}',
                  icon: const Icon(Icons.arrow_forward),
                ),
              ]
            : [],
      ),
      body: PrayWidget(fileName: info.fileName),
    );
  }
}
