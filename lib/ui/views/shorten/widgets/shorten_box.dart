import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shorten_url/ui/shared/colors.dart';
import 'package:shorten_url/ui/shared/images.dart';

import '../shorten_screen_view_model.dart';

class ShortenBox extends StatefulWidget {
  ShortenBox(this.model, this.isHistory);

  final ShortenScreenViewModel model;
  final bool isHistory;

  @override
  _ShortenBoxState createState() => _ShortenBoxState();
}

class _ShortenBoxState extends State<ShortenBox> {
  final _text = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      color: AppColors.PRIMARY_COLOR_DARK_VIOLET,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Stack(
        alignment: Alignment.topRight,
        fit: StackFit.loose,
        children: [
          SvgPicture.asset(AppImages.SHAPE),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                    controller: _text,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        _validate = false;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.WHITE_COLOR,
                      contentPadding: const EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.GREY_COLOR)),
                      hintText: _validate
                          ? 'Please add a link here'
                          : 'Shorten a link here ...',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: _validate
                            ? AppColors.SECONDARY_COLOR
                            : AppColors.GREY_COLOR,
                      ),
                    )),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    if (_text.text.isEmpty)
                      _validate = true;
                    else {
                      widget.model
                          .shorten(_text, context, widget.isHistory);
                    }
                  });
                },
                minWidth: 279,
                height: 49,
                textColor: AppColors.WHITE_COLOR,
                color: AppColors.PRIMARY_COLOR_CYAN,
                child: Text('SHORTEN IT!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
