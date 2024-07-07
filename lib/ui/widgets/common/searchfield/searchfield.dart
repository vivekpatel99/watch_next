import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:watch_next/ui/views/search/search_viewmodel.dart';
import 'package:watch_next/ui/widgets/common/searchfield/searchfield.form.dart';

@FormView(fields: [
  FormTextField(name: 'searchField'),
])
class Searchfield extends StackedView<SearchViewModel> with $Searchfield {
  const Searchfield({super.key});
  @override
  void onDispose(viewModel) {
    searchFieldController.dispose();
  }

  @override
  Widget builder(
    BuildContext context,
    SearchViewModel viewModel,
    Widget? child,
  ) {
    return TextField(
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          //TODO find a way to rebuid from to show hint text according to selected tab
          hintText: 'Search'),
      // autofocus: true,
      controller: searchFieldController,
      // onChanged: viewModel.getSeriesName,
      onSubmitted: viewModel.getSeriesName,
    );
  }

  @override
  void onViewModelReady(SearchViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  SearchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchViewModel();
}
