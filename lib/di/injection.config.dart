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
import '../features/data/datasourse/api/teacher_api.dart' as _i10;
import '../features/data/datasourse/file/file_data_source.dart' as _i11;
import '../features/data/datasourse/file/url_to_file.dart' as _i15;
import '../features/data/datasourse/image/image_data_source.dart' as _i12;
import '../features/data/datasourse/local/local_data_source.dart' as _i13;
import '../features/data/datasourse/network/connectivity_checker.dart' as _i5;
import '../features/data/datasourse/remote/remote_data_sorce.dart' as _i14;
import '../features/data/repository/eshule_repository_impl.dart' as _i17;
import '../features/domain/repository/eshule_repository.dart' as _i16;
import '../features/domain/usecase/common/check_auth.dart' as _i26;
import '../features/domain/usecase/common/check_battery.dart' as _i27;
import '../features/domain/usecase/common/check_connection.dart' as _i28;
import '../features/domain/usecase/common/clear_prefs.dart' as _i29;
import '../features/domain/usecase/common/get_assignment.dart' as _i46;
import '../features/domain/usecase/common/get_choice.dart' as _i48;
import '../features/domain/usecase/common/get_course.dart' as _i50;
import '../features/domain/usecase/common/get_file_from_url.dart' as _i51;
import '../features/domain/usecase/common/get_pdf.dart' as _i52;
import '../features/domain/usecase/common/get_question.dart' as _i54;
import '../features/domain/usecase/common/get_recent_search.dart' as _i56;
import '../features/domain/usecase/common/get_user.dart' as _i57;
import '../features/domain/usecase/common/login.dart' as _i58;
import '../features/domain/usecase/common/logout.dart' as _i59;
import '../features/domain/usecase/common/pick_file.dart' as _i61;
import '../features/domain/usecase/common/pick_image.dart' as _i62;
import '../features/domain/usecase/common/pick_multiple_file.dart' as _i63;
import '../features/domain/usecase/common/refresh_token.dart' as _i65;
import '../features/domain/usecase/common/register.dart' as _i66;
import '../features/domain/usecase/common/save_to_resent.dart' as _i18;
import '../features/domain/usecase/common/update_assignment.dart' as _i21;
import '../features/domain/usecase/common/update_choice.dart' as _i22;
import '../features/domain/usecase/common/update_course.dart' as _i23;
import '../features/domain/usecase/common/update_pdf.dart' as _i24;
import '../features/domain/usecase/common/update_question.dart' as _i25;
import '../features/domain/usecase/teacher/create_assignment.dart' as _i31;
import '../features/domain/usecase/teacher/create_choice.dart' as _i32;
import '../features/domain/usecase/teacher/create_course.dart' as _i33;
import '../features/domain/usecase/teacher/create_pdf.dart' as _i34;
import '../features/domain/usecase/teacher/create_question.dart' as _i35;
import '../features/domain/usecase/teacher/delete_assigment.dart' as _i36;
import '../features/domain/usecase/teacher/delete_choice.dart' as _i37;
import '../features/domain/usecase/teacher/delete_course.dart' as _i38;
import '../features/domain/usecase/teacher/delete_pdf.dart' as _i39;
import '../features/domain/usecase/teacher/delete_question.dart' as _i40;
import '../features/domain/usecase/teacher/edit_assignment.dart' as _i41;
import '../features/domain/usecase/teacher/edit_choice.dart' as _i42;
import '../features/domain/usecase/teacher/edit_course.dart' as _i43;
import '../features/domain/usecase/teacher/edit_pdf.dart' as _i44;
import '../features/domain/usecase/teacher/edit_question.dart' as _i45;
import '../features/domain/usecase/teacher/set_answer.dart' as _i19;
import '../features/domain/usecase/teacher/sort_choice.dart' as _i20;
import '../features/presentation/bloc/auth/auth_bloc.dart' as _i70;
import '../features/presentation/bloc/battery/battery_bloc.dart' as _i71;
import '../features/presentation/bloc/clear_prefs/clear_prefs_bloc.dart'
    as _i30;
import '../features/presentation/bloc/create_assignment/create_assignment_bloc.dart'
    as _i72;
import '../features/presentation/bloc/create_choice/create_choice_bloc.dart'
    as _i73;
import '../features/presentation/bloc/create_course/create_course_bloc.dart'
    as _i74;
import '../features/presentation/bloc/create_pdf/create_pdf_bloc.dart' as _i75;
import '../features/presentation/bloc/create_question/create_question_bloc.dart'
    as _i76;
import '../features/presentation/bloc/dashboard/dashboard_bloc.dart' as _i77;
import '../features/presentation/bloc/file_to_url/file_from_url_bloc.dart'
    as _i78;
import '../features/presentation/bloc/get_assignment/get_assignment_bloc.dart'
    as _i47;
import '../features/presentation/bloc/get_choice/get_choice_bloc.dart' as _i49;
import '../features/presentation/bloc/get_pdf/get_pdf_bloc.dart' as _i53;
import '../features/presentation/bloc/get_question/get_question_bloc.dart'
    as _i55;
import '../features/presentation/bloc/get_recent_searches/get_recent_cubit.dart'
    as _i79;
import '../features/presentation/bloc/network/ntwork_bloc.dart' as _i60;
import '../features/presentation/bloc/picker/picker_bloc.dart' as _i64;
import '../features/presentation/bloc/save_recent_searches/save_recent_cubit.dart'
    as _i67;
import '../features/presentation/bloc/splash_bloc/splash_bloc.dart' as _i68;
import '../features/presentation/bloc/user/user_bloc.dart' as _i69;
import 'module_injection.dart' as _i80; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i18.SaveToRecent>(
      () => _i18.SaveToRecent(get<_i16.Repository>()));
  gh.lazySingleton<_i19.SetAnswer>(
      () => _i19.SetAnswer(get<_i16.Repository>()));
  gh.lazySingleton<_i20.SortChoice>(
      () => _i20.SortChoice(get<_i16.Repository>()));
  gh.lazySingleton<_i21.UpdateAssignment>(
      () => _i21.UpdateAssignment(get<_i16.Repository>()));
  gh.lazySingleton<_i22.UpdateChoice>(
      () => _i22.UpdateChoice(get<_i16.Repository>()));
  gh.lazySingleton<_i23.UpdateCourse>(
      () => _i23.UpdateCourse(get<_i16.Repository>()));
  gh.lazySingleton<_i24.UpdatePdf>(
      () => _i24.UpdatePdf(get<_i16.Repository>()));
  gh.lazySingleton<_i25.UpdateQuestion>(
      () => _i25.UpdateQuestion(get<_i16.Repository>()));
  gh.lazySingleton<_i26.CheckAuth>(
      () => _i26.CheckAuth(get<_i16.Repository>()));
  gh.lazySingleton<_i27.CheckBattery>(
      () => _i27.CheckBattery(get<_i16.Repository>()));
  gh.lazySingleton<_i28.CheckConnection>(
      () => _i28.CheckConnection(get<_i16.Repository>()));
  gh.lazySingleton<_i29.ClearPrefs>(
      () => _i29.ClearPrefs(get<_i16.Repository>()));
  gh.factory<_i30.ClearPrefsBloc>(
      () => _i30.ClearPrefsBloc(get<_i29.ClearPrefs>()));
  gh.lazySingleton<_i31.CreateAssignment>(
      () => _i31.CreateAssignment(get<_i16.Repository>()));
  gh.lazySingleton<_i32.CreateChoice>(
      () => _i32.CreateChoice(get<_i16.Repository>()));
  gh.lazySingleton<_i33.CreateCourse>(
      () => _i33.CreateCourse(get<_i16.Repository>()));
  gh.lazySingleton<_i34.CreatePdf>(
      () => _i34.CreatePdf(get<_i16.Repository>()));
  gh.lazySingleton<_i35.CreateQuestion>(
      () => _i35.CreateQuestion(get<_i16.Repository>()));
  gh.lazySingleton<_i36.DeleteAssignment>(
      () => _i36.DeleteAssignment(get<_i16.Repository>()));
  gh.lazySingleton<_i37.DeleteChoice>(
      () => _i37.DeleteChoice(get<_i16.Repository>()));
  gh.lazySingleton<_i38.DeleteCourse>(
      () => _i38.DeleteCourse(get<_i16.Repository>()));
  gh.lazySingleton<_i39.DeletePdf>(
      () => _i39.DeletePdf(get<_i16.Repository>()));
  gh.lazySingleton<_i40.DeleteQuestion>(
      () => _i40.DeleteQuestion(get<_i16.Repository>()));
  gh.lazySingleton<_i41.EditAssignment>(
      () => _i41.EditAssignment(get<_i16.Repository>()));
  gh.lazySingleton<_i42.EditChoice>(
      () => _i42.EditChoice(get<_i16.Repository>()));
  gh.lazySingleton<_i43.EditCourse>(
      () => _i43.EditCourse(get<_i16.Repository>()));
  gh.lazySingleton<_i44.EditPdf>(() => _i44.EditPdf(get<_i16.Repository>()));
  gh.lazySingleton<_i45.EditQuestion>(
      () => _i45.EditQuestion(get<_i16.Repository>()));
  gh.lazySingleton<_i46.GetAssignment>(
      () => _i46.GetAssignment(get<_i16.Repository>()));
  gh.factory<_i47.GetAssignmentBloc>(() => _i47.GetAssignmentBloc(
      get<_i46.GetAssignment>(), get<_i21.UpdateAssignment>()));
  gh.lazySingleton<_i48.GetChoice>(
      () => _i48.GetChoice(get<_i16.Repository>()));
  gh.factory<_i49.GetChoiceBloc>(() => _i49.GetChoiceBloc(
      get<_i48.GetChoice>(), get<_i20.SortChoice>(), get<_i22.UpdateChoice>()));
  gh.lazySingleton<_i50.GetCourse>(
      () => _i50.GetCourse(get<_i16.Repository>()));
  gh.lazySingleton<_i51.GetFileFromUrl>(
      () => _i51.GetFileFromUrl(get<_i16.Repository>()));
  gh.lazySingleton<_i52.GetPdf>(() => _i52.GetPdf(get<_i16.Repository>()));
  gh.factory<_i53.GetPdfBloc>(
      () => _i53.GetPdfBloc(get<_i52.GetPdf>(), get<_i24.UpdatePdf>()));
  gh.lazySingleton<_i54.GetQuestion>(
      () => _i54.GetQuestion(get<_i16.Repository>()));
  gh.factory<_i55.GetQuestionBloc>(() => _i55.GetQuestionBloc(
      get<_i54.GetQuestion>(), get<_i25.UpdateQuestion>()));
  gh.lazySingleton<_i56.GetRecentSearch>(
      () => _i56.GetRecentSearch(get<_i16.Repository>()));
  gh.lazySingleton<_i57.GetUser>(() => _i57.GetUser(get<_i16.Repository>()));
  gh.lazySingleton<_i58.Login>(() => _i58.Login(get<_i16.Repository>()));
  gh.lazySingleton<_i59.Logout>(() => _i59.Logout(get<_i16.Repository>()));
  gh.factory<_i60.NtworkBloc>(
      () => _i60.NtworkBloc(get<_i28.CheckConnection>()));
  gh.lazySingleton<_i61.PickFile>(() => _i61.PickFile(get<_i16.Repository>()));
  gh.lazySingleton<_i62.PickImage>(
      () => _i62.PickImage(get<_i16.Repository>()));
  gh.lazySingleton<_i63.PickMultipleFile>(
      () => _i63.PickMultipleFile(get<_i16.Repository>()));
  gh.factory<_i64.PickerBloc>(
      () => _i64.PickerBloc(get<_i62.PickImage>(), get<_i61.PickFile>()));
  gh.lazySingleton<_i65.RefreshToken>(
      () => _i65.RefreshToken(get<_i16.Repository>()));
  gh.lazySingleton<_i66.Register>(() => _i66.Register(get<_i16.Repository>()));
  gh.factory<_i67.SaveRecentCubit>(
      () => _i67.SaveRecentCubit(get<_i18.SaveToRecent>()));
  gh.factory<_i68.SplashBloc>(() => _i68.SplashBloc(
      get<_i26.CheckAuth>(), get<_i59.Logout>(), get<_i65.RefreshToken>()));
  gh.factory<_i69.UserBloc>(() => _i69.UserBloc(get<_i57.GetUser>()));
  gh.factory<_i70.AuthBloc>(
      () => _i70.AuthBloc(get<_i58.Login>(), get<_i66.Register>()));
  gh.factory<_i71.BatteryBloc>(
      () => _i71.BatteryBloc(get<_i27.CheckBattery>()));
  gh.factory<_i72.CreateAssignmentBloc>(() => _i72.CreateAssignmentBloc(
      get<_i31.CreateAssignment>(),
      get<_i41.EditAssignment>(),
      get<_i36.DeleteAssignment>()));
  gh.factory<_i73.CreateChoiceBloc>(() => _i73.CreateChoiceBloc(
      get<_i32.CreateChoice>(),
      get<_i42.EditChoice>(),
      get<_i37.DeleteChoice>(),
      get<_i19.SetAnswer>()));
  gh.factory<_i74.CreateCourseBloc>(() => _i74.CreateCourseBloc(
      get<_i33.CreateCourse>(),
      get<_i43.EditCourse>(),
      get<_i38.DeleteCourse>()));
  gh.factory<_i75.CreatePdfBloc>(() => _i75.CreatePdfBloc(
      get<_i34.CreatePdf>(), get<_i44.EditPdf>(), get<_i39.DeletePdf>()));
  gh.factory<_i76.CreateQuestionBloc>(() => _i76.CreateQuestionBloc(
      get<_i35.CreateQuestion>(),
      get<_i45.EditQuestion>(),
      get<_i40.DeleteQuestion>()));
  gh.factory<_i77.DashboardBloc>(() =>
      _i77.DashboardBloc(get<_i50.GetCourse>(), get<_i23.UpdateCourse>()));
  gh.factory<_i78.FileFromUrlBloc>(
      () => _i78.FileFromUrlBloc(get<_i51.GetFileFromUrl>()));
  gh.factory<_i79.GetRecentCubit>(
      () => _i79.GetRecentCubit(get<_i56.GetRecentSearch>()));
  return get;
}

class _$InjectionModules extends _i80.InjectionModules {}
