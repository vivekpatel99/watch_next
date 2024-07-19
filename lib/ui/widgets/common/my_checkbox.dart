import 'package:flutter/material.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';

class MyCheckBoxWidget extends StatelessWidget {
  final dynamic viewModel;

  const MyCheckBoxWidget({
    super.key,
    required this.item,
    required this.viewModel,
  });

  final TvSeriesSearchResult item;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        tristate: false,
        value: item.isChecked,
        onChanged: (value) {
          viewModel.toggleChecked(value, item);
        });
  }
}
