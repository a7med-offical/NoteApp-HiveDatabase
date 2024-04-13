import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.maxlines,
      this.onSaved,this.onChanged});
  final String hintText;
  final int maxlines;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This Field is required';
        } else {
          return null;
        }
      },
      maxLines: maxlines,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal))),
    );
  }
}
