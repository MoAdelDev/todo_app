import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/themes.dart';

class DefaultTextField extends StatelessWidget {
  final String title;
  final String note;
  final String? errorMsg;
  final TextEditingController controller;
  final Widget? widget;
  final Function()? onTap;
  const DefaultTextField({
    super.key,
    required this.title,
    required this.note,
    required this.controller,
    this.widget,
    this.errorMsg,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Themes.titleStyle,
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            autofocus: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorMsg ?? '';
              }
              return null;
            },
            readOnly: widget != null ? true : false,
            cursorColor: Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
            style: Themes.subTitleStyle,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: note,
              hintStyle: Themes.subTitleStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              suffixIcon: widget,
            ),
          ),
        ],
      ),
    );
  }
}
