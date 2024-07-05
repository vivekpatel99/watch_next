// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:watch_next/contants/api_constants.dart';
import 'package:watch_next/contants/assests.dart';
import 'package:watch_next/ui/widgets/common/tabview/tabview_discover_model.dart';

class TabDiscoverView extends StackedView<TabviewDiscoverModel> {
  final String? searchQuery;
  const TabDiscoverView({
    super.key,
    required this.searchQuery,
  });

  @override
  Widget builder(
    BuildContext context,
    TabviewDiscoverModel viewModel,
    Widget? child,
  ) {
    return viewModel.isBusy
        ? const CircularProgressIndicator()
        : ListView.builder(
            itemCount: viewModel.data.length,
            itemBuilder: (context, index) {
              final poster = (viewModel.data[index].posterPath != null)
                  ? Image.network(ApiConstants.apiImageEndpoint +
                      viewModel.data[index]!.posterPath)
                  : Image.asset(Assets.fackPoster);
              return ListTile(
                leading: poster,
                title: Text(viewModel.data[index].name),
              );
            },
          );
  }

  @override
  TabviewDiscoverModel viewModelBuilder(
    BuildContext context,
  ) =>
      TabviewDiscoverModel();
}
