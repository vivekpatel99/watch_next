import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'on_tap_overview_card_model.dart';

class OnTapOverviewCard extends StackedView<OnTapOverviewCardModel> {
  const OnTapOverviewCard({super.key});

  @override
  Widget builder(
    BuildContext context,
    OnTapOverviewCardModel viewModel,
    Widget? child,
  ) {
    print('################');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('data')],
        ),
      ),
    );
  }

  @override
  OnTapOverviewCardModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnTapOverviewCardModel();
}
