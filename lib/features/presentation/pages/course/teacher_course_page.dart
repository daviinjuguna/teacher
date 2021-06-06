import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:kt_dart/kt.dart';
import 'package:teacher/core/routes/app_router.gr.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:teacher/di/injection.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher/features/domain/entities/assignment.dart';
import 'package:teacher/features/domain/entities/course.dart';
import 'package:teacher/features/domain/entities/pdf.dart';
import 'package:teacher/features/presentation/bloc/clear_prefs/clear_prefs_bloc.dart';
import 'package:teacher/features/presentation/bloc/create_assignment/create_assignment_bloc.dart';
import 'package:teacher/features/presentation/bloc/create_pdf/create_pdf_bloc.dart';
import 'package:teacher/features/presentation/bloc/get_assignment/get_assignment_bloc.dart';
import 'package:teacher/features/presentation/bloc/get_pdf/get_pdf_bloc.dart';
import 'package:teacher/features/presentation/components/error_card.dart';

import 'widgets/add_assignment_widget.dart';
import 'widgets/add_pdf_widget.dart';

//* coursedetal//
class TeacherCoursePage extends StatefulWidget {
  final Course _course;

  const TeacherCoursePage({Key? key, required Course course})
      : _course = course,
        super(key: key);
  @override
  _TeacherCoursePageState createState() => _TeacherCoursePageState();
}

class _TeacherCoursePageState extends State<TeacherCoursePage> {
  final _pdfBloc = getIt<GetPdfBloc>();
  final _assignmentBloc = getIt<GetAssignmentBloc>();
  final _createAssignmentBloc = getIt<CreateAssignmentBloc>();
  final _createPdfBloc = getIt<CreatePdfBloc>();
  KtList<Pdf> pdf = KtList.empty();
  KtList<Assignment> ass = KtList.empty();
  Completer<void> _refreshCompleter = Completer<void>();
  @override
  void initState() {
    super.initState();
    _pdfBloc.add(GetPdfEvent.started(id: widget._course.id));
    _assignmentBloc.add(GetAssignmentEvent.started(id: widget._course.id));
  }

  @override
  void dispose() {
    super.dispose();
    _pdfBloc.close();
    _assignmentBloc.close();
    _createAssignmentBloc.close();
    _createPdfBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _pdfBloc),
        BlocProvider(create: (context) => _assignmentBloc),
        BlocProvider(create: (context) => _createPdfBloc),
        BlocProvider(create: (context) => _createAssignmentBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CreateAssignmentBloc, CreateAssignmentState>(
            listener: (context, state) {},
          ),
          BlocListener<CreatePdfBloc, CreatePdfState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                success: (value) {
                  ScaffoldMessenger.maybeOf(context)!..hideCurrentSnackBar();
                  _pdfBloc.add(GetPdfEvent.started(id: widget._course.id));
                },
                load: (value) {
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
                            CircularProgressIndicator.adaptive(
                              valueColor: AlwaysStoppedAnimation(kYellowColor),
                            ),
                            Text(
                              "Loading...",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                },
              );
            },
          ),
          BlocListener<GetPdfBloc, GetPdfState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                success: (state) {
                  _refreshCompleter.complete();
                  _refreshCompleter = Completer();
                  pdf = state.pdf;
                },
                error: (state) {
                  _refreshCompleter.complete();
                  _refreshCompleter = Completer();
                  ScaffoldMessenger.maybeOf(context)!..hideCurrentSnackBar();
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
                      () {
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
          BlocListener<GetAssignmentBloc, GetAssignmentState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                success: (state) {
                  _refreshCompleter.complete();
                  _refreshCompleter = Completer();
                  ass = state.assignment;
                },
                error: (state) {
                  _refreshCompleter.complete();
                  _refreshCompleter = Completer();
                  ScaffoldMessenger.maybeOf(context)!..hideCurrentSnackBar();
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
                        context.router.replace(LoginRoute());
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
            title: Text(
              "${widget._course.title.trim().toUpperCase()}",
              style: TextStyle(color: Colors.white),
            ),
            automaticallyImplyLeading: true,
            centerTitle: true,
          ),
          body: RefreshIndicator(
            onRefresh: () {
              _pdfBloc.add(GetPdfEvent.update(id: widget._course.id));
              _assignmentBloc
                  .add(GetAssignmentEvent.update(id: widget._course.id));
              return _refreshCompleter.future;
            },
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Container(
                // height: (height < 780) ? 780 : height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 0,
                      child: Container(
                        constraints: BoxConstraints(minHeight: height / 2),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              "LEARNING MATERIALS",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            BlocBuilder<GetPdfBloc, GetPdfState>(
                              builder: (context, state) {
                                return state.maybeMap(
                                  // initial: (_) => Container(),
                                  loading: (_) => Center(
                                    child: CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(kBlackColor),
                                    ),
                                  ),
                                  orElse: () {
                                    return ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${pdf[index].name}"),
                                            Row(
                                              children: [
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  color: kYellowColor,
                                                  icon: Icon(
                                                      Icons.picture_as_pdf),
                                                  onPressed: () =>
                                                      context.router.push(
                                                    PdfViewRoute(
                                                        pdf: pdf[index]),
                                                  ),
                                                ),
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  color: kBlackColor,
                                                  icon: Icon(Icons.edit),
                                                  onPressed: () => showDialog(
                                                    context: context,
                                                    builder: (builder) =>
                                                        AddPdfDialog(
                                                      isAdd: false,
                                                      initTitle:
                                                          pdf[index].name,
                                                      initPdf:
                                                          pdf[index].pdfDoc,
                                                    ),
                                                  )
                                                      .then((value) => {
                                                            if (value != null)
                                                              {
                                                                _createPdfBloc.add(
                                                                    CreatePdfEvent
                                                                        .edit(
                                                                  pdfId:
                                                                      pdf[index]
                                                                          .id,
                                                                  title: value
                                                                      .title,
                                                                  pdf:
                                                                      value.pdf,
                                                                ))
                                                              }
                                                            else
                                                              {
                                                                print(
                                                                    "Everything you put your hands GO UP!!")
                                                              }
                                                          })
                                                      .catchError((e, s) {
                                                    print(
                                                        "EDIT DOC ERROR: $e,$s");
                                                  }),
                                                ),
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  color: Colors.red,
                                                  icon: Icon(Icons.delete),
                                                  onPressed: () => showDialog(
                                                    context: context,
                                                    builder: (builder) =>
                                                        AlertDialog(
                                                      title: Text("DELETE PDF"),
                                                      content: Text(
                                                          "Are you sure you want to delete Pdf?"),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () =>
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(null),
                                                            child: Text(
                                                              "NO",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                letterSpacing:
                                                                    1.4,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            )),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(true),
                                                          child: Text(
                                                            "YES",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              letterSpacing:
                                                                  1.4,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                      .then((value) => {
                                                            if (value != null &&
                                                                value)
                                                              {
                                                                _createPdfBloc
                                                                    .add(
                                                                  CreatePdfEvent
                                                                      .delete(
                                                                    pdfId:
                                                                        pdf[index]
                                                                            .id,
                                                                  ),
                                                                )
                                                              }
                                                          })
                                                      .catchError((e, s) {
                                                    print(
                                                        "DELETE PDF ERROR: $e,$s");
                                                  }),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      separatorBuilder: (context, index) =>
                                          Divider(),
                                      itemCount: pdf.size,
                                    );
                                  },
                                  error: (state) => Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Oh Snap",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Something went wrong, Please try agait",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        MaterialButton(
                                          onPressed: () => _pdfBloc.add(
                                              GetPdfEvent.started(
                                                  id: widget._course.id)),
                                          color: kYellowColor,
                                          textColor: Colors.white,
                                          child: Text("RETRY"),
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Divider(),
                            MaterialButton(
                              color: kBlackColor,
                              onPressed: () => showDialog(
                                context: context,
                                builder: (builder) => AddPdfDialog(),
                              )
                                  .then((value) => {
                                        if (value != null)
                                          {
                                            _createPdfBloc
                                                .add(CreatePdfEvent.create(
                                              courseId: widget._course.id,
                                              title: value.title,
                                              pdf: value.pdf,
                                            ))
                                          }
                                        else
                                          {
                                            print(
                                                "Everything you put your hands GO UP!!")
                                          }
                                      })
                                  .catchError((e, s) {
                                print("ADD DOC ERROR: $e,$s");
                              }),
                              child: Text(
                                "ADD NEW DOCUMENT",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(minHeight: height / 2),
                        child: Column(
                          children: [
                            Text(
                              "ASSIGNMENTS",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            BlocBuilder<GetAssignmentBloc, GetAssignmentState>(
                              builder: (context, state) {
                                return state.maybeMap(
                                  loading: (_) => Center(
                                    child: CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(kBlackColor),
                                    ),
                                  ),
                                  orElse: () {
                                    return ListView.separated(
                                      //TODO fix scrolls
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${ass[index].title}"),
                                            MaterialButton(
                                              elevation: 0,
                                              color: kYellowColor,
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "VIEW",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w800,
                                                    letterSpacing: 1.4,
                                                  ),
                                                ),
                                              ),
                                              onPressed: () => {},
                                            ),
                                          ],
                                        ),
                                      ),
                                      separatorBuilder: (context, index) =>
                                          Divider(),
                                      itemCount: ass.size,
                                    );
                                  },
                                  error: (state) => ErrorCard(
                                    retry: () => _assignmentBloc.add(
                                        GetAssignmentEvent.started(
                                            id: widget._course.id)),
                                  ),
                                );
                              },
                            ),
                            //TODO implement Shimmer
                            Divider(),
                            MaterialButton(
                              color: kBlackColor,
                              onPressed: () => showDialog(
                                context: context,
                                builder: (builder) => AddAssignmentWidget(),
                              )
                                  .then((value) => {
                                        if (value != null)
                                          {}
                                        else
                                          {
                                            print(
                                                "Everything you put your hands GO WORK!!")
                                          }
                                      })
                                  .catchError((e, s) {
                                print("ADD ASS ERROR: $e,$s");
                              }),
                              child: Text(
                                "ADD NEW ASSIGNMENT",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
