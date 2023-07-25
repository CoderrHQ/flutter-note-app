import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      width: 47,
      decoration: const BoxDecoration(
        color: Color(0xff3C3C3C),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          iconData,
          size: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
