import 'package:flutter/material.dart';

import 'colors.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Shortly',
        style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColors.GRAYISH_VIOLET_COLOR));
  }
}
