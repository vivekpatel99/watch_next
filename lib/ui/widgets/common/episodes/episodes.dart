import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'episodes_model.dart';

class Episodes extends StackedView<EpisodesModel> {
  const Episodes({super.key});

  @override
  Widget builder(
    BuildContext context,
    EpisodesModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      body: Text('Episodes'),
    );
  }

  @override
  EpisodesModel viewModelBuilder(
    BuildContext context,
  ) =>
      EpisodesModel();
}
