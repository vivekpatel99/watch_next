import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:watch_next/datamodels/series_item_model.dart';
import 'package:watch_next/themes/styles.dart';
import 'package:watch_next/ui/widgets/common/episodes/episodes.dart';
import 'package:watch_next/ui/widgets/common/overview/overview.dart';

import 'watch_list_item_details_viewmodel.dart';

class WatchListItemDetailsView
    extends StackedView<WatchListItemDetailsViewModel> {
  const WatchListItemDetailsView({
    Key? key,
    required this.itemId,
    required this.name,
  }) : super(key: key);
  final int itemId;
  final String name;

  @override
  Widget builder(
    BuildContext context,
    WatchListItemDetailsViewModel viewModel,
    Widget? child,
  ) {
    const List<Tab> myTabs = [
      Tab(child: Text('Overview', style: subheadingStyle)),
      Tab(child: Text('Episodes', style: subheadingStyle)),
    ];

    final TvSeriesItemModel seriesDetails = viewModel.seriesDetails(id: itemId);

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: viewModel.backButtonClicked),
          title: Text(name),
          bottom: const TabBar(tabs: myTabs),
        ),
        body: TabBarView(clipBehavior: Clip.antiAlias, children: [
          Overview(detailsMdl: seriesDetails),
          Episodes(seriesDetailsModel: seriesDetails)
        ]),
      ),
    );
  }

  @override
  WatchListItemDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WatchListItemDetailsViewModel();
}
