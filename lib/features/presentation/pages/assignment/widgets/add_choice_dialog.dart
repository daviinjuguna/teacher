import 'package:flutter/material.dart';

class AddChoiceDialog extends StatefulWidget {
  final bool _isAdd;
  final String? _initTitle;
  const AddChoiceDialog({
    Key? key,
    bool isAdd = true,
    String? initTitle,
  })  : _isAdd = isAdd,
        _initTitle = initTitle,
        super(key: key);

  @override
  _AddChoiceDialogState createState() => _AddChoiceDialogState();
}

class _AddChoiceDialogState extends State<AddChoiceDialog> {
  TextEditingController _controller = TextEditingController();
  String? _title;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget._initTitle);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget._isAdd ? Text("ADD CHOICE") : Text("EDIT CHOICE"),
      content: TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        controller: _controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.grey[200],
          filled: true,
          hintText: "Title",
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
          onPressed: () {
            if (_controller.text.isEmpty) {
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
                          "ERROR",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // SizedBox(height: 3),
                        Text("Fill all values")
                      ],
                    ),
                  ),
                );
            } else {
              Navigator.of(context).pop(_title);
            }
          },
          child: Text(
            "SUBMIT",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              letterSpacing: 1.4,
              color: Colors.green,
            ),
          ),
        )
      ],
    );
  }
}
