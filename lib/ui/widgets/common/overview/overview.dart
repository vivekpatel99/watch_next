import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'overview_model.dart';

class Overview extends StackedView<OverviewModel> {
  const Overview({super.key});

  @override
  Widget builder(
    BuildContext context,
    OverviewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Text('Overview'),
    );
  }

  @override
  OverviewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OverviewModel();
}
