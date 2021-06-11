import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shorten_url/ui/shared/colors.dart';
import 'package:shorten_url/ui/shared/textStyle.dart';

class PagerItem extends StatelessWidget {
  PagerItem({required this.title, required this.body, required this.image});

  final String title;

  final String body;

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 32.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.GRAYISH_VIOLET_COLOR),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      body,
                      textAlign: TextAlign.center,
                      style: normalTextStyle(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(80.0),
            child: Container(
              color: AppColors.PRIMARY_COLOR_DARK_VIOLET,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  image,
                  height: 70,
                  width: 70,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
