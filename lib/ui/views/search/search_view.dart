import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:watch_next/themes/styles.dart';
import 'package:watch_next/ui/views/search/search_view.form.dart';
import 'package:watch_next/ui/widgets/common/tabview/tab_discover_view.dart';
import 'package:watch_next/ui/widgets/common/tabview/tab_watchlist_view.dart';

import 'search_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'searchQuery'),
])
class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with $SearchView {
  @override
  Widget build(BuildContext context) {
    const List<Tab> myTabs = [
      Tab(child: Text('Watch List', style: subheadingStyle)),
      Tab(child: Text('Discover', style: subheadingStyle)),
    ];
    // TextEditingController? searchQueryController;
    // String searchQuery = "";
    // String hintText = 'Watchlist'; // Default hint text
    // List<String> watchlistResults = ['vivek', 'patel', 'radha'];
    // List<String> discoverResults = [];

    // void _handleTabSelection() {
    //   setState(() {
    //     _hintText = _tabController.index == 0 ? 'Watchlist' : 'Discover';
    //   });
    // }

    // @override
    // void initState() {
    //   super.initState();

    //   _tabController.addListener(_handleTabSelection);
    // }

    // @override
    // void dispose() {
    //   _tabController.dispose();
    //   super.dispose();
    // }

    // void onSearchChanged(String query) {
    //   setState(() {
    //     _searchQuery = query;
    //   });

    //   if (_tabController.index == 0) {
    //     // Mock fetch watchlist suggestions
    //     setState(() {
    //       watchlistResults = List.generate(
    //           10, (index) => "Watchlist Result $index for $query");
    //     });
    //     // print("Watchlist suggestions for: $query");
    //     // Implement your logic to fetch watchlist suggestions
    //   } else {
    //     // Mock fetch API data
    //     setState(() {
    //       discoverResults =
    //           List.generate(10, (index) => "API Result $index for $query");
    //     });
    //     // print("API request for: $query");
    //     // Implement your logic to fetch API data
    //   }
    // }

    return ViewModelBuilder<SearchViewModel>.reactive(
      builder: (context, viewModel, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
              child: TextField(
                decoration: const InputDecoration(
                    //TODO find a way to rebuid from to show hint text according to selected tab
                    hintText: 'Search'),
                autofocus: true,
                controller: searchQueryController,
                // onChanged: () {},
                // onSubmitted: viewModel.getSerisName,
              ),
            ),
            bottom: const TabBar(tabs: myTabs),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TabBarView(
              children: [
                const TabWatchListview(),
                TabDiscoverView(
                  searchQuery: searchQueryController.text,
                )
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SearchViewModel(),
    );
  }
}

// DefaultTabController(
//       length: 2,
//       child: Builder(builder: (context) {
//         return Scaffold(
//           appBar: AppBar(
//             flexibleSpace: Padding(
//               padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   //TODO find a way to rebuid from to show hint text according to selected tab
//                   hintText: (DefaultTabController.of(context).index == 0)
//                       ? 'Watch List ${DefaultTabController.of(context).index}'
//                       : 'Discover  ${DefaultTabController.of(context).index}',
//                 ),
//                 autofocus: true,
//                 controller: searchInputController,
//                 // on
//                 // onFieldSubmitted: (value) =>
//                 //     showSearch(context: context, delegate: Search()),
//               ),
//             ),
//             bottom: const TabBar(tabs: [
//               Tab(child: Text('Watch List', style: subheadingStyle)),
//               Tab(child: Text('Discover', style: subheadingStyle)),
//             ]),
//           ),
//           body: const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 25.0),
//             child: TabBarView(children: [
//               Text('Watch List'),
//               Text('Discover'),
//             ]),
//           ),
//         );
//       }),
//     );
//   }
