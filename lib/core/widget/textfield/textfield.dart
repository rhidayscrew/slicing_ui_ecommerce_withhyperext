// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core/theme/theme_config.dart';

class Qtextfield extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String text)? onChanged;
  final Function(String text)? onSubmitted;

  const Qtextfield({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    //ketik stss hapus scaffott ganti dgn textfield emial
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // add decoration - Boxdecoration di dalam (ketik: radius12)
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
        color: disabledColor,
      ),

      // dibungkus dengan row kursor ke child, lalu pilih wrap with row
      child: Row(
        children: [
          if (prefixIcon != null) ...{
            Icon(
              prefixIcon,
              size: 24.0,
              color: secondaryTextColor,
            ),
            const SizedBox(
              width: 12.0,
            ),
          },
          //dibungkus dengan expanded alt+e
          Expanded(
            child: TextFormField(
              decoration: InputDecoration.collapsed(
                // add collaps
                hintText: label,
                hintStyle: TextStyle(
                  color: secondaryTextColor,
                ),
              ),
              onChanged: (value) {
                if (onSubmitted != null) {
                  onSubmitted!(value);
                }
              },
              onFieldSubmitted: (value) {
                if (onSubmitted != null) {
                  onSubmitted!(value);
                }
              },
            ),
          ),
          if (suffixIcon != null) ...{
            const SizedBox(
              width: 12.0,
            ),
            Icon(
              suffixIcon,
              size: 24.0,
              color: secondaryTextColor,
            ),
          }
        ],
      ),
    );
  }
}
