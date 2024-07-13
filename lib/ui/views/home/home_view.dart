import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/themes/styles.dart';
import 'package:watch_next/ui/widgets/common/tabview/tab_watchlist_view.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final log = getLogger('HomeView');
    log.i('HomeView started');
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: myAppBar(viewModel: viewModel),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TabBarView(children: [
              TabWatchListview(),
              Text('Upcoming'),
              Text('Recent'),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: viewModel.searchButtonClicked,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  AppBar myAppBar({required HomeViewModel viewModel}) {
    const List<Tab> myTabs = [
      Tab(child: Text('Watch List', style: subheadingStyle)),
      Tab(child: Text('Upcomming', style: subheadingStyle)),
      Tab(child: Text('Recent', style: subheadingStyle)),
    ];
    return AppBar(
      title: const Text('Shows', style: heading1Style),
      actions: [
        IconButton(
            onPressed: viewModel.searchButtonClicked,
            icon: const Icon(Icons.search, size: 40.0)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert, size: 40.0))
      ],
      bottom: const TabBar(tabs: myTabs),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
