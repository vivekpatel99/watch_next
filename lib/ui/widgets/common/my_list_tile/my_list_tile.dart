// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:watch_next/contants/constansts.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/themes/styles.dart';
import 'package:watch_next/ui/widgets/common/my_check_box/my_check_box.dart';
import 'package:watch_next/ui/widgets/common/on_tap_overview_card/on_tap_overview_card.dart';

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
      isThreeLine: true,
      enableFeedback: true,
      leading: (posterUrl == null)
          ? const Icon(Icons.error)
          : CachedNetworkImage(
              useOldImageOnUrlChange: true,
              cacheManager: Constansts.customCacheManager,
              key: UniqueKey(),
              imageUrl: posterUrl!,
              fit: BoxFit.contain,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fadeInDuration: const Duration(seconds: 3),
            ),
      title: Text(item.name, style: subheadingStyle),
      subtitle: Text(
        item.overview,
        style: captionStyle,
        maxLines: 3,
        softWrap: true,
      ),
      onTap: () => _showCardOnTap(context, item),
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

void _showCardOnTap(BuildContext context, TvSeriesSearchResult item) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Item  Details',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'This is the detailed information for item .',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
