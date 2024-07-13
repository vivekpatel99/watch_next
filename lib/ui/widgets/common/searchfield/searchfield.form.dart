// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String SearchFieldValueKey = 'searchField';

final Map<String, TextEditingController> _SearchfieldTextEditingControllers =
    {};

final Map<String, FocusNode> _SearchfieldFocusNodes = {};

final Map<String, String? Function(String?)?> _SearchfieldTextValidations = {
  SearchFieldValueKey: null,
};

mixin $Searchfield {
  TextEditingController get searchFieldController =>
      _getFormTextEditingController(SearchFieldValueKey);

  FocusNode get searchFieldFocusNode => _getFormFocusNode(SearchFieldValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SearchfieldTextEditingControllers.containsKey(key)) {
      return _SearchfieldTextEditingControllers[key]!;
    }

    _SearchfieldTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SearchfieldTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SearchfieldFocusNodes.containsKey(key)) {
      return _SearchfieldFocusNodes[key]!;
    }
    _SearchfieldFocusNodes[key] = FocusNode();
    return _SearchfieldFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    searchFieldController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    searchFieldController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          SearchFieldValueKey: searchFieldController.text,
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

    for (var controller in _SearchfieldTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SearchfieldFocusNodes.values) {
      focusNode.dispose();
    }

    _SearchfieldTextEditingControllers.clear();
    _SearchfieldFocusNodes.clear();
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

  String? get searchFieldValue =>
      this.formValueMap[SearchFieldValueKey] as String?;

  set searchFieldValue(String? value) {
    this.setData(
      this.formValueMap..addAll({SearchFieldValueKey: value}),
    );

    if (_SearchfieldTextEditingControllers.containsKey(SearchFieldValueKey)) {
      _SearchfieldTextEditingControllers[SearchFieldValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasSearchField =>
      this.formValueMap.containsKey(SearchFieldValueKey) &&
      (searchFieldValue?.isNotEmpty ?? false);

  bool get hasSearchFieldValidationMessage =>
      this.fieldsValidationMessages[SearchFieldValueKey]?.isNotEmpty ?? false;

  String? get searchFieldValidationMessage =>
      this.fieldsValidationMessages[SearchFieldValueKey];
}

extension Methods on FormStateHelper {
  setSearchFieldValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SearchFieldValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    searchFieldValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      SearchFieldValueKey: getValidationMessage(SearchFieldValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SearchfieldTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SearchfieldTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      SearchFieldValueKey: getValidationMessage(SearchFieldValueKey),
    });
