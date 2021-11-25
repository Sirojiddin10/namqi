import 'package:flutter/material.dart';

class UserComponent extends StatelessWidget {
  final String? text;
  final VoidCallback onTap;
  final double height;
  final EdgeInsets margin;
  final Widget? child;
  final bool isSelected;
  final Color? color;
  final Color? textColor;
  const UserComponent({
    this.text,
    this.textColor,
    this.color,
    this.child,
    this.isSelected = false,
    required this.onTap,
    this.height = 40,
    this.margin = const EdgeInsets.only(left: 20, right: 20, bottom: 20),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.grey : color ?? Colors.white,
          border: Border.all(color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                offset: const Offset(5, 5),
                blurRadius: 10)
          ],
        ),
        child: child ??
            Center(
              child: Text(
                text ?? '',
                style:
                    TextStyle(fontSize: 20, color: textColor ?? Colors.black),
              ),
            ),
      ),
    );
  }
}
