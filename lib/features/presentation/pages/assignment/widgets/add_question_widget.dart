import 'package:flutter/material.dart';
import 'package:teacher/features/presentation/pages/assignment/widgets/add_question_object.dart';

class AddQuestionWidget extends StatefulWidget {
  final String _alertTitle;
  final String? _initQuestion;
  final String? _initAnswer;

  const AddQuestionWidget({
    Key? key,
    required String alertTitle,
    String? initQuestion,
    String? initAnswer,
  })  : _alertTitle = alertTitle,
        _initQuestion = initQuestion,
        _initAnswer = initAnswer,
        super(key: key);

  @override
  _AddQuestionWidgetState createState() => _AddQuestionWidgetState();
}

class _AddQuestionWidgetState extends State<AddQuestionWidget> {
  TextEditingController _questionController = TextEditingController();
  TextEditingController _answerController = TextEditingController();

  String? _question;
  String? _answer;

  @override
  void initState() {
    super.initState();
    _questionController = TextEditingController(text: widget._initQuestion);
    _answerController = TextEditingController(text: widget._initAnswer);
  }

  @override
  void dispose() {
    super.dispose();
    _questionController.dispose();
    _answerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("${widget._alertTitle}"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            controller: _questionController,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.grey[200],
              filled: true,
              hintText: "Question",
            ),
            onChanged: (value) {
              _question = value;
            },
          ),
          TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            controller: _answerController,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.grey[200],
              filled: true,
              hintText: "Answer",
            ),
            onChanged: (value) {
              _answer = value;
            },
          )
        ],
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
            if (_questionController.text.isEmpty ||
                _answerController.text.isEmpty) {
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
            } else if (_answer == null && _question == null) {
              Navigator.of(context).pop(null);
            } else {
              Navigator.of(context)
                  .pop(AddQuestionObject(question: _question, answer: _answer));
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
