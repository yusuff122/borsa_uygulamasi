import 'package:flutter/material.dart';

Widget customDropdown(List<String> items, String value, void onChange(val)) {
  return Column(
    children: [
      Expanded(
        child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
            child: DropdownButton(
              isExpanded: true,
              value: value,
              onChanged: (val) {
                onChange(val);
              },
              items: items.map<DropdownMenuItem<String>>((String val) {
                return DropdownMenuItem(child: Text(val), value: val);
              }).toList(),
            )),
      ),
    ],
  );
}
