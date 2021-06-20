import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';

import 'package:teacher/core/routes/app_router.gr.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:teacher/di/injection.dart';
import 'package:teacher/features/domain/entities/assignment.dart';
import 'package:teacher/features/domain/entities/question.dart';
import 'package:teacher/features/presentation/bloc/clear_prefs/clear_prefs_bloc.dart';
import 'package:teacher/features/presentation/bloc/create_choice/create_choice_bloc.dart';
import 'package:teacher/features/presentation/bloc/create_question/create_question_bloc.dart';
import 'package:teacher/features/presentation/bloc/get_question/get_question_bloc.dart';
import 'package:teacher/features/presentation/components/error_card.dart';
import 'package:teacher/features/presentation/components/refresh_widget.dart';
import 'package:teacher/features/presentation/pages/assignment/widgets/add_question_widget.dart';

import 'widgets/question_card.dart';

class TeacherAssignmentPage extends StatefulWidget {
  final Assignment _assignment;
  TeacherAssignmentPage({Key? key, required Assignment assignment})
      : _assignment = assignment,
        super(key: key);

  @override
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<TeacherAssignmentPage> {
  final _getQuestionBloc = getIt<GetQuestionBloc>();
  final _createQUestionBloc = getIt<CreateQuestionBloc>();
  final _createChoiceBloc = getIt<CreateChoiceBloc>();

  KtList<Question> _question = emptyList();
  Completer<void> _refreshCompleter = Completer();

  @override
  void initState() {
    super.initState();
    _getQuestionBloc.add(GetQuestionEvent.started(id: widget._assignment.id));
  }

  @override
  void dispose() {
    super.dispose();
    _getQuestionBloc.close();
    _createQUestionBloc.close();
    _createChoiceBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _getQuestionBloc),
        BlocProvider(create: (create) => _createQUestionBloc),
        BlocProvider(create: (create) => _createChoiceBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CreateChoiceBloc, CreateChoiceState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {
                  // ScaffoldMessenger.maybeOf(context)!..hideCurrentSnackBar();
                },
                success: (state) {
                  ScaffoldMessenger.maybeOf(context)!..hideCurrentSnackBar();
                  _getQuestionBloc
                      .add(GetQuestionEvent.update(id: widget._assignment.id));
                },
                error: (state) {
                  ScaffoldMessenger.maybeOf(context)!..hideCurrentSnackBar();
                },
              );
            },
          ),
          BlocListener<GetQuestionBloc, GetQuestionState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {
                  // ScaffoldMessenger.maybeOf(context)?..hideCurrentSnackBar();
                },
                updating: (s) {
                  ScaffoldMessenger.maybeOf(context)
                    ?..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        duration: Duration(minutes: 10),
                        backgroundColor: kBlackColor,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircularProgressIndicator.adaptive(),
                            Text(
                              "Updating...",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                },
                success: (state) {
                  _refreshCompleter.complete();
                  _refreshCompleter = Completer();
                  ScaffoldMessenger.maybeOf(context)?..hideCurrentSnackBar();
                  _question = state.question;
                },
                error: (state) {
                  _refreshCompleter.complete();
                  _refreshCompleter = Completer();
                  ScaffoldMessenger.maybeOf(context)?..hideCurrentSnackBar();
                  if (state.message == UNAUTHENTICATED_FAILURE_MESSAGE) {
                    //you will be thrown out asf
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
                              Text(state.message)
                            ],
                          ),
                        ),
                      );
                    Future.delayed(
                      const Duration(seconds: 3),
                      () async {
                        context
                            .read<ClearPrefsBloc>()
                            .add(ClearPrefsEvent.clearPrefs());
                        AutoRouter.of(context).replace(LoginRoute());
                      },
                    );
                  }
                },
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            centerTitle: true,
            title: Text(
              "${widget._assignment.title.trim().toUpperCase()}",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SafeArea(
            child: BlocBuilder<GetQuestionBloc, GetQuestionState>(
              builder: (context, state) {
                return state.maybeMap(
                  initial: (_) => Container(),
                  loading: (_) => Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(kBlackColor),
                    ),
                  ),
                  orElse: () {
                    return RefreshWidget(
                      onRefresh: () {
                        _getQuestionBloc.add(GetQuestionEvent.refresh(
                            id: widget._assignment.id));
                        return _refreshCompleter.future;
                      },
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        child: Column(
                          children: [
                            ListView.separated(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (c, i) => Column(
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: "Question ${i + 1}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(color: kBlackColor),
                                      children: [
                                        TextSpan(
                                          text: "/${_question.size}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(color: kBlackColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: QuestionCard(question: _question[i]),
                                  ),
                                ],
                              ),
                              separatorBuilder: (c, i) {
                                return SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: _question.size,
                            ),
                            Tooltip(
                              message: "Add New Question",
                              child: TextButton(
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (builder) => AddQuestionWidget(
                                    alertTitle: 'ADD QUESTION',
                                  ),
                                ).then((value) {
                                  if (value != null) {
                                    print(value);
                                    _createQUestionBloc
                                        .add(CreateQuestionEvent.create(
                                      assignmentId: widget._assignment.id,
                                      question: value.question,
                                      answer: value.answer,
                                    ));
                                  } else {
                                    print("NI KWA NEEMA");
                                  }
                                }).catchError((e, s) {
                                  print("ERROR ADD QUESTION $e,$s");
                                }),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: kBlackColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  error: (_) => ErrorCard(
                    retry: () => _getQuestionBloc.add(
                      GetQuestionEvent.started(id: widget._assignment.id),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
