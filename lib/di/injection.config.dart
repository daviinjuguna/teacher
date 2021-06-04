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
import '../data/datasourse/api/teacher_service.dart' as _i11;
import '../data/datasourse/file/file_data_source.dart' as _i12;
import '../data/datasourse/file/url_to_file.dart' as _i16;
import '../data/datasourse/image/image_data_source.dart' as _i13;
import '../data/datasourse/local/local_data_source.dart' as _i14;
import '../data/datasourse/network/connectivity_checker.dart' as _i5;
import '../data/datasourse/remote/remote_data_sorce.dart' as _i15;
import '../data/repository/eshule_repository_impl.dart' as _i18;
import '../domain/repository/eshule_repository.dart' as _i17;
import '../domain/usecase/common/check_auth.dart' as _i20;
import '../domain/usecase/common/check_battery.dart' as _i21;
import '../domain/usecase/common/check_connection.dart' as _i22;
import '../domain/usecase/common/clear_prefs.dart' as _i23;
import '../domain/usecase/common/get_assignment.dart' as _i40;
import '../domain/usecase/common/get_choice.dart' as _i42;
import '../domain/usecase/common/get_course.dart' as _i44;
import '../domain/usecase/common/get_file_from_url.dart' as _i45;
import '../domain/usecase/common/get_pdf.dart' as _i46;
import '../domain/usecase/common/get_question.dart' as _i48;
import '../domain/usecase/common/get_user.dart' as _i50;
import '../domain/usecase/common/login.dart' as _i51;
import '../domain/usecase/common/logout.dart' as _i52;
import '../domain/usecase/common/pick_file.dart' as _i54;
import '../domain/usecase/common/pick_image.dart' as _i55;
import '../domain/usecase/common/pick_multiple_file.dart' as _i56;
import '../domain/usecase/common/refresh_token.dart' as _i58;
import '../domain/usecase/common/register.dart' as _i59;
import '../domain/usecase/teacher/create_assignment.dart' as _i25;
import '../domain/usecase/teacher/create_choice.dart' as _i26;
import '../domain/usecase/teacher/create_course.dart' as _i27;
import '../domain/usecase/teacher/create_pdf.dart' as _i28;
import '../domain/usecase/teacher/create_question.dart' as _i29;
import '../domain/usecase/teacher/delete_assigment.dart' as _i30;
import '../domain/usecase/teacher/delete_choice.dart' as _i31;
import '../domain/usecase/teacher/delete_course.dart' as _i32;
import '../domain/usecase/teacher/delete_pdf.dart' as _i33;
import '../domain/usecase/teacher/delete_question.dart' as _i34;
import '../domain/usecase/teacher/edit_assignment.dart' as _i35;
import '../domain/usecase/teacher/edit_choice.dart' as _i36;
import '../domain/usecase/teacher/edit_course.dart' as _i37;
import '../domain/usecase/teacher/edit_pdf.dart' as _i38;
import '../domain/usecase/teacher/edit_question.dart' as _i39;
import '../domain/usecase/teacher/sort_choice.dart' as _i19;
import '../presentation/bloc/auth/auth_bloc.dart' as _i61;
import '../presentation/bloc/battery/battery_bloc.dart' as _i62;
import '../presentation/bloc/clear_prefs/clear_prefs_bloc.dart' as _i24;
import '../presentation/bloc/create_assignment/create_assignment_bloc.dart'
    as _i63;
import '../presentation/bloc/create_choice/create_choice_bloc.dart' as _i64;
import '../presentation/bloc/create_course/create_course_bloc.dart' as _i65;
import '../presentation/bloc/create_pdf/create_pdf_bloc.dart' as _i66;
import '../presentation/bloc/create_question/create_question_bloc.dart' as _i67;
import '../presentation/bloc/dashboard/dashboard_bloc.dart' as _i68;
import '../presentation/bloc/file_to_url/file_from_url_bloc.dart' as _i69;
import '../presentation/bloc/get_assignment/get_assignment_bloc.dart' as _i41;
import '../presentation/bloc/get_choice/get_choice_bloc.dart' as _i43;
import '../presentation/bloc/get_pdf/get_pdf_bloc.dart' as _i47;
import '../presentation/bloc/get_question/get_question_bloc.dart' as _i49;
import '../presentation/bloc/network/ntwork_bloc.dart' as _i53;
import '../presentation/bloc/picker/picker_bloc.dart' as _i57;
import '../presentation/bloc/splash_bloc/splash_bloc.dart' as _i60;
import 'module_injection.dart' as _i70; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i11.TeacherServiceApi>(
      () => _i11.TeacherServiceApi.create());
  gh.lazySingleton<_i12.FileDataSource>(
      () => _i12.FileDataSourceImpl(get<_i6.FilePicker>()));
  gh.lazySingleton<_i13.ImageDataSource>(
      () => _i13.ImageDataSourceImpl(imagePicker: get<_i8.ImagePicker>()));
  gh.lazySingleton<_i14.LocalDataSource>(
      () => _i14.LocalDataSourceImpl(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i15.RemoteDataSource>(() => _i15.RemoteDataSourceImpl(
      get<_i10.TeacherService>(),
      get<_i7.HandleNetworkCall>(),
      get<_i11.TeacherServiceApi>()));
  gh.lazySingleton<_i16.UrlToFile>(
      () => _i16.UrlToFileImp(get<_i15.RemoteDataSource>()));
  gh.lazySingleton<_i17.Repository>(() => _i18.RepositoryImpl(
      get<_i14.LocalDataSource>(),
      get<_i15.RemoteDataSource>(),
      get<_i4.Connectivity>(),
      get<_i12.FileDataSource>(),
      get<_i13.ImageDataSource>(),
      get<_i3.Battery>(),
      get<_i16.UrlToFile>()));
  gh.lazySingleton<_i19.SortChoice>(
      () => _i19.SortChoice(get<_i17.Repository>()));
  gh.lazySingleton<_i20.CheckAuth>(
      () => _i20.CheckAuth(get<_i17.Repository>()));
  gh.lazySingleton<_i21.CheckBattery>(
      () => _i21.CheckBattery(get<_i17.Repository>()));
  gh.lazySingleton<_i22.CheckConnection>(
      () => _i22.CheckConnection(get<_i17.Repository>()));
  gh.lazySingleton<_i23.ClearPrefs>(
      () => _i23.ClearPrefs(get<_i17.Repository>()));
  gh.factory<_i24.ClearPrefsBloc>(
      () => _i24.ClearPrefsBloc(get<_i23.ClearPrefs>()));
  gh.lazySingleton<_i25.CreateAssignment>(
      () => _i25.CreateAssignment(get<_i17.Repository>()));
  gh.lazySingleton<_i26.CreateChoice>(
      () => _i26.CreateChoice(get<_i17.Repository>()));
  gh.lazySingleton<_i27.CreateCourse>(
      () => _i27.CreateCourse(get<_i17.Repository>()));
  gh.lazySingleton<_i28.CreatePdf>(
      () => _i28.CreatePdf(get<_i17.Repository>()));
  gh.lazySingleton<_i29.CreateQuestion>(
      () => _i29.CreateQuestion(get<_i17.Repository>()));
  gh.lazySingleton<_i30.DeleteAssignment>(
      () => _i30.DeleteAssignment(get<_i17.Repository>()));
  gh.lazySingleton<_i31.DeleteChoice>(
      () => _i31.DeleteChoice(get<_i17.Repository>()));
  gh.lazySingleton<_i32.DeleteCourse>(
      () => _i32.DeleteCourse(get<_i17.Repository>()));
  gh.lazySingleton<_i33.DeletePdf>(
      () => _i33.DeletePdf(get<_i17.Repository>()));
  gh.lazySingleton<_i34.DeleteQuestion>(
      () => _i34.DeleteQuestion(get<_i17.Repository>()));
  gh.lazySingleton<_i35.EditAssignment>(
      () => _i35.EditAssignment(get<_i17.Repository>()));
  gh.lazySingleton<_i36.EditChoice>(
      () => _i36.EditChoice(get<_i17.Repository>()));
  gh.lazySingleton<_i37.EditCourse>(
      () => _i37.EditCourse(get<_i17.Repository>()));
  gh.lazySingleton<_i38.EditPdf>(() => _i38.EditPdf(get<_i17.Repository>()));
  gh.lazySingleton<_i39.EditQuestion>(
      () => _i39.EditQuestion(get<_i17.Repository>()));
  gh.lazySingleton<_i40.GetAssignment>(
      () => _i40.GetAssignment(get<_i17.Repository>()));
  gh.factory<_i41.GetAssignmentBloc>(
      () => _i41.GetAssignmentBloc(get<_i40.GetAssignment>()));
  gh.lazySingleton<_i42.GetChoice>(
      () => _i42.GetChoice(get<_i17.Repository>()));
  gh.factory<_i43.GetChoiceBloc>(
      () => _i43.GetChoiceBloc(get<_i42.GetChoice>(), get<_i19.SortChoice>()));
  gh.lazySingleton<_i44.GetCourse>(
      () => _i44.GetCourse(get<_i17.Repository>()));
  gh.lazySingleton<_i45.GetFileFromUrl>(
      () => _i45.GetFileFromUrl(get<_i17.Repository>()));
  gh.lazySingleton<_i46.GetPdf>(() => _i46.GetPdf(get<_i17.Repository>()));
  gh.factory<_i47.GetPdfBloc>(() => _i47.GetPdfBloc(get<_i46.GetPdf>()));
  gh.lazySingleton<_i48.GetQuestion>(
      () => _i48.GetQuestion(get<_i17.Repository>()));
  gh.factory<_i49.GetQuestionBloc>(
      () => _i49.GetQuestionBloc(get<_i48.GetQuestion>()));
  gh.lazySingleton<_i50.GetUser>(() => _i50.GetUser(get<_i17.Repository>()));
  gh.lazySingleton<_i51.Login>(() => _i51.Login(get<_i17.Repository>()));
  gh.lazySingleton<_i52.Logout>(() => _i52.Logout(get<_i17.Repository>()));
  gh.factory<_i53.NtworkBloc>(
      () => _i53.NtworkBloc(get<_i22.CheckConnection>()));
  gh.lazySingleton<_i54.PickFile>(() => _i54.PickFile(get<_i17.Repository>()));
  gh.lazySingleton<_i55.PickImage>(
      () => _i55.PickImage(get<_i17.Repository>()));
  gh.lazySingleton<_i56.PickMultipleFile>(
      () => _i56.PickMultipleFile(get<_i17.Repository>()));
  gh.factory<_i57.PickerBloc>(
      () => _i57.PickerBloc(get<_i55.PickImage>(), get<_i54.PickFile>()));
  gh.lazySingleton<_i58.RefreshToken>(
      () => _i58.RefreshToken(get<_i17.Repository>()));
  gh.lazySingleton<_i59.Register>(() => _i59.Register(get<_i17.Repository>()));
  gh.factory<_i60.SplashBloc>(() => _i60.SplashBloc(
      get<_i20.CheckAuth>(), get<_i52.Logout>(), get<_i58.RefreshToken>()));
  gh.factory<_i61.AuthBloc>(
      () => _i61.AuthBloc(get<_i51.Login>(), get<_i59.Register>()));
  gh.factory<_i62.BatteryBloc>(
      () => _i62.BatteryBloc(get<_i21.CheckBattery>()));
  gh.factory<_i63.CreateAssignmentBloc>(() => _i63.CreateAssignmentBloc(
      get<_i25.CreateAssignment>(),
      get<_i35.EditAssignment>(),
      get<_i30.DeleteAssignment>()));
  gh.factory<_i64.CreateChoiceBloc>(() => _i64.CreateChoiceBloc(
      get<_i26.CreateChoice>(),
      get<_i36.EditChoice>(),
      get<_i31.DeleteChoice>()));
  gh.factory<_i65.CreateCourseBloc>(() => _i65.CreateCourseBloc(
      get<_i27.CreateCourse>(),
      get<_i37.EditCourse>(),
      get<_i32.DeleteCourse>()));
  gh.factory<_i66.CreatePdfBloc>(() => _i66.CreatePdfBloc(
      get<_i28.CreatePdf>(), get<_i38.EditPdf>(), get<_i33.DeletePdf>()));
  gh.factory<_i67.CreateQuestionBloc>(() => _i67.CreateQuestionBloc(
      get<_i29.CreateQuestion>(),
      get<_i39.EditQuestion>(),
      get<_i34.DeleteQuestion>()));
  gh.factory<_i68.DashboardBloc>(
      () => _i68.DashboardBloc(get<_i44.GetCourse>()));
  gh.factory<_i69.FileFromUrlBloc>(
      () => _i69.FileFromUrlBloc(get<_i45.GetFileFromUrl>()));
  return get;
}

class _$InjectionModules extends _i70.InjectionModules {}
