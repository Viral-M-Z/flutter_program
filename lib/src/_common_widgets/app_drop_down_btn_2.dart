
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class AppDropdownBtnField extends StatefulWidget {
  final String? value;
  final Widget? hint;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  final List<DropdownMenuItem<String>>? items;
  final ButtonStyleData? buttonStyleData;
  final MenuItemStyleData? menuItemStyleData;
  final DropdownStyleData? dropdownStyleData;
  final InputDecoration? decoration;

  const AppDropdownBtnField({
    super.key,
    this.value,
    this.hint,
    this.validator,
    this.onChange,
    this.items,
    this.buttonStyleData,
    this.menuItemStyleData,
    this.dropdownStyleData,
    this.decoration,
  });

  @override
  State<AppDropdownBtnField> createState() => _AppDropdownBtnFieldState();
}

class _AppDropdownBtnFieldState extends State<AppDropdownBtnField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        // isExpanded: true,

        // selectedItemBuilder: ,

        decoration: widget.decoration ?? const InputDecoration(),

        hint: widget.hint ?? Text(
          'Select Item',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),

        validator: widget.validator ?? (String? val) {
          if(val?.isEmpty ?? false) {
            return "Empty";
          }
          return null;
        },

        items: (widget.items?.isNotEmpty ?? false) ? widget.items : ["Painter","Designer","Teacher","Plumber"].map((String item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        )).toList(),
        value: (widget.value?.isNotEmpty ?? false) ? null : widget.value,
        onChanged: widget.onChange /*(String? value) {
          widget.value = value ?? "";
        }*/,
        buttonStyleData: widget.buttonStyleData /*?? const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: 140,
        )*/,

        dropdownStyleData: widget.dropdownStyleData ?? const DropdownStyleData() /* DropdownStyleData(
          maxHeight: 200,
          // width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.redAccent[100],
          ),

          // offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
            mainAxisMargin: 12,
            minThumbLength: 12,

          ),
        )*/,

        menuItemStyleData: widget.menuItemStyleData ?? const MenuItemStyleData() /*?? const MenuItemStyleData(
          height: 40,
        )*/,
      )
    );
  }
}

