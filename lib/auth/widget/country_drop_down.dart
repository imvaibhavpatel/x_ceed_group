import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:xceed_group/auth/register_as_retailer/model/countries_model.dart';

class CountryDropDown extends StatelessWidget {
  final List<Country> items;
  final DropdownSearchItemAsString<Country>? itemAsString;
  final ValueChanged<Country?>? onChanged;

  const CountryDropDown(
      {super.key, required this.items, this.itemAsString, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Country>(
      dropdownButtonProps:  const DropdownButtonProps(
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Colors.grey,
        ),
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: const TextStyle(fontSize: 16),
        dropdownSearchDecoration: InputDecoration(
          filled: true,
          hintText: "Country",
          fillColor: Colors.grey.shade200,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
      popupProps: const PopupProps.dialog(
        showSearchBox: true,
        showSelectedItems: false,
      ),
      items: items,
      itemAsString: itemAsString,
      onChanged: onChanged,
    );
  }
}
