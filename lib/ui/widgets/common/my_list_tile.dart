import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watch_next/contants/constansts.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/themes/styles.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.posterUrl,
    required this.item,
    required this.myCheckbox,
  });

  final String? posterUrl;
  final TvSeriesSearchResult item;
  final Widget myCheckbox;

  @override
  Widget build(BuildContext context) {
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
      onTap: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      trailing: myCheckbox,
    );
  }
}
