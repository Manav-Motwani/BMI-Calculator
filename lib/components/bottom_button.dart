import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final Function ontap;
  final String buttonTitle;
  BottomButton({@required this.ontap,@required this.buttonTitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerSize,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
            child: Text(
              buttonTitle,
              style: kLargeButtonStyle,
            )),
      ),
    );
  }
}
