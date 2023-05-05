import 'package:flutter/material.dart';

enum TextFieldType { normal, password }

/// A customizable text field widget that can be used for various purposes such as
/// getting text input from the user. The text field can be either normal or password
/// type based on the value of [type] property.
class AppTextField extends StatefulWidget {
  /// The type of the text field.
  final TextFieldType type;

  /// The controller to be used to control the text field.
  final TextEditingController? controller;

  /// The hint text to be displayed when the text field is empty.
  final String? hintText;

  /// The error text to be displayed when the input in the text field is invalid.
  final String? errorText;

  /// The initial value to be displayed in the text field.
  final String? initialValue;

  /// The maximum number of lines to be displayed in the text field.
  final int maxLines;

  /// A callback that is called when the text in the text field is changed.
  final ValueChanged<String>? onChanged;

  /// A callback that is called when the text field is submitted.
  final ValueChanged<String>? onFieldSubmitted;

  /// A validator that is used to validate the input in the text field.
  final FormFieldValidator? validator;

  /// Determines whether the text field is enabled or disabled.
  final bool enabled;

  /// Creates a new instance of [AppTextField].
  ///
  /// The [type], [maxLines], and [enabled] parameters must not be null.
  const AppTextField({
    Key? key,
    required this.type,
    this.controller,
    this.hintText,
    this.errorText,
    this.initialValue,
    this.maxLines = 1,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.enabled = true,
  }) : super(key: key);

  /// Creates a new instance of [AppTextField] with [type] set to [TextFieldType.password].
  ///
  /// The [maxLines] parameter defaults to 1 if not specified.
  factory AppTextField.password({
    TextEditingController? controller,
    String? hintText,
    String? errorText,
    String? initialValue,
    int maxLines = 1,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldValidator? validator,
    bool enabled = true,
  }) {
    return AppTextField(
      type: TextFieldType.password,
      hintText: hintText,
      controller: controller,
      errorText: errorText,
      initialValue: initialValue,
      maxLines: maxLines,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      enabled: enabled,
    );
  }

  /// Creates a new instance of [AppTextField] with [type] set to [TextFieldType.normal].
  ///
  /// The [maxLines] parameter defaults to 1 if not specified.
  factory AppTextField.normal({
    TextEditingController? controller,
    String? hintText,
    String? errorText,
    String? initialValue,
    int maxLines = 1,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldValidator? validator,
    bool enabled = true,
  }) {
    return AppTextField(
      type: TextFieldType.normal,
      hintText: hintText,
      controller: controller,
      errorText: errorText,
      initialValue: initialValue,
      maxLines: maxLines,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      enabled: enabled,
    );
  }

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  /// The state includes a boolean [_isObscureText] variable that determines whether the text
  /// input should be obscured (in case the text field type is a password field).
  ///
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines,
      initialValue: widget.initialValue,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: widget.type == TextFieldType.password && _isObscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.hintText,
        errorText: widget.errorText,
        suffixIcon: widget.type == TextFieldType.normal
            ? null
            : GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscureText = !_isObscureText;
                  });
                },
                child: _isObscureText
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
      ),
    );
  }
}
