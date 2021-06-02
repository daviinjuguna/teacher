// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:battery/battery.dart' as _i3;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:file_picker/file_picker.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../core/util/handle_call.dart' as _i7;
import '../data/datasourse/api/teacher_api.dart' as _i10;
import '../data/datasourse/file/file_data_source.dart' as _i11;
import '../data/datasourse/file/url_to_file.dart' as _i15;
import '../data/datasourse/image/image_data_source.dart' as _i12;
import '../data/datasourse/local/local_data_source.dart' as _i13;
import '../data/datasourse/network/connectivity_checker.dart' as _i5;
import '../data/datasourse/remote/remote_data_sorce.dart' as _i14;
import '../data/repository/eshule_repository_impl.dart' as _i17;
import '../domain/repository/eshule_repository.dart' as _i16;
import '../domain/usecase/common/check_auth.dart' as _i19;
import '../domain/usecase/common/check_battery.dart' as _i20;
import '../domain/usecase/common/check_connection.dart' as _i21;
import '../domain/usecase/common/clear_prefs.dart' as _i22;
import '../domain/usecase/common/get_assignment.dart' as _i39;
import '../domain/usecase/common/get_choice.dart' as _i41;
import '../domain/usecase/common/get_course.dart' as _i43;
import '../domain/usecase/common/get_file_from_url.dart' as _i44;
import '../domain/usecase/common/get_pdf.dart' as _i45;
import '../domain/usecase/common/get_question.dart' as _i47;
import '../domain/usecase/common/get_user.dart' as _i49;
import '../domain/usecase/common/login.dart' as _i50;
import '../domain/usecase/common/logout.dart' as _i51;
import '../domain/usecase/common/pick_file.dart' as _i53;
import '../domain/usecase/common/pick_image.dart' as _i54;
import '../domain/usecase/common/pick_multiple_file.dart' as _i55;
import '../domain/usecase/common/refresh_token.dart' as _i57;
import '../domain/usecase/common/register.dart' as _i58;
import '../domain/usecase/teacher/create_assignment.dart' as _i24;
import '../domain/usecase/teacher/create_choice.dart' as _i25;
import '../domain/usecase/teacher/create_course.dart' as _i26;
import '../domain/usecase/teacher/create_pdf.dart' as _i27;
import '../domain/usecase/teacher/create_question.dart' as _i28;
import '../domain/usecase/teacher/delete_assigment.dart' as _i29;
import '../domain/usecase/teacher/delete_choice.dart' as _i30;
import '../domain/usecase/teacher/delete_course.dart' as _i31;
import '../domain/usecase/teacher/delete_pdf.dart' as _i32;
import '../domain/usecase/teacher/delete_question.dart' as _i33;
import '../domain/usecase/teacher/edit_assignment.dart' as _i34;
import '../domain/usecase/teacher/edit_choice.dart' as _i35;
import '../domain/usecase/teacher/edit_course.dart' as _i36;
import '../domain/usecase/teacher/edit_pdf.dart' as _i37;
import '../domain/usecase/teacher/edit_question.dart' as _i38;
import '../domain/usecase/teacher/sort_choice.dart' as _i18;
import '../presentation/bloc/auth/auth_bloc.dart' as _i60;
import '../presentation/bloc/battery/battery_bloc.dart' as _i61;
import '../presentation/bloc/clear_prefs/clear_prefs_bloc.dart' as _i23;
import '../presentation/bloc/create_assignment/create_assignment_bloc.dart'
    as _i62;
import '../presentation/bloc/create_choice/create_choice_bloc.dart' as _i63;
import '../presentation/bloc/create_course/create_course_bloc.dart' as _i64;
import '../presentation/bloc/create_pdf/create_pdf_bloc.dart' as _i65;
import '../presentation/bloc/create_question/create_question_bloc.dart' as _i66;
import '../presentation/bloc/dashboard/dashboard_bloc.dart' as _i67;
import '../presentation/bloc/file_to_url/file_from_url_bloc.dart' as _i68;
import '../presentation/bloc/get_assignment/get_assignment_bloc.dart' as _i40;
import '../presentation/bloc/get_choice/get_choice_bloc.dart' as _i42;
import '../presentation/bloc/get_pdf/get_pdf_bloc.dart' as _i46;
import '../presentation/bloc/get_question/get_question_bloc.dart' as _i48;
import '../presentation/bloc/network/ntwork_bloc.dart' as _i52;
import '../presentation/bloc/picker/picker_bloc.dart' as _i56;
import '../presentation/bloc/splash_bloc/splash_bloc.dart' as _i59;
import 'module_injection.dart' as _i69; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectionModules = _$InjectionModules();
  gh.lazySingleton<_i3.Battery>(() => injectionModules.battery);
  gh.lazySingleton<_i4.Connectivity>(() => injectionModules.connectivity);
  gh.lazySingleton<_i5.ConnectivityChecker>(() => _i5.ConnectivityCheckerImp());
  gh.lazySingleton<_i6.FilePicker>(() => injectionModules.filePicker);
  gh.lazySingleton<_i7.HandleNetworkCall>(() => _i7.HandleNetworkCall());
  gh.lazySingleton<_i8.ImagePicker>(() => injectionModules.imagePicker);
  await gh.factoryAsync<_i9.SharedPreferences>(() => injectionModules.prefs,
      preResolve: true);
  gh.lazySingleton<_i10.TeacherService>(() => _i10.TeacherApiImpl());
  gh.lazySingleton<_i11.FileDataSource>(
      () => _i11.FileDataSourceImpl(get<_i6.FilePicker>()));
  gh.lazySingleton<_i12.ImageDataSource>(
      () => _i12.ImageDataSourceImpl(imagePicker: get<_i8.ImagePicker>()));
  gh.lazySingleton<_i13.LocalDataSource>(
      () => _i13.LocalDataSourceImpl(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i14.RemoteDataSource>(() => _i14.RemoteDataSourceImpl(
      get<_i10.TeacherService>(), get<_i7.HandleNetworkCall>()));
  gh.lazySingleton<_i15.UrlToFile>(
      () => _i15.UrlToFileImp(get<_i14.RemoteDataSource>()));
  gh.lazySingleton<_i16.Repository>(() => _i17.RepositoryImpl(
      get<_i13.LocalDataSource>(),
      get<_i14.RemoteDataSource>(),
      get<_i4.Connectivity>(),
      get<_i11.FileDataSource>(),
      get<_i12.ImageDataSource>(),
      get<_i3.Battery>(),
      get<_i15.UrlToFile>()));
  gh.lazySingleton<_i18.SortChoice>(
      () => _i18.SortChoice(get<_i16.Repository>()));
  gh.lazySingleton<_i19.CheckAuth>(
      () => _i19.CheckAuth(get<_i16.Repository>()));
  gh.lazySingleton<_i20.CheckBattery>(
      () => _i20.CheckBattery(get<_i16.Repository>()));
  gh.lazySingleton<_i21.CheckConnection>(
      () => _i21.CheckConnection(get<_i16.Repository>()));
  gh.lazySingleton<_i22.ClearPrefs>(
      () => _i22.ClearPrefs(get<_i16.Repository>()));
  gh.factory<_i23.ClearPrefsBloc>(
      () => _i23.ClearPrefsBloc(get<_i22.ClearPrefs>()));
  gh.lazySingleton<_i24.CreateAssignment>(
      () => _i24.CreateAssignment(get<_i16.Repository>()));
  gh.lazySingleton<_i25.CreateChoice>(
      () => _i25.CreateChoice(get<_i16.Repository>()));
  gh.lazySingleton<_i26.CreateCourse>(
      () => _i26.CreateCourse(get<_i16.Repository>()));
  gh.lazySingleton<_i27.CreatePdf>(
      () => _i27.CreatePdf(get<_i16.Repository>()));
  gh.lazySingleton<_i28.CreateQuestion>(
      () => _i28.CreateQuestion(get<_i16.Repository>()));
  gh.lazySingleton<_i29.DeleteAssignment>(
      () => _i29.DeleteAssignment(get<_i16.Repository>()));
  gh.lazySingleton<_i30.DeleteChoice>(
      () => _i30.DeleteChoice(get<_i16.Repository>()));
  gh.lazySingleton<_i31.DeleteCourse>(
      () => _i31.DeleteCourse(get<_i16.Repository>()));
  gh.lazySingleton<_i32.DeletePdf>(
      () => _i32.DeletePdf(get<_i16.Repository>()));
  gh.lazySingleton<_i33.DeleteQuestion>(
      () => _i33.DeleteQuestion(get<_i16.Repository>()));
  gh.lazySingleton<_i34.EditAssignment>(
      () => _i34.EditAssignment(get<_i16.Repository>()));
  gh.lazySingleton<_i35.EditChoice>(
      () => _i35.EditChoice(get<_i16.Repository>()));
  gh.lazySingleton<_i36.EditCourse>(
      () => _i36.EditCourse(get<_i16.Repository>()));
  gh.lazySingleton<_i37.EditPdf>(() => _i37.EditPdf(get<_i16.Repository>()));
  gh.lazySingleton<_i38.EditQuestion>(
      () => _i38.EditQuestion(get<_i16.Repository>()));
  gh.lazySingleton<_i39.GetAssignment>(
      () => _i39.GetAssignment(get<_i16.Repository>()));
  gh.factory<_i40.GetAssignmentBloc>(
      () => _i40.GetAssignmentBloc(get<_i39.GetAssignment>()));
  gh.lazySingleton<_i41.GetChoice>(
      () => _i41.GetChoice(get<_i16.Repository>()));
  gh.factory<_i42.GetChoiceBloc>(
      () => _i42.GetChoiceBloc(get<_i41.GetChoice>(), get<_i18.SortChoice>()));
  gh.lazySingleton<_i43.GetCourse>(
      () => _i43.GetCourse(get<_i16.Repository>()));
  gh.lazySingleton<_i44.GetFileFromUrl>(
      () => _i44.GetFileFromUrl(get<_i16.Repository>()));
  gh.lazySingleton<_i45.GetPdf>(() => _i45.GetPdf(get<_i16.Repository>()));
  gh.factory<_i46.GetPdfBloc>(() => _i46.GetPdfBloc(get<_i45.GetPdf>()));
  gh.lazySingleton<_i47.GetQuestion>(
      () => _i47.GetQuestion(get<_i16.Repository>()));
  gh.factory<_i48.GetQuestionBloc>(
      () => _i48.GetQuestionBloc(get<_i47.GetQuestion>()));
  gh.lazySingleton<_i49.GetUser>(() => _i49.GetUser(get<_i16.Repository>()));
  gh.lazySingleton<_i50.Login>(() => _i50.Login(get<_i16.Repository>()));
  gh.lazySingleton<_i51.Logout>(() => _i51.Logout(get<_i16.Repository>()));
  gh.factory<_i52.NtworkBloc>(
      () => _i52.NtworkBloc(get<_i21.CheckConnection>()));
  gh.lazySingleton<_i53.PickFile>(() => _i53.PickFile(get<_i16.Repository>()));
  gh.lazySingleton<_i54.PickImage>(
      () => _i54.PickImage(get<_i16.Repository>()));
  gh.lazySingleton<_i55.PickMultipleFile>(
      () => _i55.PickMultipleFile(get<_i16.Repository>()));
  gh.factory<_i56.PickerBloc>(
      () => _i56.PickerBloc(get<_i54.PickImage>(), get<_i53.PickFile>()));
  gh.lazySingleton<_i57.RefreshToken>(
      () => _i57.RefreshToken(get<_i16.Repository>()));
  gh.lazySingleton<_i58.Register>(() => _i58.Register(get<_i16.Repository>()));
  gh.factory<_i59.SplashBloc>(() => _i59.SplashBloc(
      get<_i19.CheckAuth>(), get<_i51.Logout>(), get<_i57.RefreshToken>()));
  gh.factory<_i60.AuthBloc>(
      () => _i60.AuthBloc(get<_i50.Login>(), get<_i58.Register>()));
  gh.factory<_i61.BatteryBloc>(
      () => _i61.BatteryBloc(get<_i20.CheckBattery>()));
  gh.factory<_i62.CreateAssignmentBloc>(() => _i62.CreateAssignmentBloc(
      get<_i24.CreateAssignment>(),
      get<_i34.EditAssignment>(),
      get<_i29.DeleteAssignment>()));
  gh.factory<_i63.CreateChoiceBloc>(() => _i63.CreateChoiceBloc(
      get<_i25.CreateChoice>(),
      get<_i35.EditChoice>(),
      get<_i30.DeleteChoice>()));
  gh.factory<_i64.CreateCourseBloc>(() => _i64.CreateCourseBloc(
      get<_i26.CreateCourse>(),
      get<_i36.EditCourse>(),
      get<_i31.DeleteCourse>()));
  gh.factory<_i65.CreatePdfBloc>(() => _i65.CreatePdfBloc(
      get<_i27.CreatePdf>(), get<_i37.EditPdf>(), get<_i32.DeletePdf>()));
  gh.factory<_i66.CreateQuestionBloc>(() => _i66.CreateQuestionBloc(
      get<_i28.CreateQuestion>(),
      get<_i38.EditQuestion>(),
      get<_i33.DeleteQuestion>()));
  gh.factory<_i67.DashboardBloc>(
      () => _i67.DashboardBloc(get<_i43.GetCourse>()));
  gh.factory<_i68.FileFromUrlBloc>(
      () => _i68.FileFromUrlBloc(get<_i44.GetFileFromUrl>()));
  return get;
}

class _$InjectionModules extends _i69.InjectionModules {}
