import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tabview_watchlist_model.dart';

class TabWatchListview extends StackedView<TabviewWatchListModel> {
  const TabWatchListview({super.key});

  @override
  Widget builder(
    BuildContext context,
    TabviewWatchListModel viewModel,
    Widget? child,
  ) {
    return const Center(child: CircularProgressIndicator());
    // return ListView.builder(
    //   itemCount: watchlistResults.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text(viewModel.data[index].name),
    //     );
    //   },
    // );
  }

  @override
  TabviewWatchListModel viewModelBuilder(
    BuildContext context,
  ) =>
      TabviewWatchListModel();
}
