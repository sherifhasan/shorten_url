import 'package:flutter/material.dart';
import 'package:shorten_url/ui/base/base_view.dart';
import 'package:shorten_url/ui/shared/app_title.dart';
import 'package:shorten_url/ui/shared/colors.dart';
import 'package:shorten_url/ui/shared/images.dart';
import 'package:shorten_url/ui/shared/textStyle.dart';
import 'package:shorten_url/ui/views/home/home_consts.dart';
import 'package:shorten_url/ui/views/home/home_screen_view_model.dart';
import 'package:shorten_url/ui/views/home/widgets/pager_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScreenViewModel>(
        model: HomeScreenViewModel(),
        builder:
            (BuildContext context, HomeScreenViewModel model, Widget? child) =>
                Scaffold(
                    backgroundColor: AppColors.OFF_WHITE_COLOR,
                    body: SafeArea(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppTitle(),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 2,
                              child: PageView(
                                controller: controller,
                                children: [
                                  PagerItem(
                                      title: 'Brand Recognition',
                                      body: HOME_PAGE_BODY1,
                                      image: AppImages.HOME_CONTENT_1),
                                  PagerItem(
                                      title: 'Detailed Records',
                                      body: HOME_PAGE_BODY2,
                                      image: AppImages.HOME_CONTENT_2),
                                  PagerItem(
                                      title: 'Fully Customizable',
                                      body: HOME_PAGE_BODY2,
                                      image: AppImages.HOME_CONTENT_3)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: SmoothPageIndicator(
                                controller: controller,
                                count: 3,
                                effect: WormEffect(
                                    dotHeight: 12,
                                    dotWidth: 12,
                                    activeDotColor: AppColors.GREY_COLOR,
                                    dotColor: AppColors.LIGHT_GREY_COLOR),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => model.navigateToShortenScreen(),
                              child: Text(
                                'Skip',
                                style: normalTextStyle(),
                              ),
                            )
                          ]),
                    )));
  }
}
