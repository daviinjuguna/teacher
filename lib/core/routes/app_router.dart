import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:teacher/presentation/components/pdf_view.dart';
import 'package:teacher/presentation/pages/auth/login_page.dart';
import 'package:teacher/presentation/pages/auth/register_page.dart';
import 'package:teacher/presentation/pages/core/splash.dart';
import 'package:teacher/presentation/pages/course/teacher_course_page.dart';
import 'package:teacher/presentation/pages/home/teacher_home.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    //*initials marks the first page
    AdaptiveRoute(page: SplashPage, initial: true),
    AdaptiveRoute(page: LoginPage, cupertinoPageTitle: "Login"),
    AdaptiveRoute(page: RegisterPage, cupertinoPageTitle: "Register"),
    AdaptiveRoute(page: PdfViewPage, cupertinoPageTitle: "PDF View"),

    //*teachers routes
    AdaptiveRoute(page: TeacherHomePage, cupertinoPageTitle: "Home"),
    AdaptiveRoute(page: TeacherCoursePage, cupertinoPageTitle: "course"),
  ],
)
class $AppRouter {}
