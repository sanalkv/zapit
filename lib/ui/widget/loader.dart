import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final double? size;

  const Loader({
    Key? key,
    this.padding,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Platform.isAndroid
          ? SizedBox(
              height: size ?? 20,
              width: size ?? 20,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 2.5,
              ),
            )
          : CupertinoTheme(
              data: CupertinoTheme.of(context).copyWith(brightness: Brightness.dark),
              child: const CupertinoActivityIndicator(),
            ),
    );
  }
}
