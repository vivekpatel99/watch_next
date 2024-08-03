import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:watch_next/datamodels/series_item_model.dart';
import 'package:watch_next/themes/styles.dart';
import 'package:watch_next/ui/common/ui_helpers.dart';
import 'package:watch_next/ui/widgets/dumb_widgets/show_cached_image.dart';

import 'overview_model.dart';

class Overview extends StackedView<OverviewModel> {
  final TvSeriesItemModel detailsMdl;
  const Overview({super.key, required this.detailsMdl});

  @override
  Widget builder(
    BuildContext context,
    OverviewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          child: ShowCachedImage(
            posterUrl: detailsMdl.posterPath,
            boxFit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
                height: screenHeight(context),
                width: screenWidth(context),
                color: Colors.black.withOpacity(0)),
          ),
        ),
        Column(
          children: [
            Card(
              color: Colors.transparent,
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 20,
              ),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          clipBehavior: Clip.antiAlias,
                          child: ShowCachedImage(
                            posterUrl: detailsMdl.posterPath,
                            height: 180,
                            width: 120,
                            boxFit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 55),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${detailsMdl.firstAirDate!.year.toString()} / ${detailsMdl.status}",
                                style: subheadingStyle.copyWith(
                                    color: Colors.white),
                              ),
                              Text(detailsMdl.networks![0].name,
                                  style: subheadingStyle.copyWith(
                                      color: Colors.white)),
                              Text(
                                  detailsMdl.episodeRunTime!.isEmpty
                                      ? '-'
                                      : detailsMdl.episodeRunTime![0]
                                          .toString(),
                                  style: subheadingStyle.copyWith(
                                      color: Colors.white)),
                              Text('Next Episode date and time',
                                  style: subheadingStyle.copyWith(
                                      color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  OverviewModel viewModelBuilder(BuildContext context) => OverviewModel();
}
