// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:stacked/stacked.dart';

import 'package:watch_next/contants/api_constants.dart';
import 'package:watch_next/contants/constansts.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/themes/styles.dart';
import 'package:watch_next/ui/common/ui_helpers.dart';
import 'package:watch_next/ui/widgets/common/my_checkbox.dart';
import 'package:watch_next/ui/widgets/common/my_list_tile.dart';
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
    final data = viewModel.futureToRun();
    return viewModel.hasError
        ? Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text(
              'An error has occered while running the future',
              style: TextStyle(color: Colors.white),
            ),
          )
        : viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : FutureBuilder(
                future: data,
                builder: (BuildContext context,
                    AsyncSnapshot<List<TvSeriesSearchResult>> snapshot) {
                  return (snapshot.data == null)
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final item = snapshot.data![index];
                            final posterUrl = (item.posterPath != null)
                                ? ApiConstants.apiImageEndpoint +
                                    item.posterPath!
                                : null;
                            return MyListTile(
                                posterUrl: posterUrl!,
                                item: item,
                                myCheckbox: _MyCheckBox(item: item, key: key));
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

class _MyCheckBox extends StatelessWidget {
  final TvSeriesSearchResult item;
  const _MyCheckBox({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TabviewDiscoverModel>.reactive(
      builder: (context, viewModel, child) =>
          MyCheckBoxWidget(viewModel: viewModel, item: item),
      viewModelBuilder: () => TabviewDiscoverModel(),
    );
  }
}
