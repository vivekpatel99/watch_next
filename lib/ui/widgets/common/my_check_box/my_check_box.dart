// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:watch_next/datamodels/tv_series_search_response_model.dart';

import 'my_check_box_model.dart';

class MyCheckBox extends StackedView<MyCheckBoxModel> {
  final TvSeriesSearchResult item;
  final String message;
  final bool isWatchlist;
  const MyCheckBox({
    super.key,
    required this.item,
    required this.message,
    required this.isWatchlist,
  });

  @override
  Widget builder(
    BuildContext context,
    MyCheckBoxModel viewModel,
    Widget? child,
  ) {
    return Checkbox(
        tristate: false,
        value: item.isChecked,
        onChanged: (value) {
          if (isWatchlist) {
            viewModel.toggleCheckedFromWatchListView(value!, item, message);
          } else {
            viewModel.toggleCheckedFromDiscoverView(value!, item, message);
          }
        });
  }

  @override
  MyCheckBoxModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyCheckBoxModel();
}
