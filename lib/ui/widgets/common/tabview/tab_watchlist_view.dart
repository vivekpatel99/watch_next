import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:watch_next/contants/api_constants.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/ui/widgets/common/my_list_tile/my_list_tile.dart';
import 'tabview_watchlist_model.dart';

class TabWatchListview extends StackedView<TabviewWatchListModel> {
  const TabWatchListview({super.key});

  @override
  Widget builder(
    BuildContext context,
    TabviewWatchListModel viewModel,
    Widget? child,
  ) {
    return (viewModel.getWatchListBox == null)
        ? const Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : ValueListenableBuilder(
            valueListenable: viewModel.getWatchListBox!.listenable(),
            builder: (context, box, _) {
              return ListView.builder(
                itemCount: viewModel.getWatchListBox!.length,
                itemBuilder: (context, index) {
                  final TvSeriesSearchResult item =
                      viewModel.getWatchListBox!.getAt(index);
                  final String? posterUrl = (item.posterPath != null)
                      ? ApiConstants.apiImageEndpoint + item.posterPath!
                      : null;
                  return MyListTile(
                    item: item,
                    posterUrl: posterUrl,
                    message: '',
                    isWatchlistView: true,
                  );
                },
              );
            });
  }

  @override
  TabviewWatchListModel viewModelBuilder(
    BuildContext context,
  ) =>
      TabviewWatchListModel();
}

// class _MyCheckBox extends StatelessWidget {
//   final TvSeriesSearchResult item;
//   const _MyCheckBox({Key? key, required this.item}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<TabviewWatchListModel>.reactive(
//       builder: (context, viewModel, child) =>
//           MyCheckBoxWidget(viewModel: viewModel, item: item),
//       viewModelBuilder: () => TabviewWatchListModel(),
//     );
//   }
// }
