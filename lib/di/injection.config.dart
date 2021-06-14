// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:battery/battery.dart' as _i5;
import 'package:connectivity_plus/connectivity_plus.dart' as _i7;
import 'package:file_picker/file_picker.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../core/util/handle_call.dart' as _i11;
import '../database/app_database.dart' as _i3;
import '../database/assignment/assignment_dao.dart' as _i4;
import '../database/choice/choice_dao.dart' as _i6;
import '../database/course/course_dao.dart' as _i9;
import '../database/pdf/pdf_dao.dart' as _i13;
import '../database/question/question_dao.dart' as _i14;
import '../database/user/user_dao.dart' as _i17;
import '../features/data/datasourse/api/teacher_api.dart' as _i16;
import '../features/data/datasourse/file/file_data_source.dart' as _i18;
import '../features/data/datasourse/file/url_to_file.dart' as _i22;
import '../features/data/datasourse/image/image_data_source.dart' as _i19;
import '../features/data/datasourse/local/local_data_source.dart' as _i20;
import '../features/data/datasourse/network/connectivity_checker.dart' as _i8;
import '../features/data/datasourse/remote/remote_data_sorce.dart' as _i21;
import '../features/data/repository/eshule_repository_impl.dart' as _i24;
import '../features/domain/repository/eshule_repository.dart' as _i23;
import '../features/domain/usecase/common/check_auth.dart' as _i33;
import '../features/domain/usecase/common/check_battery.dart' as _i34;
import '../features/domain/usecase/common/check_connection.dart' as _i35;
import '../features/domain/usecase/common/clear_prefs.dart' as _i36;
import '../features/domain/usecase/common/get_assignment.dart' as _i53;
import '../features/domain/usecase/common/get_choice.dart' as _i55;
import '../features/domain/usecase/common/get_course.dart' as _i57;
import '../features/domain/usecase/common/get_file_from_url.dart' as _i58;
import '../features/domain/usecase/common/get_pdf.dart' as _i59;
import '../features/domain/usecase/common/get_question.dart' as _i61;
import '../features/domain/usecase/common/get_recent_search.dart' as _i63;
import '../features/domain/usecase/common/get_user.dart' as _i64;
import '../features/domain/usecase/common/login.dart' as _i65;
import '../features/domain/usecase/common/logout.dart' as _i66;
import '../features/domain/usecase/common/pick_file.dart' as _i68;
import '../features/domain/usecase/common/pick_image.dart' as _i69;
import '../features/domain/usecase/common/pick_multiple_file.dart' as _i70;
import '../features/domain/usecase/common/refresh_token.dart' as _i72;
import '../features/domain/usecase/common/register.dart' as _i73;
import '../features/domain/usecase/common/save_to_resent.dart' as _i25;
import '../features/domain/usecase/common/update_assignment.dart' as _i28;
import '../features/domain/usecase/common/update_choice.dart' as _i29;
import '../features/domain/usecase/common/update_course.dart' as _i30;
import '../features/domain/usecase/common/update_pdf.dart' as _i31;
import '../features/domain/usecase/common/update_question.dart' as _i32;
import '../features/domain/usecase/teacher/create_assignment.dart' as _i38;
import '../features/domain/usecase/teacher/create_choice.dart' as _i39;
import '../features/domain/usecase/teacher/create_course.dart' as _i40;
import '../features/domain/usecase/teacher/create_pdf.dart' as _i41;
import '../features/domain/usecase/teacher/create_question.dart' as _i42;
import '../features/domain/usecase/teacher/delete_assigment.dart' as _i43;
import '../features/domain/usecase/teacher/delete_choice.dart' as _i44;
import '../features/domain/usecase/teacher/delete_course.dart' as _i45;
import '../features/domain/usecase/teacher/delete_pdf.dart' as _i46;
import '../features/domain/usecase/teacher/delete_question.dart' as _i47;
import '../features/domain/usecase/teacher/edit_assignment.dart' as _i48;
import '../features/domain/usecase/teacher/edit_choice.dart' as _i49;
import '../features/domain/usecase/teacher/edit_course.dart' as _i50;
import '../features/domain/usecase/teacher/edit_pdf.dart' as _i51;
import '../features/domain/usecase/teacher/edit_question.dart' as _i52;
import '../features/domain/usecase/teacher/set_answer.dart' as _i26;
import '../features/domain/usecase/teacher/sort_choice.dart' as _i27;
import '../features/presentation/bloc/auth/auth_bloc.dart' as _i77;
import '../features/presentation/bloc/battery/battery_bloc.dart' as _i78;
import '../features/presentation/bloc/clear_prefs/clear_prefs_bloc.dart'
    as _i37;
import '../features/presentation/bloc/create_assignment/create_assignment_bloc.dart'
    as _i79;
import '../features/presentation/bloc/create_choice/create_choice_bloc.dart'
    as _i80;
import '../features/presentation/bloc/create_course/create_course_bloc.dart'
    as _i81;
import '../features/presentation/bloc/create_pdf/create_pdf_bloc.dart' as _i82;
import '../features/presentation/bloc/create_question/create_question_bloc.dart'
    as _i83;
import '../features/presentation/bloc/dashboard/dashboard_bloc.dart' as _i84;
import '../features/presentation/bloc/file_to_url/file_from_url_bloc.dart'
    as _i85;
import '../features/presentation/bloc/get_assignment/get_assignment_bloc.dart'
    as _i54;
import '../features/presentation/bloc/get_choice/get_choice_bloc.dart' as _i56;
import '../features/presentation/bloc/get_pdf/get_pdf_bloc.dart' as _i60;
import '../features/presentation/bloc/get_question/get_question_bloc.dart'
    as _i62;
import '../features/presentation/bloc/get_recent_searches/get_recent_cubit.dart'
    as _i86;
import '../features/presentation/bloc/network/ntwork_bloc.dart' as _i67;
import '../features/presentation/bloc/picker/picker_bloc.dart' as _i71;
import '../features/presentation/bloc/save_recent_searches/save_recent_cubit.dart'
    as _i74;
import '../features/presentation/bloc/splash_bloc/splash_bloc.dart' as _i75;
import '../features/presentation/bloc/user/user_bloc.dart' as _i76;
import 'module_injection.dart' as _i87; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectionModules = _$InjectionModules();
  gh.lazySingleton<_i3.AppDatabase>(() => _i3.AppDatabase());
  gh.lazySingleton<_i4.AssignmentDao>(
      () => _i4.AssignmentDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i5.Battery>(() => injectionModules.battery);
  gh.lazySingleton<_i6.ChoiceDao>(() => _i6.ChoiceDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i7.Connectivity>(() => injectionModules.connectivity);
  gh.lazySingleton<_i8.ConnectivityChecker>(() => _i8.ConnectivityCheckerImp());
  gh.lazySingleton<_i9.CourseDao>(() => _i9.CourseDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i10.FilePicker>(() => injectionModules.filePicker);
  gh.lazySingleton<_i11.HandleNetworkCall>(() => _i11.HandleNetworkCall());
  gh.lazySingleton<_i12.ImagePicker>(() => injectionModules.imagePicker);
  gh.lazySingleton<_i13.PdfDao>(() => _i13.PdfDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i14.QuestionDao>(
      () => _i14.QuestionDao(get<_i3.AppDatabase>()));
  await gh.factoryAsync<_i15.SharedPreferences>(() => injectionModules.prefs,
      preResolve: true);
  gh.lazySingleton<_i16.TeacherService>(() => _i16.TeacherApiImpl());
  gh.lazySingleton<_i17.UserDao>(() => _i17.UserDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i18.FileDataSource>(
      () => _i18.FileDataSourceImpl(get<_i10.FilePicker>()));
  gh.lazySingleton<_i19.ImageDataSource>(
      () => _i19.ImageDataSourceImpl(imagePicker: get<_i12.ImagePicker>()));
  gh.lazySingleton<_i20.LocalDataSource>(() => _i20.LocalDataSourceImpl(
      get<_i15.SharedPreferences>(),
      get<_i9.CourseDao>(),
      get<_i13.PdfDao>(),
      get<_i4.AssignmentDao>(),
      get<_i6.ChoiceDao>(),
      get<_i14.QuestionDao>(),
      get<_i17.UserDao>()));
  gh.lazySingleton<_i21.RemoteDataSource>(() => _i21.RemoteDataSourceImpl(
      get<_i16.TeacherService>(), get<_i11.HandleNetworkCall>()));
  gh.lazySingleton<_i22.UrlToFile>(
      () => _i22.UrlToFileImp(get<_i21.RemoteDataSource>()));
  gh.lazySingleton<_i23.Repository>(() => _i24.RepositoryImpl(
      get<_i20.LocalDataSource>(),
      get<_i21.RemoteDataSource>(),
      get<_i7.Connectivity>(),
      get<_i18.FileDataSource>(),
      get<_i19.ImageDataSource>(),
      get<_i5.Battery>(),
      get<_i22.UrlToFile>()));
  gh.lazySingleton<_i25.SaveToRecent>(
      () => _i25.SaveToRecent(get<_i23.Repository>()));
  gh.lazySingleton<_i26.SetAnswer>(
      () => _i26.SetAnswer(get<_i23.Repository>()));
  gh.lazySingleton<_i27.SortChoice>(
      () => _i27.SortChoice(get<_i23.Repository>()));
  gh.lazySingleton<_i28.UpdateAssignment>(
      () => _i28.UpdateAssignment(get<_i23.Repository>()));
  gh.lazySingleton<_i29.UpdateChoice>(
      () => _i29.UpdateChoice(get<_i23.Repository>()));
  gh.lazySingleton<_i30.UpdateCourse>(
      () => _i30.UpdateCourse(get<_i23.Repository>()));
  gh.lazySingleton<_i31.UpdatePdf>(
      () => _i31.UpdatePdf(get<_i23.Repository>()));
  gh.lazySingleton<_i32.UpdateQuestion>(
      () => _i32.UpdateQuestion(get<_i23.Repository>()));
  gh.lazySingleton<_i33.CheckAuth>(
      () => _i33.CheckAuth(get<_i23.Repository>()));
  gh.lazySingleton<_i34.CheckBattery>(
      () => _i34.CheckBattery(get<_i23.Repository>()));
  gh.lazySingleton<_i35.CheckConnection>(
      () => _i35.CheckConnection(get<_i23.Repository>()));
  gh.lazySingleton<_i36.ClearPrefs>(
      () => _i36.ClearPrefs(get<_i23.Repository>()));
  gh.factory<_i37.ClearPrefsBloc>(
      () => _i37.ClearPrefsBloc(get<_i36.ClearPrefs>()));
  gh.lazySingleton<_i38.CreateAssignment>(
      () => _i38.CreateAssignment(get<_i23.Repository>()));
  gh.lazySingleton<_i39.CreateChoice>(
      () => _i39.CreateChoice(get<_i23.Repository>()));
  gh.lazySingleton<_i40.CreateCourse>(
      () => _i40.CreateCourse(get<_i23.Repository>()));
  gh.lazySingleton<_i41.CreatePdf>(
      () => _i41.CreatePdf(get<_i23.Repository>()));
  gh.lazySingleton<_i42.CreateQuestion>(
      () => _i42.CreateQuestion(get<_i23.Repository>()));
  gh.lazySingleton<_i43.DeleteAssignment>(
      () => _i43.DeleteAssignment(get<_i23.Repository>()));
  gh.lazySingleton<_i44.DeleteChoice>(
      () => _i44.DeleteChoice(get<_i23.Repository>()));
  gh.lazySingleton<_i45.DeleteCourse>(
      () => _i45.DeleteCourse(get<_i23.Repository>()));
  gh.lazySingleton<_i46.DeletePdf>(
      () => _i46.DeletePdf(get<_i23.Repository>()));
  gh.lazySingleton<_i47.DeleteQuestion>(
      () => _i47.DeleteQuestion(get<_i23.Repository>()));
  gh.lazySingleton<_i48.EditAssignment>(
      () => _i48.EditAssignment(get<_i23.Repository>()));
  gh.lazySingleton<_i49.EditChoice>(
      () => _i49.EditChoice(get<_i23.Repository>()));
  gh.lazySingleton<_i50.EditCourse>(
      () => _i50.EditCourse(get<_i23.Repository>()));
  gh.lazySingleton<_i51.EditPdf>(() => _i51.EditPdf(get<_i23.Repository>()));
  gh.lazySingleton<_i52.EditQuestion>(
      () => _i52.EditQuestion(get<_i23.Repository>()));
  gh.lazySingleton<_i53.GetAssignment>(
      () => _i53.GetAssignment(get<_i23.Repository>()));
  gh.factory<_i54.GetAssignmentBloc>(() => _i54.GetAssignmentBloc(
      get<_i53.GetAssignment>(), get<_i28.UpdateAssignment>()));
  gh.lazySingleton<_i55.GetChoice>(
      () => _i55.GetChoice(get<_i23.Repository>()));
  gh.factory<_i56.GetChoiceBloc>(() => _i56.GetChoiceBloc(
      get<_i55.GetChoice>(), get<_i27.SortChoice>(), get<_i29.UpdateChoice>()));
  gh.lazySingleton<_i57.GetCourse>(
      () => _i57.GetCourse(get<_i23.Repository>()));
  gh.lazySingleton<_i58.GetFileFromUrl>(
      () => _i58.GetFileFromUrl(get<_i23.Repository>()));
  gh.lazySingleton<_i59.GetPdf>(() => _i59.GetPdf(get<_i23.Repository>()));
  gh.factory<_i60.GetPdfBloc>(
      () => _i60.GetPdfBloc(get<_i59.GetPdf>(), get<_i31.UpdatePdf>()));
  gh.lazySingleton<_i61.GetQuestion>(
      () => _i61.GetQuestion(get<_i23.Repository>()));
  gh.factory<_i62.GetQuestionBloc>(() => _i62.GetQuestionBloc(
      get<_i61.GetQuestion>(), get<_i32.UpdateQuestion>()));
  gh.lazySingleton<_i63.GetRecentSearch>(
      () => _i63.GetRecentSearch(get<_i23.Repository>()));
  gh.lazySingleton<_i64.GetUser>(() => _i64.GetUser(get<_i23.Repository>()));
  gh.lazySingleton<_i65.Login>(() => _i65.Login(get<_i23.Repository>()));
  gh.lazySingleton<_i66.Logout>(() => _i66.Logout(get<_i23.Repository>()));
  gh.factory<_i67.NtworkBloc>(
      () => _i67.NtworkBloc(get<_i35.CheckConnection>()));
  gh.lazySingleton<_i68.PickFile>(() => _i68.PickFile(get<_i23.Repository>()));
  gh.lazySingleton<_i69.PickImage>(
      () => _i69.PickImage(get<_i23.Repository>()));
  gh.lazySingleton<_i70.PickMultipleFile>(
      () => _i70.PickMultipleFile(get<_i23.Repository>()));
  gh.factory<_i71.PickerBloc>(
      () => _i71.PickerBloc(get<_i69.PickImage>(), get<_i68.PickFile>()));
  gh.lazySingleton<_i72.RefreshToken>(
      () => _i72.RefreshToken(get<_i23.Repository>()));
  gh.lazySingleton<_i73.Register>(() => _i73.Register(get<_i23.Repository>()));
  gh.factory<_i74.SaveRecentCubit>(
      () => _i74.SaveRecentCubit(get<_i25.SaveToRecent>()));
  gh.factory<_i75.SplashBloc>(() => _i75.SplashBloc(
      get<_i33.CheckAuth>(), get<_i66.Logout>(), get<_i72.RefreshToken>()));
  gh.factory<_i76.UserBloc>(() => _i76.UserBloc(get<_i64.GetUser>()));
  gh.factory<_i77.AuthBloc>(
      () => _i77.AuthBloc(get<_i65.Login>(), get<_i73.Register>()));
  gh.factory<_i78.BatteryBloc>(
      () => _i78.BatteryBloc(get<_i34.CheckBattery>()));
  gh.factory<_i79.CreateAssignmentBloc>(() => _i79.CreateAssignmentBloc(
      get<_i38.CreateAssignment>(),
      get<_i48.EditAssignment>(),
      get<_i43.DeleteAssignment>()));
  gh.factory<_i80.CreateChoiceBloc>(() => _i80.CreateChoiceBloc(
      get<_i39.CreateChoice>(),
      get<_i49.EditChoice>(),
      get<_i44.DeleteChoice>(),
      get<_i26.SetAnswer>()));
  gh.factory<_i81.CreateCourseBloc>(() => _i81.CreateCourseBloc(
      get<_i40.CreateCourse>(),
      get<_i50.EditCourse>(),
      get<_i45.DeleteCourse>()));
  gh.factory<_i82.CreatePdfBloc>(() => _i82.CreatePdfBloc(
      get<_i41.CreatePdf>(), get<_i51.EditPdf>(), get<_i46.DeletePdf>()));
  gh.factory<_i83.CreateQuestionBloc>(() => _i83.CreateQuestionBloc(
      get<_i42.CreateQuestion>(),
      get<_i52.EditQuestion>(),
      get<_i47.DeleteQuestion>()));
  gh.factory<_i84.DashboardBloc>(() =>
      _i84.DashboardBloc(get<_i57.GetCourse>(), get<_i30.UpdateCourse>()));
  gh.factory<_i85.FileFromUrlBloc>(
      () => _i85.FileFromUrlBloc(get<_i58.GetFileFromUrl>()));
  gh.factory<_i86.GetRecentCubit>(
      () => _i86.GetRecentCubit(get<_i63.GetRecentSearch>()));
  return get;
}

class _$InjectionModules extends _i87.InjectionModules {}
