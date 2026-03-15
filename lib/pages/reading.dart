import 'package:flutter/material.dart';
import 'package:novena/models/model.dart';
import 'package:provider/provider.dart';
import '../components/predictive_back_wrapper.dart';
import '../utils/navigation_helper.dart';
import '../viewmodels/reading_viewmodel.dart';
import '../repositories/content_repository.dart';
import '../services/http_service.dart';

class ReadingPage extends StatelessWidget {
  final BaseModel info;
  const ReadingPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReadingViewModel(repository: ContentRepository(HttpService())),
      child: _ReadingPageContent(info: info),
    );
  }
}

class _ReadingPageContent extends StatelessWidget {
  final BaseModel info;
  const _ReadingPageContent({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<ReadingViewModel>(
        builder: (context, viewModel, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            viewModel.loadContent(info.fileName);
          });
          
          return _ContentBody(viewModel: viewModel);
        },
      ),
    );
  }
}

class _ContentBody extends StatelessWidget {
  final ReadingViewModel viewModel;

  const _ContentBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    if (viewModel.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.only(right: 150, left: 150, top: 130, bottom: 130),
          child: CircularProgressIndicator(strokeWidth: 10),
        ),
      );
    }

    if (viewModel.errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48, color: Theme.of(context).colorScheme.error),
              const SizedBox(height: 16),
              Text(
                viewModel.errorMessage!,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: viewModel.retry,
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
      );
    }

    if (!viewModel.hasContent) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListView(
        children: [
          Text(
            viewModel.text!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          if (viewModel.info != null && viewModel.info!.isNotEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  viewModel.info!,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
