// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/themes/styles.dart';
import 'package:watch_next/ui/widgets/common/my_check_box/my_check_box.dart';
import 'package:watch_next/ui/widgets/dumb_widgets/show_cached_image.dart';

import 'my_list_tile_model.dart';

class MyListTile extends StackedView<MyListTileModel> {
  final String? posterUrl;
  final TvSeriesSearchResult item;
  final String message;
  final bool isWatchlistView;
  const MyListTile({
    super.key,
    this.posterUrl,
    required this.item,
    required this.message,
    required this.isWatchlistView,
  });

  @override
  Widget builder(
    BuildContext context,
    MyListTileModel viewModel,
    Widget? child,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 0.0,
      // minVerticalPadding: ,
      enableFeedback: true,
      leading: (posterUrl == null)
          ? const Icon(
              Icons.error,
            )
          : ShowCachedImage(
              posterUrl: posterUrl,
              // height: 120,
              // width: 100,
            ),
      title: Text(item.name, style: subheadingStyle),
      subtitle: Text(
        item.overview,
        style: captionStyle,
        maxLines: 3,
        softWrap: true,
      ),
      onTap: () => isWatchlistView
          ? viewModel.gotoWatchListItemDetails(itemId: item.id, name: item.name)
          : viewModel.showDialog(contentId: item.id),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      trailing: MyCheckBox(
        item: item,
        message: message,
        isWatchlist: isWatchlistView,
      ),
    );
  }

  @override
  MyListTileModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyListTileModel();
}
