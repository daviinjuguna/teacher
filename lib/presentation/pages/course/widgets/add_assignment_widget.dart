import 'package:flutter/material.dart';

class AddAssignmentWidget extends StatefulWidget {
  const AddAssignmentWidget({Key? key, String? initTitle})
      : _initTitle = initTitle,
        super(key: key);

  final String? _initTitle;
  @override
  _AddAssignmentWidgetState createState() => _AddAssignmentWidgetState();
}

class _AddAssignmentWidgetState extends State<AddAssignmentWidget> {
  TextEditingController _titleController = TextEditingController();

  String? _title;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget._initTitle);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("ADD ASSIGNMENT"),
      content: TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
        controller: _titleController,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.grey[200],
          filled: true,
          hintText: "Enter Title",
        ),
        onChanged: (value) {
          _title = value;
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(null),
          child: Text(
            "CANCEL",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              letterSpacing: 1.4,
              color: Colors.red,
            ),
          ),
        ),
        TextButton(
          onPressed: () => {
            if (_titleController.text.isEmpty)
              {
                ScaffoldMessenger.maybeOf(context)
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
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
                              "ERROR",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // SizedBox(height: 3),
                            Text("Fill all values")
                          ])))
              }
            else
              {Navigator.of(context).pop(_title)}
          },
          child: Text(
            "SUBMIT",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              letterSpacing: 1.4,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
