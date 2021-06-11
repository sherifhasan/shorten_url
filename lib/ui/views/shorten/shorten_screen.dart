import 'package:flutter/material.dart';
import 'package:shorten_url/ui/base/base_view.dart';
import 'package:shorten_url/ui/shared/app_title.dart';
import 'package:shorten_url/ui/shared/colors.dart';
import 'package:shorten_url/ui/shared/images.dart';
import 'package:shorten_url/ui/shared/loading.dart';
import 'package:shorten_url/ui/shared/textStyle.dart';
import 'package:shorten_url/ui/views/shorten/widgets/shorten_box.dart';

import 'shorten_screen_view_model.dart';

class ShortenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ShortenScreenViewModel>(
        model: ShortenScreenViewModel(),
        builder: (BuildContext context, ShortenScreenViewModel model,
                Widget? child) =>
            Scaffold(
                backgroundColor: AppColors.OFF_WHITE_COLOR,
                body: SafeArea(
                  bottom: false,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppTitle(),
                          SizedBox(
                            height: 40,
                          ),
                          Image.asset(AppImages.SPLASH_IMAGE),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Let’s get started!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.GRAYISH_VIOLET_COLOR),
                          ),
                          Text(
                            'Paste your first link into\n the field to shorten it',
                            textAlign: TextAlign.center,
                            style: normalTextStyle(),
                          ),
                          SizedBox(
                            height: model.busy ? 20 : 40,
                          ),
                          if (model.busy) LoadingView(),
                          ShortenBox(model, false)
                        ]),
                  ),
                )));
  }
}
