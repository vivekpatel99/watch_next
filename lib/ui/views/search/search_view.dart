import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:watch_next/themes/styles.dart';
import 'package:watch_next/ui/views/search/search_viewmodel.dart';
import 'package:watch_next/ui/widgets/common/searchfield/searchfield.dart';
import 'package:watch_next/ui/widgets/common/tabview/tab_discover_view.dart';
import 'package:watch_next/ui/widgets/common/tabview/tab_watchlist_view.dart';

class SearchView extends StackedView<SearchViewModel> {
  const SearchView({super.key});
  @override
  Widget builder(
    BuildContext context,
    SearchViewModel viewModel,
    Widget? child,
  ) {
    const List<Tab> myTabs = [
      Tab(child: Text('Watch List', style: subheadingStyle)),
      Tab(child: Text('Discover', style: subheadingStyle)),
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: viewModel.backButtonClicked,
          ),
          flexibleSpace: const Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 30),
            child: Searchfield(),
          ),
          bottom: const TabBar(tabs: myTabs),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: TabBarView(
            children: [
              TabWatchListview(),
              TabDiscoverView(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SearchViewModel viewModelBuilder(BuildContext context) => SearchViewModel();
}
