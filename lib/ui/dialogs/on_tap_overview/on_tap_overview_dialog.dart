import 'package:flutter/material.dart';
import 'package:watch_next/contants/assests.dart';
import 'package:watch_next/datamodels/series_item_model.dart';
import 'package:watch_next/themes/styles.dart';
import 'package:watch_next/ui/common/app_colors.dart';
import 'package:watch_next/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:watch_next/ui/widgets/dumb_widgets/show_cached_image.dart';

import 'on_tap_overview_dialog_model.dart';

const double _graphicSize = 60;

class OnTapOverviewDialog extends StackedView<OnTapOverviewDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const OnTapOverviewDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnTapOverviewDialogModel viewModel,
    Widget? child,
  ) {
    final TvSeriesItemModel model = request.data;
    return Dialog(
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TitlePartWidget(request: request, model: model),
            verticalSpaceSmall,
            overviewGenreRatingWidget(model: model),
            verticalSpaceMedium,
            ButtonsWidgets(completer: completer)
          ],
        ),
      ),
    );
  }

  @override
  OnTapOverviewDialogModel viewModelBuilder(BuildContext context) =>
      OnTapOverviewDialogModel();
}

class ButtonsWidgets extends StatelessWidget {
  const ButtonsWidgets({
    super.key,
    required this.completer,
  });

  final Function(DialogResponse p1) completer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => completer(DialogResponse(
              confirmed: true,
            )),
            child: const Text(
              'Dismiss',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          horizontalSpaceMedium,
          GestureDetector(
            onTap: () => completer(DialogResponse(
              confirmed: true,
            )),
            child: const Text(
              'Add Show',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class overviewGenreRatingWidget extends StatelessWidget {
  const overviewGenreRatingWidget({
    super.key,
    required this.model,
  });

  final TvSeriesItemModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            softWrap: true,
            model.overview!,
            style: bodyStyle,
          ),
          verticalSpaceSmall,
          const Text(
            'Genres',
            style: subheadingStyle,
          ),
          Text(
            model.genres!.map((genre) => (genre.name)).join(', '),
            style: bodyStyle,
          ),
          Row(
            children: [
              Image.asset(
                Assets.imdbIcon,
                width: 40,
                height: 40,
              )
            ],
          )
        ],
      ),
    );
  }
}

class TitlePartWidget extends StatelessWidget {
  const TitlePartWidget({
    super.key,
    required this.request,
    required this.model,
  });

  final DialogRequest request;
  final TvSeriesItemModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Align to the start
      crossAxisAlignment: CrossAxisAlignment.start, //
      children: [
        ShowCachedImage(
          posterUrl: request.imageUrl,
          height: 150,
          width: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(request.title!, style: heading3Style),
              Text("${model.firstAirDate!.year.toString()}/${model.status}",
                  style: subheadingStyle),
              verticalSpaceSmall,
              Text(model.networks![0].name, style: subheadingStyle),
              Text(
                  model.episodeRunTime!.isEmpty
                      ? ''
                      : model.episodeRunTime![0].toString(),
                  style: subheadingStyle)
            ],
          ),
        ),
      ],
    );
  }
}
