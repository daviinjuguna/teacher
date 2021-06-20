import 'package:flutter/material.dart';
import 'package:teacher/core/util/constant.dart';

class BottomError extends StatelessWidget {
  const BottomError({Key? key, required VoidCallback onRefresh})
      : _onRefresh = onRefresh,
        super(key: key);
  final VoidCallback _onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: SizedBox(
          height: 30,
          width: 24,
          child: IconButton(
            iconSize: 28,
            color: kBlackColor,
            icon: Icon(Icons.refresh),
            onPressed: _onRefresh,
          ),
        ),
      ),
    );
  }
}
