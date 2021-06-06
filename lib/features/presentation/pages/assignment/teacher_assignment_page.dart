import 'package:teacher/features/domain/entities/assignment.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class TeacherAssignmentPage extends StatefulWidget {
  final Assignment _assignment;
  TeacherAssignmentPage({Key? key, required Assignment assignment})
      : _assignment = assignment,
        super(key: key);

  @override
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<TeacherAssignmentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "${widget._assignment.title.trim().toUpperCase()}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
