import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:watch_next/datamodels/series_item_model.dart';

import 'episodes_model.dart';

class Episodes extends StackedView<EpisodesModel> {
  final TvSeriesItemModel seriesDetailsModel;
  const Episodes({super.key, required this.seriesDetailsModel});

  @override
  Widget builder(
    BuildContext context,
    EpisodesModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Text(seriesDetailsModel.name),
    );
  }

  @override
  EpisodesModel viewModelBuilder(BuildContext context) => EpisodesModel();
}
