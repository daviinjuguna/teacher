import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kt_dart/kt.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher/core/routes/app_router.gr.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:teacher/di/injection.dart';
import 'package:teacher/features/domain/entities/course.dart';
import 'package:teacher/features/presentation/bloc/clear_prefs/clear_prefs_bloc.dart';
import 'package:teacher/features/presentation/bloc/create_course/create_course_bloc.dart';
import 'package:teacher/features/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:teacher/features/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:teacher/features/presentation/components/confirm_dialogue.dart';

import 'widgets/add_course_widget.dart';
import 'widgets/home_shimmer.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({Key? key}) : super(key: key);

  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

final _keyRefresh = GlobalKey<RefreshIndicatorState>();

class _TeacherHomePageState extends State<TeacherHomePage> {
  KtList<Course> course = new KtList.empty();
  final _dashboardBloc = getIt<DashboardBloc>();
  final _createCourseBloc = getIt<CreateCourseBloc>();
  Completer<void> _refreshCompleter = Completer<void>();

  @override
  void initState() {
    super.initState();

    _dashboardBloc.add(DashboardEvent.getCourse());
  }

  @override
  void dispose() {
    super.dispose();
    _dashboardBloc.close();
    _createCourseBloc.close();
    // _title.dispose();
    // _description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _dashboardBloc),
        BlocProvider(create: (create) => _createCourseBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CreateCourseBloc, CreateCourseState>(
              listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              loading: (state) {
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
                context
                    .read<DashboardBloc>()
                    .add(DashboardEvent.update(course: course));
                _showSnack(context);
              },
              error: (state) {
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
                  Future.delayed(const Duration(seconds: 3), () async {
                    context
                        .read<ClearPrefsBloc>()
                        .add(ClearPrefsEvent.clearPrefs());
                    context.router.replace(LoginRoute());
                  });
                } else {
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
                }
              },
            );
          }),
          BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                error: (state) {
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
                    Future.delayed(const Duration(seconds: 3), () async {
                      context
                          .read<ClearPrefsBloc>()
                          .add(ClearPrefsEvent.clearPrefs());
                      context.router.replace(LoginRoute());
                    });
                  }
                },
              );
            },
          ),
          BlocListener<DashboardBloc, DashboardState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                success: (state) {
                  _refreshCompleter.complete();
                  _refreshCompleter = Completer();

                  course = state.course;

                  ScaffoldMessenger.maybeOf(context)?..hideCurrentSnackBar();
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
                    Future.delayed(const Duration(seconds: 3), () async {
                      context
                          .read<ClearPrefsBloc>()
                          .add(ClearPrefsEvent.clearPrefs());
                      context.router.replace(LoginRoute());
                    });
                  }
                },
              );
            },
          ),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            // elevation: 0, //*elevation worship
            backgroundColor: kBlackColor,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              "TEACHER CENTER",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              PopupMenuButton(
                onSelected: (value) => {
                  if (value == 3)
                    {
                      showDialog(
                        context: context,
                        builder: (builder) => ConfirmDialogue(text: "Logout"),
                      )
                          .then((value) => {
                                if (value != null && value)
                                  {
                                    print("Logout Msee"),
                                  }
                              })
                          .catchError((e, s) {
                        print("LOGOUT DIALOGUE ERROE: $e,$s");
                      })
                    },
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text("Profile"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("Settings"),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Text("Log Out"),
                  ),
                ],
                child: Container(
                  height: 40,
                  width: 40,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/cap_yellow.svg",
                    color: kYellowColor,
                    fit: BoxFit.contain,
                    colorBlendMode: BlendMode.dstATop,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AddCourseWidget(
                title: 'ADD COURSE',
              ),
            )
                .then(
              (value) => {
                //*checks results of the dialogue
                if (value != null)
                  {
                    print("TITLE: ${value.title}"),
                    print("TEXT: ${value.desc}"),
                    print("IMAGE: ${value.imgUrl}"),
                    _createCourseBloc.add(CreateCourseEvent.started(
                      title: value.title,
                      description: value.desc,
                      photo: value.imgUrl,
                    ))
                  }
              },
            )
                .catchError((e, s) {
              print("CREATE COURSE ERROR: $e,$s");
            }),
            backgroundColor: kBlackColor,
            tooltip: "Add course",
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
          drawer: Drawer(
            child: Container(
              color: kBlackColor,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/cap_yellow.svg",
                        fit: BoxFit.contain,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "TEACHER DAVID",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "david@email.com",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
          body: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) => state.maybeMap(
              // initial: (_) => Container(),
              loading: (_) => ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return HomeShimmer();
                },
              ),
              orElse: () {
                // _keyRefresh.currentState?.;
                // course = state.course;
                return RefreshIndicator(
                  onRefresh: () {
                    _dashboardBloc.add(DashboardEvent.update(course: course));
                    return _refreshCompleter.future;
                  },
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: course.size,
                    itemBuilder: (context, index) => Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      child: Column(
                        children: [
                          Container(
                            constraints: BoxConstraints(minHeight: 200),
                            width: double.infinity,
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.fill,
                              placeholder: "assets/images/rsz_1cap_yellow.png",
                              image: "$FILE_URL${course[index].photo}",
                              imageErrorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                "assets/images/rsz_1cap_yellow.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Text(
                                  "${course[index].title}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${course[index].desc}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Students Applied: ${course[index].appCount}",
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MaterialButton(
                                      color: kYellowColor,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        width: 90,
                                        height: 30,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "EDIT",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: 1.4,
                                          ),
                                        ),
                                      ),
                                      onPressed: () => showDialog(
                                        context: context,
                                        builder: (builder) => AddCourseWidget(
                                          title: "EDIT COURSE",
                                          initDesc: course[index].desc,
                                          initPic: course[index].photo,
                                          initTitle: course[index].title,
                                        ),
                                      )
                                          .then(
                                        (value) => {
                                          //*checks results of the dialogue
                                          if (value != null)
                                            {
                                              print("TITLE: ${value.title}"),
                                              print("TEXT: ${value.desc}"),
                                              print("IMAGE: ${value.imgUrl}"),
                                              _createCourseBloc
                                                  .add(CreateCourseEvent.edit(
                                                courseId: course[index].id,
                                                title: value.title,
                                                description: value.desc,
                                                photo: value.imgUrl,
                                              ))
                                            }
                                        },
                                      )
                                          .catchError((e, s) {
                                        print("EDIT COURSE ERROR: $e,$s");
                                      }),
                                    ),
                                    MaterialButton(
                                      color: Colors.red,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        width: 90,
                                        height: 30,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "DELETE",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: 1.4,
                                          ),
                                        ),
                                      ),
                                      onPressed: () => showDialog(
                                        context: context,
                                        builder: (builder) => AlertDialog(
                                          title: Text("DELETE COURSE"),
                                          content: Text(
                                              "Are you sure you want to delete course?"),
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.of(context)
                                                        .pop(null),
                                                child: Text(
                                                  "NO",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    letterSpacing: 1.4,
                                                    color: Colors.red,
                                                  ),
                                                )),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(true),
                                              child: Text(
                                                "YES",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: 1.4,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                          .then((value) => {
                                                if (value != null && value)
                                                  {
                                                    _createCourseBloc.add(
                                                      CreateCourseEvent.delete(
                                                          courseId:
                                                              course[index].id),
                                                    )
                                                  }
                                              })
                                          .catchError((e, s) {
                                        print("DELETE DIALOGUE ERROR: $e,$s");
                                      }),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 5,
                            ),
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: MaterialButton(
                                color: kBlackColor,
                                child: Container(
                                  height: 30,
                                  width: double.infinity,
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
                                onPressed: () => AutoRouter.of(context).push(
                                    TeacherCourseRoute(course: course[index])),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              error: (_) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Card(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            // height: 100,
                            child: Lottie.asset(
                              "assets/lottie/sad_cloud.json",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Oh Snap",
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Something went wrong, Please try agait",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () => context
                              .read<DashboardBloc>()
                              .add(DashboardEvent.getCourse()),
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showSnack(BuildContext context) => ScaffoldMessenger.maybeOf(context)!
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
            "Updating...",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
  );
