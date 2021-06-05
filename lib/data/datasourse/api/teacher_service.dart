import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:http/io_client.dart' as io;
part 'teacher_service.chopper.dart';

//! if (photo != null) PartValueFile<String>('photo', photo)
//! edit part value generator

@lazySingleton
@ChopperApi(baseUrl: '/teacher/')
abstract class TeacherServiceApi extends ChopperService {
  @factoryMethod
  static TeacherServiceApi create() {
    final client = ChopperClient(
      baseUrl: CHOPPER_BASE_URL,
      services: [_$TeacherServiceApi()],
      converter: JsonConverter(),
      errorConverter: JsonConverter(),
      client: io.IOClient(
          HttpClient()..connectionTimeout = const Duration(seconds: 60)),
      interceptors: [
        HeadersInterceptor({'Accept': 'application/json'}),
        HttpLoggingInterceptor(),
      ],
    );
    return _$TeacherServiceApi(client);
  }

  //*AUTH
  @Post(path: "login")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> login({
    @Field('email') required String email,
    @Field('password') required String password,
  });

  @Post(path: "register")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> register({
    @Field('name') required String name,
    @Field('email') required String email,
    @Field('password') required String password,
    @Field('password_confirmation') required String confirmPassword,
  });

  @Post(path: "refresh")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> refreshToken({
    @Field("refresh_token") required String refreshToken,
  });

  @Get(path: "user")
  Future<Response> getUser({
    @Header("Authorization") required String accessToken,
  });

  @Post(path: "logout", optionalBody: true)
  Future<Response> logout({
    @Header("Authorization") required String accessToken,
  });

  //*COURSE
  @Get(path: "get_course")
  Future<Response> getCourses({
    @Header("Authorization") required String accessToken,
    @Query("page") int? page,
  });

  @Post(path: "create_course")
  @multipart
  Future<Response> createCourse({
    @Header("Authorization") required String accessToken,
    @Part("title") required String title,
    @Part("description") required String desc,
    @PartFile("photo") required String photo,
  });

  @Post(path: "edit_course")
  @multipart
  Future<Response> editCourse({
    @Header("Authorization") required String accessToken,
    @Part("course_id") required int courseId,
    @Part("title") String? title,
    @Part("description") String? desc,
    @PartFile("photo") String? photo,
  });

  @Post(path: "delete_course")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> deleteCourse({
    @Header("Authorization") required String accessToken,
    @Field("course_id") required int courseId,
  });

  //*PDF
  @Get(path: "get_pdf/{course_id}")
  Future<Response> getPdf({
    @Header("Authorization") required String accessToken,
    @Path("course_id") required int courseId,
    @Query("page") int? page,
  });

  @Post(path: "create_pdf")
  @multipart
  Future<Response> createPdf({
    @Header("Authorization") required String accessToken,
    @Part("course_id") required int courseId,
    @Part("name") required String name,
    @PartFile("link") required String link,
  });

  @Post(path: "edit_pdf")
  @multipart
  Future<Response> editPdf({
    @Header("Authorization") required String accessToken,
    @Part("pdf_id") required int pdfId,
    @Part("name") String? name,
    @PartFile("link") String? link,
  });

  @Post(path: "delete_pdf")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> deletePdf({
    @Header("Authorization") required String accessToken,
    @Field("pdf_id") required int pdfId,
  });

  //*ASSIGNMENTS
  @Get(path: "get_assignment/{course_id}")
  Future<Response> getAssignment({
    @Header("Authorization") required String accessToken,
    @Path("course_id") required int courseId,
  });

  @Post(path: "create_assignment")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> createAssignment({
    @Header("Authorization") required String accessToken,
    @Field("course_id") required int courseId,
    @Field("title") required String title,
  });

  @Post(path: "edit_assignment")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> editAssignment({
    @Header("Authorization") required String accessToken,
    @Field("assignment_id") required int assignmentId,
    @Field("title") required String title,
  });

  @Post(path: "delete_assignment")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> deleteAssignment({
    @Header("Authorization") required String accessToken,
    @Field("assignment_id") required int assignmentId,
  });

  //*QUESTIONS
  @Get(path: "get_question/{assignment_id}")
  Future<Response> getQuestions({
    @Header("Authorization") required String accessToken,
    @Path("assignment_id") required int assignmentId,
  });

  @Post(path: "create_question")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> createQuestions({
    @Header("Authorization") required String accessToken,
    @Field("assignment_id") required int assignmentId,
    @Field("question") required String question,
    @Field("answer") required String answer,
  });

  @Post(path: "edit_question")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> editQuestions({
    @Header("Authorization") required String accessToken,
    @Field("question_id") required int questionId,
    @Field("question") String? question,
    @Field("answer") String? answer,
  });

  @Post(path: "delete_question")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> deleteQuestions({
    @Header("Authorization") required String accessToken,
    @Field("question_id") required int questionId,
  });

  //*CHOICES
  @Get(path: "get_choice/{question_id}")
  Future<Response> getChoices({
    @Header("Authorization") required String accessToken,
    @Path("question_id") required int questionId,
  });

  @Post(path: "create_choice")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> createChoices({
    @Header("Authorization") required String accessToken,
    @Field("question_id") required int questionId,
    @Field("title") required String title,
  });

  @Post(path: "edit_choice")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> editChoices({
    @Header("Authorization") required String accessToken,
    @Field("choice_id") required int choiceId,
    @Field("title") required String title,
  });

  @Post(path: "delete_choice")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> deleteChoices({
    @Header("Authorization") required String accessToken,
    @Field("choice_id") required int choiceId,
  });

  @Post(path: "sortChoices")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> sortChoices({
    @Header("Authorization") required String accessToken,
    @Field("question_id") required int questionId,
  });

  //*FETCH FILE FROM URL
  // @Get(path: "{url}")
  // Future<Response> fetchFileFromUrl({
  //   @Path('url') required String url,
  // });
}
