import 'package:flutter/material.dart';
import 'package:todo/core/style/colors.dart';

class DefaultButton extends StatelessWidget {
  final String lable;
  final VoidCallback onTap;
  const DefaultButton({
    super.key,
    required this.lable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColor.primaryColor,
      ),
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          lable,
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
