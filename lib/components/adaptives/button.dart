import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? label;

  const AdaptativeButton({
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label!),
            onPressed: onPressed,
          )
        : ElevatedButton(
            onPressed: onPressed,
            child: Text(label!),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ));
  }
}
