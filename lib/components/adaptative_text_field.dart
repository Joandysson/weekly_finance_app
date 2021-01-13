import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool autofocus;
  final void Function(String) onSubmitted;

  AdaptativeTextField({
    this.label,
    this.controller,
    this.onSubmitted,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              placeholder: label,
              autofocus: autofocus,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            decoration: InputDecoration(labelText: label),
            keyboardType: keyboardType,
            controller: controller,
            onSubmitted: (_) => onSubmitted,
            autofocus: autofocus,
          );
  }
}
