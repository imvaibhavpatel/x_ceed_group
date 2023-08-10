import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:xceed_group/auth/register_as_retailer/model/state_model.dart';

class StateDropDown extends StatelessWidget {
  final List<StateName> items;
  final DropdownSearchItemAsString<StateName>? itemAsString;
  final ValueChanged<StateName?>? onChanged;

  const StateDropDown(
      {super.key, required this.items, this.itemAsString, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<StateName>(
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
            hintText: "State",
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder:
                const UnderlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
        items: items,
        popupProps: const PopupProps.dialog(
          showSearchBox: true,
          showSelectedItems: false,
        ),
        itemAsString: itemAsString,
        onChanged: onChanged);
  }
}
