import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/themes/styles.dart';

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
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: myAppBar(viewModel: viewModel),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TabBarView(children: [
              Text('Watch List'),
              Text('Upcoming'),
              Text('Recent'),
            ]),
          ),
        ),
        floatingActionButton: myFloatingActionButton(),
      ),
    );
  }

  FloatingActionButton myFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }

  AppBar myAppBar({required HomeViewModel viewModel}) {
    return AppBar(
      title: const Text('Shows', style: heading1Style),
      actions: [
        IconButton(
            onPressed: viewModel.searchButtonClicked,
            icon: const Icon(Icons.search, size: 40.0)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert, size: 40.0))
      ],
      bottom: const TabBar(tabs: [
        Tab(child: Text('Watch List', style: subheadingStyle)),
        Tab(child: Text('Upcomming', style: subheadingStyle)),
        Tab(child: Text('Recent', style: subheadingStyle)),
      ]),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
