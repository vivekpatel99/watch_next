import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'upcoming_viewmodel.dart';

class TabUpcomingView extends StackedView<UpcomingViewModel> {
  const TabUpcomingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UpcomingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  UpcomingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UpcomingViewModel();
}
