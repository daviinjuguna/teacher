import 'package:flutter/material.dart';
import 'package:teacher/core/util/constant.dart';

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 10),
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation(kBlackColor),
            color: kYellowColor,
          ),
        ),
      ),
    );
  }
}
