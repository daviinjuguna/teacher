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
import 'package:teacher/features/domain/entities/user.dart';
import 'package:teacher/features/presentation/bloc/clear_prefs/clear_prefs_bloc.dart';
import 'package:teacher/features/presentation/bloc/create_course/create_course_bloc.dart';
import 'package:teacher/features/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:teacher/features/presentation/bloc/get_recent_searches/get_recent_cubit.dart';
import 'package:teacher/features/presentation/bloc/save_recent_searches/save_recent_cubit.dart';
import 'package:teacher/features/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:teacher/features/presentation/bloc/user/user_bloc.dart';
import 'package:teacher/features/presentation/components/bottom_error.dart';
import 'package:teacher/features/presentation/components/bottom_loader.dart';
import 'package:teacher/features/presentation/components/refresh_widget.dart';

import 'widgets/add_course_widget.dart';
import 'widgets/home_shimmer.dart';
import 'widgets/search_course.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({Key? key}) : super(key: key);

  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  KtList<Course> _course = new KtList.empty();
  late final _dashboardBloc = getIt<DashboardBloc>();
  late final _createCourseBloc = getIt<CreateCourseBloc>();
  late final _userBloc = getIt<UserBloc>();
  late final _saveRecentCubit = getIt<SaveRecentCubit>();
  late final _getRecentCubit = getIt<GetRecentCubit>();
  late final _scrollController = ScrollController();
  int _currentPage = 1;
  int _lastPage = 1;
  bool _isUpdating = false;
  bool _paginatedError = false;

  User? _user;

  Completer<void> _refreshCompleter = Completer<void>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _scrollController.addListener(_onsCroll);
      _dashboardBloc.add(DashboardEvent.getCourse(page: 1));
      _userBloc.add(UserEvent.started());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _dashboardBloc.close();
    _createCourseBloc.close();
    _userBloc.close();
    _saveRecentCubit.close();
    _getRecentCubit.close();
    _scrollController.dispose();

    // _title.dispose();
    // _description.dispose();
  }

  void _onsCroll() {
    late final _maxScroll = _scrollController.position.maxScrollExtent;
    late final _currentScroll = _scrollController.position.pixels;
    if (_currentScroll == _maxScroll) {
      if (_currentPage < _lastPage) {
        _isUpdating = true;
        _dashboardBloc.add(
          DashboardEvent.getCoursePaginate(
            page: _currentPage + 1,
            course: _course.asList(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _dashboardBloc),
        BlocProvider(create: (create) => _createCourseBloc),
        BlocProvider(create: (create) => _userBloc),
        BlocProvider(create: (create) => _saveRecentCubit),
        BlocProvider(create: (create) => _getRecentCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                success: (state) {
                  _user = state.user;
                },
              );
            },
          ),
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
                      .add(DashboardEvent.update(course: _course));
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
            },
          ),
          BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                loggedOut: (state) {
                  context.router.replace(LoginRoute());
                },
                success: (state) {
                  ScaffoldMessenger.maybeOf(context)?..hideCurrentSnackBar();
                },
                loading: (state) {
                  ScaffoldMessenger.maybeOf(context)
                    ?..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        backgroundColor: kBlackColor,
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
                              "${state.message}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            // SizedBox(height: 3),
                          ],
                        ),
                      ),
                    );
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
                  }
                },
              );
            },
          ),
          BlocListener<DashboardBloc, DashboardState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                initial: (state) {
                  _paginatedError = false;
                },
                paginating: (state) {
                  _isUpdating = true;
                },
                success: (state) {
                  _isUpdating = false;
                  _refreshCompleter.complete();
                  _refreshCompleter = Completer();
                  _currentPage = state.currentPage;
                  _lastPage = state.lastPage;
                  _course = state.course;
                  print("LAST PAGE:${state.lastPage}");
                  print("CURRENT PAGE:${state.currentPage}");
                  // print(
                  //     "CURRENT PAGE: ${state.course.asList().last.currentPage}");
                  // print("LAST PAGE: ${state.course.asList().last.lastPage}");

                  ScaffoldMessenger.maybeOf(context)?..hideCurrentSnackBar();
                },
                paginatedError: (state) {
                  _paginatedError = true;
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
            leading: Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () => Scaffold.maybeOf(context)?.openDrawer(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 5,
                      child: ClipOval(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: SvgPicture.asset(
                          "assets/icons/cap_yellow.svg",
                          color: kYellowColor,
                          fit: BoxFit.contain,
                          colorBlendMode: BlendMode.dstATop,
                          // clipBehavior: Clip.antiAliasWithSaveLayer,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              "TEACHER CENTER",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () => showSearch<Course?>(
                    context: context,
                    delegate: SearchCourse(
                      saveRecentCubit: _saveRecentCubit,
                      dashboardBloc: _dashboardBloc,
                      searchFieldLabel: "Search Course",
                      getRecentCubit: _getRecentCubit,
                    )).then((course) {
                  if (course != null) {
                    AutoRouter.of(context)
                        .push(TeacherCourseRoute(course: course));
                  }
                  _dashboardBloc.add(DashboardEvent.update(course: _course));
                }).catchError((e, s) {
                  print("SEARCH DELEGATE ERROR: $e,$s");
                }),
              )
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
          //!Drawer
          drawer: Drawer(
            child: Container(
              color: kBlackColor,
              child: SafeArea(
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    return Column(
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
                          "TEACHER ${_user?.name.toUpperCase() ?? ""}",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${_user?.email ?? ""}",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        MaterialButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (builder) => AlertDialog(
                              title: Text("LOGOUT"),
                              content: Text("Are you sure you want to logout?"),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(null),
                                  child: Text(
                                    "CANCEL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.4,
                                      color: kBlackColor,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: Text(
                                    "LOGOUT",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.4,
                                      color: kBlackColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ).then((value) {
                            if (value != null && value) {
                              context
                                  .read<SplashBloc>()
                                  .add(SplashEvent.loggout());
                            }
                          }).catchError((e, s) {
                            print("LOGOUT ERROR: $e,$s");
                          }),
                          color: Colors.yellow,
                          child: Text(
                            "LOGOUT",
                            style: TextStyle(color: kBlackColor),
                          ),
                        )
                      ],
                    );
                  },
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
                return RefreshWidget(
                  onRefresh: () {
                    _dashboardBloc.add(DashboardEvent.update(course: _course));
                    return _refreshCompleter.future;
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.only(bottom: 35),
                    physics: AlwaysScrollableScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: _course.size + 1,
                    itemBuilder: (context, index) => index == _course.size
                        ? _isUpdating
                            ? BottomLoader()
                            : _paginatedError
                                ? BottomError(
                                    onRefresh: () => _dashboardBloc.add(
                                        DashboardEvent.getCoursePaginate(
                                            course: _course.asList(),
                                            page: _currentPage)))
                                : Opacity(opacity: 0)
                        // ? BottomError(onRefresh: () {})
                        : Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            child: Column(
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    minHeight: 200,
                                    maxHeight: 300,
                                  ),
                                  width: double.infinity,
                                  child: Image.network(
                                    "$FILE_URL${_course[index].photo}",
                                    fit: BoxFit.fill,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              kBlackColor),
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder:
                                        (context, exception, stackTrace) {
                                      // Appropriate logging or analytics, e.g.
                                      print(
                                        'An error occurred loading "$FILE_URL${_course[index].photo}": ' +
                                            "$exception, " +
                                            "$stackTrace",
                                      );
                                      return Image.asset(
                                        "assets/images/flutter.jpeg",
                                        fit: BoxFit.fill,
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${_course[index].title}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${_course[index].desc}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Students Applied: ${_course[index].appCount}",
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
                                                "VIEW",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: 1.4,
                                                ),
                                              ),
                                            ),
                                            onPressed: () =>
                                                AutoRouter.of(context).push(
                                                    TeacherCourseRoute(
                                                        course:
                                                            _course[index])),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (builder) =>
                                                      AddCourseWidget(
                                                    title: "EDIT COURSE",
                                                    initDesc:
                                                        _course[index].desc,
                                                    initPic:
                                                        _course[index].photo,
                                                    initTitle:
                                                        _course[index].title,
                                                  ),
                                                )
                                                    .then(
                                                  (value) => {
                                                    //*checks results of the dialogue
                                                    if (value != null)
                                                      {
                                                        print(
                                                            "TITLE: ${value.title}"),
                                                        print(
                                                            "TEXT: ${value.desc}"),
                                                        print(
                                                            "IMAGE: ${value.imgUrl}"),
                                                        _createCourseBloc.add(
                                                            CreateCourseEvent
                                                                .edit(
                                                          courseId:
                                                              _course[index].id,
                                                          title: value.title,
                                                          description:
                                                              value.desc,
                                                          photo: value.imgUrl,
                                                        ))
                                                      }
                                                  },
                                                )
                                                    .catchError((e, s) {
                                                  print(
                                                      "EDIT COURSE ERROR: $e,$s");
                                                }),
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.delete),
                                                color: Colors.red,
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (builder) =>
                                                      AlertDialog(
                                                    title:
                                                        Text("DELETE COURSE"),
                                                    content: Text(
                                                        "Are you sure you want to delete course?"),
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
                                                              color: Colors.red,
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
                                                                FontWeight.w800,
                                                            letterSpacing: 1.4,
                                                            color: Colors.green,
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
                                                              _createCourseBloc
                                                                  .add(
                                                                CreateCourseEvent.delete(
                                                                    courseId:
                                                                        _course[index]
                                                                            .id),
                                                              )
                                                            }
                                                        })
                                                    .catchError((e, s) {
                                                  print(
                                                      "DELETE DIALOGUE ERROR: $e,$s");
                                                }),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
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
