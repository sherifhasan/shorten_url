import 'package:flutter/material.dart';
import 'package:shorten_url/ui/shared/colors.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor:
            AlwaysStoppedAnimation<Color>(AppColors.PRIMARY_COLOR_DARK_VIOLET),
      ),
    );
  }
}
