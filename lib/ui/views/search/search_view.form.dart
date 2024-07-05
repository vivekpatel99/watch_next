// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String SearchQueryValueKey = 'searchQuery';

final Map<String, TextEditingController> _SearchViewTextEditingControllers = {};

final Map<String, FocusNode> _SearchViewFocusNodes = {};

final Map<String, String? Function(String?)?> _SearchViewTextValidations = {
  SearchQueryValueKey: null,
};

mixin $SearchView {
  TextEditingController get searchQueryController =>
      _getFormTextEditingController(SearchQueryValueKey);

  FocusNode get searchQueryFocusNode => _getFormFocusNode(SearchQueryValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SearchViewTextEditingControllers.containsKey(key)) {
      return _SearchViewTextEditingControllers[key]!;
    }

    _SearchViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SearchViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SearchViewFocusNodes.containsKey(key)) {
      return _SearchViewFocusNodes[key]!;
    }
    _SearchViewFocusNodes[key] = FocusNode();
    return _SearchViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    searchQueryController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    searchQueryController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          SearchQueryValueKey: searchQueryController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _SearchViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SearchViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SearchViewTextEditingControllers.clear();
    _SearchViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get searchQueryValue =>
      this.formValueMap[SearchQueryValueKey] as String?;

  set searchQueryValue(String? value) {
    this.setData(
      this.formValueMap..addAll({SearchQueryValueKey: value}),
    );

    if (_SearchViewTextEditingControllers.containsKey(SearchQueryValueKey)) {
      _SearchViewTextEditingControllers[SearchQueryValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasSearchQuery =>
      this.formValueMap.containsKey(SearchQueryValueKey) &&
      (searchQueryValue?.isNotEmpty ?? false);

  bool get hasSearchQueryValidationMessage =>
      this.fieldsValidationMessages[SearchQueryValueKey]?.isNotEmpty ?? false;

  String? get searchQueryValidationMessage =>
      this.fieldsValidationMessages[SearchQueryValueKey];
}

extension Methods on FormStateHelper {
  setSearchQueryValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SearchQueryValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    searchQueryValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      SearchQueryValueKey: getValidationMessage(SearchQueryValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SearchViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SearchViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      SearchQueryValueKey: getValidationMessage(SearchQueryValueKey),
    });
