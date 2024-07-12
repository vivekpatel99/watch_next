import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
    return (viewModel.getWatchListBox == null)
        ? const Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : ValueListenableBuilder(
            valueListenable: viewModel.getWatchListBox!.listenable(),
            builder: (context, box, _) {
              return ListView.builder(
                itemCount: viewModel.getWatchListBox!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(viewModel.getWatchListBox!.getAt(index).name),
                  );
                },
              );
            });
  }

  @override
  TabviewWatchListModel viewModelBuilder(
    BuildContext context,
  ) =>
      TabviewWatchListModel();
}
