// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'package:teacher/domain/entities/course.dart' as _i10;
import 'package:teacher/domain/entities/pdf.dart' as _i9;
import 'package:teacher/presentation/components/pdf_view.dart' as _i6;
import 'package:teacher/presentation/pages/auth/login_page.dart' as _i4;
import 'package:teacher/presentation/pages/auth/register_page.dart' as _i5;
import 'package:teacher/presentation/pages/core/splash.dart' as _i3;
import 'package:teacher/presentation/pages/course/teacher_course_page.dart'
    as _i8;
import 'package:teacher/presentation/pages/home/teacher_home.dart' as _i7;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashPage();
        }),
    LoginRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.LoginPage();
        },
        title: 'Login'),
    RegisterRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.RegisterPage();
        },
        title: 'Register'),
    PdfViewRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PdfViewRouteArgs>(
              orElse: () => const PdfViewRouteArgs());
          return _i6.PdfViewPage(
              key: args.key,
              pdf: args.pdf,
              fromUrl: args.fromUrl,
              path: args.path);
        },
        title: 'PDF View'),
    TeacherHomeRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.TeacherHomePage();
        },
        title: 'Home'),
    TeacherCourseRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<TeacherCourseRouteArgs>();
          return _i8.TeacherCoursePage(key: args.key, course: args.course);
        },
        title: 'course')
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i1.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i1.RouteConfig(PdfViewRoute.name, path: '/pdf-view-page'),
        _i1.RouteConfig(TeacherHomeRoute.name, path: '/teacher-home-page'),
        _i1.RouteConfig(TeacherCourseRoute.name, path: '/teacher-course-page')
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/login-page');

  static const String name = 'LoginRoute';
}

class RegisterRoute extends _i1.PageRouteInfo {
  const RegisterRoute() : super(name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

class PdfViewRoute extends _i1.PageRouteInfo<PdfViewRouteArgs> {
  PdfViewRoute({_i2.Key? key, _i9.Pdf? pdf, bool fromUrl = true, String? path})
      : super(name,
            path: '/pdf-view-page',
            args: PdfViewRouteArgs(
                key: key, pdf: pdf, fromUrl: fromUrl, path: path));

  static const String name = 'PdfViewRoute';
}

class PdfViewRouteArgs {
  const PdfViewRouteArgs({this.key, this.pdf, this.fromUrl = true, this.path});

  final _i2.Key? key;

  final _i9.Pdf? pdf;

  final bool fromUrl;

  final String? path;
}

class TeacherHomeRoute extends _i1.PageRouteInfo {
  const TeacherHomeRoute() : super(name, path: '/teacher-home-page');

  static const String name = 'TeacherHomeRoute';
}

class TeacherCourseRoute extends _i1.PageRouteInfo<TeacherCourseRouteArgs> {
  TeacherCourseRoute({_i2.Key? key, required _i10.Course course})
      : super(name,
            path: '/teacher-course-page',
            args: TeacherCourseRouteArgs(key: key, course: course));

  static const String name = 'TeacherCourseRoute';
}

class TeacherCourseRouteArgs {
  const TeacherCourseRouteArgs({this.key, required this.course});

  final _i2.Key? key;

  final _i10.Course course;
}
