// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CheckoutOption extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String? subtitle2;
  const CheckoutOption({
    super.key,
    required this.title,
    required this.subtitle1,
    this.subtitle2,
  });

  @override
  Widget build(BuildContext context) {
    // col+tab
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subtitle1),
              if (subtitle2 != null) Text(subtitle2!),
            ],
          ),
          trailing: const Icon(
            Icons.chevron_right,
            size: 24.0,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
