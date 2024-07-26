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
      isThreeLine: true,
      enableFeedback: true,
      leading: (posterUrl == null)
          ? const Icon(Icons.error)
          : ShowCachedImage(posterUrl: posterUrl),
      title: Text(item.name, style: subheadingStyle),
      subtitle: Text(
        item.overview,
        style: captionStyle,
        maxLines: 3,
        softWrap: true,
      ),
      onTap: () =>
          isWatchlistView ? () {} : viewModel.showDialog(contentId: item.id),
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

// void _showCardOnTap(
//     BuildContext context, String posterUrl, TvSeriesSearchResult item) {
//   // TODO add background blur
//   showDialog(
//     useSafeArea: true,
//     context: context,
//     builder: (BuildContext context) => Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Dialog(
//         insetPadding: EdgeInsets.zero,
//         child: Card(
//           margin: EdgeInsets.zero,
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(23.0),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment:
//                     MainAxisAlignment.start, // Align to the start
//                 crossAxisAlignment: CrossAxisAlignment.start, //
//                 children: [
//                   ShowCachedImage(
//                     posterUrl: posterUrl,
//                     height: 100,
//                     width: 80,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(item.name, style: heading3Style),
//                         Text("${item.firstAirDate.year.toString()}/${item.}",
//                             style: subheadingStyle),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
