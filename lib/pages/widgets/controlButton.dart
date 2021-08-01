import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.5,
          color: Color(0xFF1A645B),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          color: Color(0xFF1A645B),
        ),
      ),
    );
  }
}
