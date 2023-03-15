import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RoundedCornerDropdown extends StatelessWidget {
  final String name;
  final String errorText;
  final List<DropdownMenuItem<String>> items;
  final String? initialValue;

  const RoundedCornerDropdown(
      {Key? key,
      required this.name,
      required this.errorText,
      required this.items,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('initial value is');
    print(initialValue);
    return FormBuilderDropdown<String>(
      name: name,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        hintText: 'Please Select',
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: errorText),
      ]),
      items: items,
      initialValue: initialValue == 'null' ? '' : initialValue,
    );
  }
}
