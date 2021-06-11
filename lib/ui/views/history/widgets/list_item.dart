import 'package:flutter/material.dart';
import 'package:shorten_url/core/models/url_response.dart';
import 'package:shorten_url/ui/shared/colors.dart';
import 'package:shorten_url/ui/shared/textStyle.dart';
import 'package:shorten_url/ui/views/shorten/shorten_screen_view_model.dart';

class ListItem extends StatelessWidget {
  final UrlResponse urlResponse;
  final ShortenScreenViewModel model;

  ListItem({required this.urlResponse, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppColors.WHITE_COLOR,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      urlResponse.mainUrl,
                      overflow: TextOverflow.ellipsis,
                      style: normalTextStyle(),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () => model.clearUrl(urlResponse.code, context),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 32,
                    ))
              ],
            ),
            Divider(
              color: AppColors.GREY_COLOR,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      urlResponse.shortUrl,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.PRIMARY_COLOR_CYAN,
                          fontSize: 17),
                    ),
                  ),
                ),
                Container()
              ],
            ),
            MaterialButton(
              onPressed: () async {
                await model.copyUrl(urlResponse, context);
              },
              minWidth: 279,
              textColor: AppColors.WHITE_COLOR,
              color: urlResponse.isCopied
                  ? AppColors.PRIMARY_COLOR_DARK_VIOLET
                  : AppColors.PRIMARY_COLOR_CYAN,
              child: Text(urlResponse.isCopied ? "Copied" : 'Copy',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
