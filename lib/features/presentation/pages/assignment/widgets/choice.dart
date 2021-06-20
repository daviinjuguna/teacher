import 'package:flutter/material.dart';
import 'package:teacher/core/util/constant.dart';

class ChoiceCard extends StatelessWidget {
  final VoidCallback press;
  final String name;
  final bool correct;
  final VoidCallback delete;
  final VoidCallback edit;

  const ChoiceCard({
    Key? key,
    required this.press,
    required this.name,
    required this.correct,
    required this.delete,
    required this.edit,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "$name",
              style: TextStyle(color: kBlackColor, fontSize: 16),
            ),
          ),
          InkWell(
            onTap: correct
                ? () {
                    ScaffoldMessenger.maybeOf(context)
                      ?..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.fixed,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          )),
                          content: Text(
                            "Hello!, Answer is already set 😆️",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              // fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      );
                  }
                : press,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: correct ? Colors.green : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: kBlackColor),
              ),
            ),
          ),
          IconButton(onPressed: edit, icon: Icon(Icons.edit)),
          IconButton(
            onPressed: correct
                ? () {
                    ScaffoldMessenger.maybeOf(context)
                      ?..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.fixed,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          )),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "NOP",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              // SizedBox(height: 3),
                              Text(
                                "You Cannot Delete The answer, Set a new Answer then Delete",
                                style: TextStyle(
                                  // fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                  }
                : delete,
            icon: Icon(Icons.delete),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
