import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color bgColor, textColor;
  final double tMargin, bMargin, hMargin;
  final double height;
  final double fontSize;
  final bool showArrow, showUpload, border;

  const DefaultButton({
    super.key,
    required this.onTap,
    required this.text,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.tMargin = 0,
    this.bMargin = 0,
    this.height = 40,
    this.hMargin = 25,
    this.showArrow = true,
    this.showUpload = false,
    this.border = false,
    required this.fontSize,
    // required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            left: hMargin, right: hMargin, top: tMargin, bottom: bMargin),
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(35),
          border: border ? Border.all(color: Colors.black) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                  ),
                ),
                if (showArrow)
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultButtonAnimated extends StatelessWidget {
  const DefaultButtonAnimated({
    Key? key,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.tMargin = 0,
    this.bMargin = 0,
    this.height = 40,
    this.hMargin = 25,
    this.showArrow = true,
    this.showUpload = false,
    this.border = false,
    required this.fontSize,
    // this.text,
    required this.ontap,
    this.indicator,
  }) : super(key: key);
  // final String text;
  final Color bgColor, textColor;
  final double tMargin, bMargin, hMargin;
  final double height;
  final double fontSize;
  final bool showArrow, showUpload, border;
  final CircularProgressIndicator? indicator;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(
            left: hMargin, right: hMargin, top: tMargin, bottom: bMargin),
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(35),
          border: border ? Border.all(color: Colors.black) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please Wait...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                  ),
                ),
                if (showArrow)
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
    // SizedBox(
    //   width: double.infinity,
    //   height: getProportionateScreenHeight(56),
    //   child: TextButton(
    //       style: TextButton.styleFrom(
    //         backgroundColor: Colors.black,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(5),
    //         ),
    //       ),
    //       onPressed: press,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           const CircularProgressIndicator(color: Colors.white),
    //           const SizedBox(width: 24),
    //           Text('Please Wait...', style: defButtonStyle),
    //         ],
    //       )),
    // );
  }
}
