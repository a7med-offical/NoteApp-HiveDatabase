import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomIconSearch extends StatelessWidget {
  const CustomIconSearch({super.key, required this.icon,this.onPressed});
  final IconData icon;
  final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
          onPressed:onPressed,
          icon:  Icon(
           icon,
            size: 25,
          )),
    );
  }
}
