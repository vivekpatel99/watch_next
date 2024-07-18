import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'recent_viewmodel.dart';

class TabRecentView extends StackedView<RecentViewModel> {
  const TabRecentView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RecentViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  RecentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RecentViewModel();
}
