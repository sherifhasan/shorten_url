import 'package:flutter/material.dart';
import 'package:shorten_url/ui/base/base_view.dart';
import 'package:shorten_url/ui/shared/app_title.dart';
import 'package:shorten_url/ui/shared/colors.dart';
import 'package:shorten_url/ui/shared/images.dart';

import 'splash_screen_view_model.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashScreenViewModel>(
        model: SplashScreenViewModel(),
        builder: (BuildContext context, SplashScreenViewModel model,
                Widget? child) =>
            Scaffold(
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppTitle(),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      AppImages.SPLASH_IMAGE,
                      fit: BoxFit.contain,
                    ),
                    Text('More than just\n Shorter links',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: AppColors.GRAYISH_VIOLET_COLOR)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'Build your brand’s recognition and get detailed insights on how your links are performing.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColors.GRAYISH_VIOLET_COLOR)),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () => model.navigateToHome(),
                      minWidth: 279,
                      textColor: AppColors.WHITE_COLOR,
                      color: AppColors.PRIMARY_COLOR_CYAN,
                      child: Text('START',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )),
                    )
                  ],
                ),
              ),
            ));
  }
}
