import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key , this.onTap});
   final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.teal,
        ),
        child: const Center(
            child: Text(
          'Add',
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
