import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';

class MyDropDown<T> extends StatelessWidget {
  final String hint;
  final List<T> values;
  final T? currentValue;
  final Function(T? newValue) onChanged;
  final bool isBorderNone;
  final bool isSearchble;

  const MyDropDown({
    super.key,
    required this.hint,
    required this.values,
    required this.currentValue,
    required this.onChanged,
    this.isBorderNone = false,
    this.isSearchble = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isSearchble) {
      return DropdownSearch<T>(
        popupProps: PopupProps.menu(
          showSelectedItems: true,
          showSearchBox: true,
        ),
        clearButtonProps: ClearButtonProps(isVisible: true),
        items: values,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: hint,
          ),
        ),
        onChanged: onChanged,
        selectedItem: currentValue,
      );
    }
    return DropdownButtonFormField<T>(
      value: currentValue,
      hint: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          hint,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.grey,
              ),
        ),
      ),
      decoration: InputDecoration(
        border: isBorderNone ? UnderlineInputBorder() : OutlineInputBorder(),
      ),
      iconSize: 24,
      elevation: 16,
      style:
          Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),
      onChanged: onChanged,
      items: values.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / (isBorderNone ? 4 : 3),
            height: 30,
            child: Text(
              value.toString(),
              style: GoogleFonts.outfit(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
    );
  }
}
