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
import '../database/user/user_dao.dart' as _i18;
import '../features/data/datasourse/api/teacher_api.dart' as _i16;
import '../features/data/datasourse/api/teacher_service.dart' as _i17;
import '../features/data/datasourse/file/file_data_source.dart' as _i19;
import '../features/data/datasourse/file/url_to_file.dart' as _i23;
import '../features/data/datasourse/image/image_data_source.dart' as _i20;
import '../features/data/datasourse/local/local_data_source.dart' as _i21;
import '../features/data/datasourse/network/connectivity_checker.dart' as _i8;
import '../features/data/datasourse/remote/remote_data_sorce.dart' as _i22;
import '../features/data/repository/eshule_repository_impl.dart' as _i25;
import '../features/domain/repository/eshule_repository.dart' as _i24;
import '../features/domain/usecase/common/check_auth.dart' as _i32;
import '../features/domain/usecase/common/check_battery.dart' as _i33;
import '../features/domain/usecase/common/check_connection.dart' as _i34;
import '../features/domain/usecase/common/clear_prefs.dart' as _i35;
import '../features/domain/usecase/common/get_assignment.dart' as _i52;
import '../features/domain/usecase/common/get_choice.dart' as _i54;
import '../features/domain/usecase/common/get_course.dart' as _i56;
import '../features/domain/usecase/common/get_file_from_url.dart' as _i57;
import '../features/domain/usecase/common/get_pdf.dart' as _i58;
import '../features/domain/usecase/common/get_question.dart' as _i60;
import '../features/domain/usecase/common/get_user.dart' as _i62;
import '../features/domain/usecase/common/login.dart' as _i63;
import '../features/domain/usecase/common/logout.dart' as _i64;
import '../features/domain/usecase/common/pick_file.dart' as _i66;
import '../features/domain/usecase/common/pick_image.dart' as _i67;
import '../features/domain/usecase/common/pick_multiple_file.dart' as _i68;
import '../features/domain/usecase/common/refresh_token.dart' as _i70;
import '../features/domain/usecase/common/register.dart' as _i71;
import '../features/domain/usecase/common/update_assignment.dart' as _i27;
import '../features/domain/usecase/common/update_choice.dart' as _i28;
import '../features/domain/usecase/common/update_course.dart' as _i29;
import '../features/domain/usecase/common/update_pdf.dart' as _i30;
import '../features/domain/usecase/common/update_question.dart' as _i31;
import '../features/domain/usecase/teacher/create_assignment.dart' as _i37;
import '../features/domain/usecase/teacher/create_choice.dart' as _i38;
import '../features/domain/usecase/teacher/create_course.dart' as _i39;
import '../features/domain/usecase/teacher/create_pdf.dart' as _i40;
import '../features/domain/usecase/teacher/create_question.dart' as _i41;
import '../features/domain/usecase/teacher/delete_assigment.dart' as _i42;
import '../features/domain/usecase/teacher/delete_choice.dart' as _i43;
import '../features/domain/usecase/teacher/delete_course.dart' as _i44;
import '../features/domain/usecase/teacher/delete_pdf.dart' as _i45;
import '../features/domain/usecase/teacher/delete_question.dart' as _i46;
import '../features/domain/usecase/teacher/edit_assignment.dart' as _i47;
import '../features/domain/usecase/teacher/edit_choice.dart' as _i48;
import '../features/domain/usecase/teacher/edit_course.dart' as _i49;
import '../features/domain/usecase/teacher/edit_pdf.dart' as _i50;
import '../features/domain/usecase/teacher/edit_question.dart' as _i51;
import '../features/domain/usecase/teacher/sort_choice.dart' as _i26;
import '../features/presentation/bloc/auth/auth_bloc.dart' as _i73;
import '../features/presentation/bloc/battery/battery_bloc.dart' as _i74;
import '../features/presentation/bloc/clear_prefs/clear_prefs_bloc.dart'
    as _i36;
import '../features/presentation/bloc/create_assignment/create_assignment_bloc.dart'
    as _i75;
import '../features/presentation/bloc/create_choice/create_choice_bloc.dart'
    as _i76;
import '../features/presentation/bloc/create_course/create_course_bloc.dart'
    as _i77;
import '../features/presentation/bloc/create_pdf/create_pdf_bloc.dart' as _i78;
import '../features/presentation/bloc/create_question/create_question_bloc.dart'
    as _i79;
import '../features/presentation/bloc/dashboard/dashboard_bloc.dart' as _i80;
import '../features/presentation/bloc/file_to_url/file_from_url_bloc.dart'
    as _i81;
import '../features/presentation/bloc/get_assignment/get_assignment_bloc.dart'
    as _i53;
import '../features/presentation/bloc/get_choice/get_choice_bloc.dart' as _i55;
import '../features/presentation/bloc/get_pdf/get_pdf_bloc.dart' as _i59;
import '../features/presentation/bloc/get_question/get_question_bloc.dart'
    as _i61;
import '../features/presentation/bloc/network/ntwork_bloc.dart' as _i65;
import '../features/presentation/bloc/picker/picker_bloc.dart' as _i69;
import '../features/presentation/bloc/splash_bloc/splash_bloc.dart' as _i72;
import 'module_injection.dart' as _i82; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i17.TeacherServiceApi>(
      () => _i17.TeacherServiceApi.create());
  gh.lazySingleton<_i18.UserDao>(() => _i18.UserDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i19.FileDataSource>(
      () => _i19.FileDataSourceImpl(get<_i10.FilePicker>()));
  gh.lazySingleton<_i20.ImageDataSource>(
      () => _i20.ImageDataSourceImpl(imagePicker: get<_i12.ImagePicker>()));
  gh.lazySingleton<_i21.LocalDataSource>(() => _i21.LocalDataSourceImpl(
      get<_i15.SharedPreferences>(),
      get<_i9.CourseDao>(),
      get<_i13.PdfDao>(),
      get<_i4.AssignmentDao>(),
      get<_i6.ChoiceDao>(),
      get<_i14.QuestionDao>(),
      get<_i18.UserDao>()));
  gh.lazySingleton<_i22.RemoteDataSource>(() => _i22.RemoteDataSourceImpl(
      get<_i16.TeacherService>(),
      get<_i11.HandleNetworkCall>(),
      get<_i17.TeacherServiceApi>()));
  gh.lazySingleton<_i23.UrlToFile>(
      () => _i23.UrlToFileImp(get<_i22.RemoteDataSource>()));
  gh.lazySingleton<_i24.Repository>(() => _i25.RepositoryImpl(
      get<_i21.LocalDataSource>(),
      get<_i22.RemoteDataSource>(),
      get<_i7.Connectivity>(),
      get<_i19.FileDataSource>(),
      get<_i20.ImageDataSource>(),
      get<_i5.Battery>(),
      get<_i23.UrlToFile>()));
  gh.lazySingleton<_i26.SortChoice>(
      () => _i26.SortChoice(get<_i24.Repository>()));
  gh.lazySingleton<_i27.UpdateAssignment>(
      () => _i27.UpdateAssignment(get<_i24.Repository>()));
  gh.lazySingleton<_i28.UpdateChoice>(
      () => _i28.UpdateChoice(get<_i24.Repository>()));
  gh.lazySingleton<_i29.UpdateCourse>(
      () => _i29.UpdateCourse(get<_i24.Repository>()));
  gh.lazySingleton<_i30.UpdatePdf>(
      () => _i30.UpdatePdf(get<_i24.Repository>()));
  gh.lazySingleton<_i31.UpdateQuestion>(
      () => _i31.UpdateQuestion(get<_i24.Repository>()));
  gh.lazySingleton<_i32.CheckAuth>(
      () => _i32.CheckAuth(get<_i24.Repository>()));
  gh.lazySingleton<_i33.CheckBattery>(
      () => _i33.CheckBattery(get<_i24.Repository>()));
  gh.lazySingleton<_i34.CheckConnection>(
      () => _i34.CheckConnection(get<_i24.Repository>()));
  gh.lazySingleton<_i35.ClearPrefs>(
      () => _i35.ClearPrefs(get<_i24.Repository>()));
  gh.factory<_i36.ClearPrefsBloc>(
      () => _i36.ClearPrefsBloc(get<_i35.ClearPrefs>()));
  gh.lazySingleton<_i37.CreateAssignment>(
      () => _i37.CreateAssignment(get<_i24.Repository>()));
  gh.lazySingleton<_i38.CreateChoice>(
      () => _i38.CreateChoice(get<_i24.Repository>()));
  gh.lazySingleton<_i39.CreateCourse>(
      () => _i39.CreateCourse(get<_i24.Repository>()));
  gh.lazySingleton<_i40.CreatePdf>(
      () => _i40.CreatePdf(get<_i24.Repository>()));
  gh.lazySingleton<_i41.CreateQuestion>(
      () => _i41.CreateQuestion(get<_i24.Repository>()));
  gh.lazySingleton<_i42.DeleteAssignment>(
      () => _i42.DeleteAssignment(get<_i24.Repository>()));
  gh.lazySingleton<_i43.DeleteChoice>(
      () => _i43.DeleteChoice(get<_i24.Repository>()));
  gh.lazySingleton<_i44.DeleteCourse>(
      () => _i44.DeleteCourse(get<_i24.Repository>()));
  gh.lazySingleton<_i45.DeletePdf>(
      () => _i45.DeletePdf(get<_i24.Repository>()));
  gh.lazySingleton<_i46.DeleteQuestion>(
      () => _i46.DeleteQuestion(get<_i24.Repository>()));
  gh.lazySingleton<_i47.EditAssignment>(
      () => _i47.EditAssignment(get<_i24.Repository>()));
  gh.lazySingleton<_i48.EditChoice>(
      () => _i48.EditChoice(get<_i24.Repository>()));
  gh.lazySingleton<_i49.EditCourse>(
      () => _i49.EditCourse(get<_i24.Repository>()));
  gh.lazySingleton<_i50.EditPdf>(() => _i50.EditPdf(get<_i24.Repository>()));
  gh.lazySingleton<_i51.EditQuestion>(
      () => _i51.EditQuestion(get<_i24.Repository>()));
  gh.lazySingleton<_i52.GetAssignment>(
      () => _i52.GetAssignment(get<_i24.Repository>()));
  gh.factory<_i53.GetAssignmentBloc>(() => _i53.GetAssignmentBloc(
      get<_i52.GetAssignment>(), get<_i27.UpdateAssignment>()));
  gh.lazySingleton<_i54.GetChoice>(
      () => _i54.GetChoice(get<_i24.Repository>()));
  gh.factory<_i55.GetChoiceBloc>(() => _i55.GetChoiceBloc(
      get<_i54.GetChoice>(), get<_i26.SortChoice>(), get<_i28.UpdateChoice>()));
  gh.lazySingleton<_i56.GetCourse>(
      () => _i56.GetCourse(get<_i24.Repository>()));
  gh.lazySingleton<_i57.GetFileFromUrl>(
      () => _i57.GetFileFromUrl(get<_i24.Repository>()));
  gh.lazySingleton<_i58.GetPdf>(() => _i58.GetPdf(get<_i24.Repository>()));
  gh.factory<_i59.GetPdfBloc>(
      () => _i59.GetPdfBloc(get<_i58.GetPdf>(), get<_i30.UpdatePdf>()));
  gh.lazySingleton<_i60.GetQuestion>(
      () => _i60.GetQuestion(get<_i24.Repository>()));
  gh.factory<_i61.GetQuestionBloc>(() => _i61.GetQuestionBloc(
      get<_i60.GetQuestion>(), get<_i31.UpdateQuestion>()));
  gh.lazySingleton<_i62.GetUser>(() => _i62.GetUser(get<_i24.Repository>()));
  gh.lazySingleton<_i63.Login>(() => _i63.Login(get<_i24.Repository>()));
  gh.lazySingleton<_i64.Logout>(() => _i64.Logout(get<_i24.Repository>()));
  gh.factory<_i65.NtworkBloc>(
      () => _i65.NtworkBloc(get<_i34.CheckConnection>()));
  gh.lazySingleton<_i66.PickFile>(() => _i66.PickFile(get<_i24.Repository>()));
  gh.lazySingleton<_i67.PickImage>(
      () => _i67.PickImage(get<_i24.Repository>()));
  gh.lazySingleton<_i68.PickMultipleFile>(
      () => _i68.PickMultipleFile(get<_i24.Repository>()));
  gh.factory<_i69.PickerBloc>(
      () => _i69.PickerBloc(get<_i67.PickImage>(), get<_i66.PickFile>()));
  gh.lazySingleton<_i70.RefreshToken>(
      () => _i70.RefreshToken(get<_i24.Repository>()));
  gh.lazySingleton<_i71.Register>(() => _i71.Register(get<_i24.Repository>()));
  gh.factory<_i72.SplashBloc>(() => _i72.SplashBloc(
      get<_i32.CheckAuth>(), get<_i64.Logout>(), get<_i70.RefreshToken>()));
  gh.factory<_i73.AuthBloc>(
      () => _i73.AuthBloc(get<_i63.Login>(), get<_i71.Register>()));
  gh.factory<_i74.BatteryBloc>(
      () => _i74.BatteryBloc(get<_i33.CheckBattery>()));
  gh.factory<_i75.CreateAssignmentBloc>(() => _i75.CreateAssignmentBloc(
      get<_i37.CreateAssignment>(),
      get<_i47.EditAssignment>(),
      get<_i42.DeleteAssignment>()));
  gh.factory<_i76.CreateChoiceBloc>(() => _i76.CreateChoiceBloc(
      get<_i38.CreateChoice>(),
      get<_i48.EditChoice>(),
      get<_i43.DeleteChoice>()));
  gh.factory<_i77.CreateCourseBloc>(() => _i77.CreateCourseBloc(
      get<_i39.CreateCourse>(),
      get<_i49.EditCourse>(),
      get<_i44.DeleteCourse>()));
  gh.factory<_i78.CreatePdfBloc>(() => _i78.CreatePdfBloc(
      get<_i40.CreatePdf>(), get<_i50.EditPdf>(), get<_i45.DeletePdf>()));
  gh.factory<_i79.CreateQuestionBloc>(() => _i79.CreateQuestionBloc(
      get<_i41.CreateQuestion>(),
      get<_i51.EditQuestion>(),
      get<_i46.DeleteQuestion>()));
  gh.factory<_i80.DashboardBloc>(() =>
      _i80.DashboardBloc(get<_i56.GetCourse>(), get<_i29.UpdateCourse>()));
  gh.factory<_i81.FileFromUrlBloc>(
      () => _i81.FileFromUrlBloc(get<_i57.GetFileFromUrl>()));
  return get;
}

class _$InjectionModules extends _i82.InjectionModules {}
