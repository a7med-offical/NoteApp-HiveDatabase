import 'package:app/Views/Widget/Custom_IconSearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.onPressed,required this.text, required this.icon});
  final String text;
  final IconData icon;
  final  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          text,
          style:const TextStyle(color: Colors.white, fontSize: 24),
        ),
       const Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: CustomIconSearch(icon: icon,onPressed:onPressed ,),
        )
      ],
    );
  }
}
