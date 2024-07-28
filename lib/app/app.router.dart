// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i8;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;
import 'package:watch_next/ui/views/home/home_view.dart' as _i2;
import 'package:watch_next/ui/views/recent/recent_view.dart' as _i6;
import 'package:watch_next/ui/views/search/search_view.dart' as _i4;
import 'package:watch_next/ui/views/startup/startup_view.dart' as _i3;
import 'package:watch_next/ui/views/upcoming/upcoming_view.dart' as _i5;
import 'package:watch_next/ui/views/watch_list_item_details/watch_list_item_details_view.dart'
    as _i7;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const searchView = '/search-view';

  static const tabUpcomingView = '/tab-upcoming-view';

  static const tabRecentView = '/tab-recent-view';

  static const watchListItemDetailsView = '/watch-list-item-details-view';

  static const all = <String>{
    homeView,
    startupView,
    searchView,
    tabUpcomingView,
    tabRecentView,
    watchListItemDetailsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.searchView,
      page: _i4.SearchView,
    ),
    _i1.RouteDef(
      Routes.tabUpcomingView,
      page: _i5.TabUpcomingView,
    ),
    _i1.RouteDef(
      Routes.tabRecentView,
      page: _i6.TabRecentView,
    ),
    _i1.RouteDef(
      Routes.watchListItemDetailsView,
      page: _i7.WatchListItemDetailsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.SearchView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SearchView(),
        settings: data,
      );
    },
    _i5.TabUpcomingView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.TabUpcomingView(),
        settings: data,
      );
    },
    _i6.TabRecentView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.TabRecentView(),
        settings: data,
      );
    },
    _i7.WatchListItemDetailsView: (data) {
      final args =
          data.getArgs<WatchListItemDetailsViewArguments>(nullOk: false);
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.WatchListItemDetailsView(
            key: args.key, itemId: args.itemId, name: args.name),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class WatchListItemDetailsViewArguments {
  const WatchListItemDetailsViewArguments({
    this.key,
    required this.itemId,
    required this.name,
  });

  final _i8.Key? key;

  final int itemId;

  final String name;

  @override
  String toString() {
    return '{"key": "$key", "itemId": "$itemId", "name": "$name"}';
  }

  @override
  bool operator ==(covariant WatchListItemDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.itemId == itemId && other.name == name;
  }

  @override
  int get hashCode {
    return key.hashCode ^ itemId.hashCode ^ name.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTabUpcomingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.tabUpcomingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTabRecentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.tabRecentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWatchListItemDetailsView({
    _i8.Key? key,
    required int itemId,
    required String name,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.watchListItemDetailsView,
        arguments: WatchListItemDetailsViewArguments(
            key: key, itemId: itemId, name: name),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTabUpcomingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.tabUpcomingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTabRecentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.tabRecentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWatchListItemDetailsView({
    _i8.Key? key,
    required int itemId,
    required String name,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.watchListItemDetailsView,
        arguments: WatchListItemDetailsViewArguments(
            key: key, itemId: itemId, name: name),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
