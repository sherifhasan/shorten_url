import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shorten_url/core/models/url_response.dart';
import 'package:shorten_url/core/providers/links_history_provider.dart';
import 'package:shorten_url/core/services/api/shorten_api.dart';
import 'package:shorten_url/core/services/navigation/navigation_service.dart';
import 'package:shorten_url/ui/base/base_model.dart';
import 'package:shorten_url/ui/shared/colors.dart';
import 'package:shorten_url/ui/shared/dialog.dart';
import 'package:shorten_url/ui/shared/routes.dart';

import '../../../locator_setup.dart';

class ShortenScreenViewModel extends BaseModel {
  final _shortenApi = locator<ShortenApi>();
  final _navigation = locator<NavigationService>();

  Future<void> shorten(TextEditingController controller, BuildContext context,
      bool isHistory) async {
    setBusy(true);
    final response = await _shortenApi.shortenUrl(controller.text);
    setBusy(false);
    if (response != null) {
      Provider.of<LinksHistoryProvider>(
              _navigation.navigatorKey.currentContext!,
              listen: false)
          .add(response);
      controller.clear();
      if (!isHistory) {
        _navigation.pushReplacementNamed(RoutePaths.historyScreen);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Unable to proceed your request please try again",
          textColor: AppColors.WHITE_COLOR,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: AppColors.SECONDARY_COLOR);
    }
  }

  void clearUrl(String code, BuildContext context) {
    showDeletionDialog(context, code);
  }

  Future<bool> copyUrl(UrlResponse urlResponse, BuildContext context) async {
    setBusy(true);
    await FlutterClipboard.copy(urlResponse.shortUrl);
    Provider.of<LinksHistoryProvider>(context, listen: false)
        .copied(urlResponse.code);
    setBusy(false);
    return true;
  }
}
