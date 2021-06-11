import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorten_url/core/providers/links_history_provider.dart';
import 'package:shorten_url/ui/base/base_view.dart';
import 'package:shorten_url/ui/shared/colors.dart';
import 'package:shorten_url/ui/shared/loading.dart';
import 'package:shorten_url/ui/shared/textStyle.dart';
import 'package:shorten_url/ui/views/history/widgets/list_item.dart';
import 'package:shorten_url/ui/views/shorten/shorten_screen_view_model.dart';
import 'package:shorten_url/ui/views/shorten/widgets/shorten_box.dart';

class HistoryScreen extends StatelessWidget {
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Your Link History',
                          style: normalTextStyle(),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Expanded(
                          flex: 3,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  Provider.of<LinksHistoryProvider>(context)
                                      .urlsHistoryList
                                      .length,
                              itemBuilder: (BuildContext context, int index) =>
                                  ListItem(
                                      urlResponse:
                                          Provider.of<LinksHistoryProvider>(
                                                  context)
                                              .urlsHistoryList[index],
                                      model: model)),
                        ),
                        if (model.busy) Expanded(child: LoadingView()),
                        if (!model.busy)
                          Expanded(child: ShortenBox(model, true))
                      ],
                    ))));
  }
}
