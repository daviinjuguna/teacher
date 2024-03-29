import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:teacher/di/injection.dart';
import 'package:teacher/features/domain/entities/choice.dart';

import 'package:teacher/features/domain/entities/question.dart';
import 'package:teacher/features/presentation/bloc/create_choice/create_choice_bloc.dart';
import 'package:teacher/features/presentation/bloc/get_choice/get_choice_bloc.dart';

import 'add_choice_dialog.dart';
import 'choice.dart';

class QuestionCard extends StatefulWidget {
  final Question _question;
  const QuestionCard({Key? key, required Question question})
      : _question = question,
        super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  final _getChoiceBloc = getIt<GetChoiceBloc>();
  KtList<Choice> _choice = emptyList();
  @override
  void initState() {
    super.initState();
    _choice = widget._question.choices;
    // _getChoiceBloc.add(GetChoiceEvent.started(id: widget._question.id));
  }

  @override
  void dispose() {
    super.dispose();
    _getChoiceBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create) => _getChoiceBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CreateChoiceBloc, CreateChoiceState>(
            listener: (context, state) {
              state.maybeMap(
                error: (state) {
                  ScaffoldMessenger.maybeOf(context)!
                    ..hideCurrentSnackBar()
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
                              "OOPS! 😥️",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // SizedBox(height: 3),
                            Text(
                              "Something went wrong",
                              style: TextStyle(
                                // fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                },
                orElse: () {
                  // ScaffoldMessenger.maybeOf(context)!..hideCurrentSnackBar();
                },
                load: (state) {
                  ScaffoldMessenger.maybeOf(context)!
                    ..hideCurrentSnackBar()
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
                              "Loading...",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                },
                success: (state) {
                  ScaffoldMessenger.maybeOf(context)!..hideCurrentSnackBar();
                  _getChoiceBloc
                      .add(GetChoiceEvent.update(id: widget._question.id));
                },
              );
            },
          ),
          BlocListener<GetChoiceBloc, GetChoiceState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {
                  // ScaffoldMessenger.maybeOf(context)!..hideCurrentSnackBar();
                },
                success: (state) {
                  ScaffoldMessenger.maybeOf(context)?..hideCurrentSnackBar();
                  _choice = state.course;
                  ScaffoldMessenger.maybeOf(context)?..hideCurrentSnackBar();
                },
                error: (s) {
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
                              "OOPS! 😥️",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // SizedBox(height: 3),
                            Text(
                              "${s.message}",
                              style: TextStyle(
                                // fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                },
                sorting: (state) {
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
                              "Rearranging...",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                },
                updating: (state) {
                  // ScaffoldMessenger.maybeOf(context)
                  //   ?..hideCurrentSnackBar()
                  //   ..showSnackBar(
                  //     SnackBar(
                  //       duration: Duration(minutes: 10),
                  //       backgroundColor: kBlackColor,
                  //       padding: EdgeInsets.symmetric(horizontal: 20),
                  //       content: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           CircularProgressIndicator.adaptive(),
                  //           Text(
                  //             "Updating...",
                  //             style: TextStyle(color: Colors.white),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   );
                },
              );
            },
          ),
        ],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${widget._question.question}",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: kBlackColor, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            BlocBuilder<GetChoiceBloc, GetChoiceState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: _choice.size,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ChoiceCard(
                      correct: _choice[index] == widget._question.answer,
                      press: () => showDialog(
                        context: context,
                        builder: (builder) => AlertDialog(
                          title: Text("SET ANSWER"),
                          content: Text(
                            "Are you sure you want to set ${_choice[index].title} as answer?",
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
                              onPressed: () => Navigator.of(context).pop(true),
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
                        ),
                      ).then((value) {
                        if (value != null && value) {
                          context
                              .read<CreateChoiceBloc>()
                              .add(CreateChoiceEvent.setAnswer(
                                choiceId: _choice[index].id,
                                questionId: widget._question.id,
                              ));
                        }
                      }).catchError((e, s) {
                        print("ERROR SET ANSWER $e,$s");
                      }),
                      name: _choice[index].title,
                      delete: () => showDialog(
                        context: context,
                        builder: (builder) => AlertDialog(
                          title: Text("DELETE ANSWER"),
                          content: Text(
                            "Are you sure you want to delete ${_choice[index].title}?",
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
                              onPressed: () => Navigator.of(context).pop(true),
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
                        ),
                      ).then((value) {
                        if (value != null && value) {
                          context
                              .read<CreateChoiceBloc>()
                              .add(CreateChoiceEvent.delete(
                                choiceId: _choice[index].id,
                              ));
                        }
                      }).catchError((e, s) {
                        print("ERROR DELETE ANSWER $e,$s");
                      }),
                      edit: () => showDialog(
                        context: context,
                        builder: (builder) => AddChoiceDialog(
                          isAdd: false,
                          initTitle: _choice[index].title,
                        ),
                      ).then((value) {
                        if (value != null) {
                          context
                              .read<CreateChoiceBloc>()
                              .add(CreateChoiceEvent.edit(
                                choiceId: _choice[index].id,
                                title: value,
                              ));
                        }
                      }).catchError((e, s) {
                        print("ERROR EDIT ANSWER $e.$s");
                      }),
                    );
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _getChoiceBloc.add(
                          GetChoiceEvent.sort(questionId: widget._question.id));
                    },
                    child: Text("SORT")),
                ElevatedButton(
                    onPressed: () => showDialog(
                          context: context,
                          builder: (builder) => AddChoiceDialog(),
                        ).then((value) {
                          if (value != null) {
                            context.read<CreateChoiceBloc>().add(
                                CreateChoiceEvent.create(
                                    questionId: widget._question.id,
                                    title: value));
                          }
                          print(value);
                        }).catchError((e, s) {
                          print("ADD CHOICE ERROR: $e,$s");
                        }),
                    child: Text("ADD")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
