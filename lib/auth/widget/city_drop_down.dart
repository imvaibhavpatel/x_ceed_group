import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:xceed_group/auth/register_as_retailer/model/city_model.dart';

class CityDropDown extends StatelessWidget {
  final List<City> items;
  final DropdownSearchItemAsString<City>? itemAsString;
  final ValueChanged<City?>? onChanged;

  const CityDropDown(
      {super.key,
        required this.items,
        this.itemAsString,
        this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<City>(

        dropdownButtonProps: const DropdownButtonProps(

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
            hintText: "City",
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none),
          ),
        ),
        items: items,
        popupProps: const PopupProps.dialog(
          showSearchBox: true,
          showSelectedItems: false,
        ),
        itemAsString: itemAsString,
        onChanged: onChanged
    );
  }
}
