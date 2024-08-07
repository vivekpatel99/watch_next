// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/ui/widgets/common/my_list_tile/my_list_tile.dart';
import 'package:watch_next/ui/widgets/common/tabview/tabview_discover_model.dart';

class TabDiscoverView extends StackedView<TabviewDiscoverModel> {
  const TabDiscoverView({
    super.key,
  });

  @override
  Widget builder(
    BuildContext context,
    TabviewDiscoverModel viewModel,
    Widget? child,
  ) {
    Future<List<TvSeriesSearchResult>?> data = viewModel.futureToRun();

    // data.either((left) {
    //   viewModel.setError(true);
    //   _error = left.toString();
    // }, (right) => data as Future<List<TvSeriesSearchResult>>);

    // // Future<List<TvSeriesSearchResult>>? data = null;
    // try {
    //   data = viewModel.futureToRun();
    // } catch (e) {
    //   viewModel.setError(true);
    //   Future<List<TvSeriesSearchResult>>? data = null;
    // }

    return viewModel.hasError
        ? Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: Text(
              'An error has occered while running the future ${viewModel.error(viewModel)}',
              style: const TextStyle(color: Colors.white),
            ),
          )
        : viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : FutureBuilder(
                future: data,
                builder: (BuildContext context, snapshot) {
                  return (snapshot.data == null)
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final item = snapshot.data![index];
                            final posterUrl = (item.posterPath != null)
                                ? item.posterPath!
                                : null;
                            return MyListTile(
                              posterUrl: posterUrl!,
                              item: item,
                              message: '',
                              isWatchlistView: false,
                            );
                          },
                          // separatorBuilder: (BuildContext context, int index) =>
                          //     horizontalSpaceSmall,
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
