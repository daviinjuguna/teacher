// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$TeacherServiceApi extends TeacherServiceApi {
  _$TeacherServiceApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TeacherServiceApi;

  @override
  Future<Response<dynamic>> login(
      {required String email, required String password}) {
    final $url = '/teacher/login';
    final $body = <String, dynamic>{'email': email, 'password': password};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> register(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword}) {
    final $url = '/teacher/register';
    final $body = <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword
    };
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> refreshToken({required String refreshToken}) {
    final $url = '/teacher/refresh';
    final $body = <String, dynamic>{'refresh_token': refreshToken};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> getUser({required String accessToken}) {
    final $url = '/teacher/user';
    final $headers = {
      'Authorization': accessToken,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> logout({required String accessToken}) {
    final $url = '/teacher/logout';
    final $headers = {
      'Authorization': accessToken,
    };

    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCourses(
      {required String accessToken, int? page}) {
    final $url = '/teacher/get_course';
    final $params = <String, dynamic>{'page': page};
    final $headers = {
      'Authorization': accessToken,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createCourse(
      {required String accessToken,
      required String title,
      required String desc,
      required String photo}) {
    final $url = '/teacher/create_course';
    final $headers = {
      'Authorization': accessToken,
    };

    final $parts = <PartValue>[
      PartValue<String>('title', title),
      PartValue<String>('description', desc),
      PartValueFile<String>('photo', photo)
    ];
    final $request = Request('POST', $url, client.baseUrl,
        parts: $parts, multipart: true, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> editCourse(
      {required String accessToken,
      required int courseId,
      String? title,
      String? desc,
      String? photo}) {
    final $url = '/teacher/edit_course';
    final $headers = {
      'Authorization': accessToken,
    };

    final $parts = <PartValue>[
      PartValue<int>('course_id', courseId),
      PartValue<String?>('title', title),
      PartValue<String?>('description', desc),
      PartValueFile<String?>('photo', photo)
    ];
    final $request = Request('POST', $url, client.baseUrl,
        parts: $parts, multipart: true, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteCourse(
      {required String accessToken, required int courseId}) {
    final $url = '/teacher/delete_course';
    final $headers = {
      'Authorization': accessToken,
    };

    final $body = <String, dynamic>{'course_id': courseId};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> getPdf(
      {required String accessToken, required int courseId, int? page}) {
    final $url = '/teacher/get_pdf/$courseId';
    final $params = <String, dynamic>{'page': page};
    final $headers = {
      'Authorization': accessToken,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createPdf(
      {required String accessToken,
      required int courseId,
      required String name,
      required String link}) {
    final $url = '/teacher/create_pdf';
    final $headers = {
      'Authorization': accessToken,
    };

    final $parts = <PartValue>[
      PartValue<int>('course_id', courseId),
      PartValue<String>('name', name),
      PartValueFile<String>('link', link)
    ];
    final $request = Request('POST', $url, client.baseUrl,
        parts: $parts, multipart: true, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> editPdf(
      {required String accessToken,
      required int pdfId,
      String? name,
      String? link}) {
    final $url = '/teacher/edit_pdf';
    final $headers = {
      'Authorization': accessToken,
    };

    final $parts = <PartValue>[
      PartValue<int>('pdf_id', pdfId),
      PartValue<String?>('name', name),
      PartValueFile<String?>('link', link)
    ];
    final $request = Request('POST', $url, client.baseUrl,
        parts: $parts, multipart: true, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deletePdf(
      {required String accessToken, required int pdfId}) {
    final $url = '/teacher/delete_pdf';
    final $headers = {
      'Authorization': accessToken,
    };

    final $body = <String, dynamic>{'pdf_id': pdfId};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> getAssignment(
      {required String accessToken, required int courseId}) {
    final $url = '/teacher/get_assignment/$courseId';
    final $headers = {
      'Authorization': accessToken,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createAssignment(
      {required String accessToken,
      required int courseId,
      required String title}) {
    final $url = '/teacher/create_assignment';
    final $headers = {
      'Authorization': accessToken,
    };

    final $body = <String, dynamic>{'course_id': courseId, 'title': title};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> editAssignment(
      {required String accessToken,
      required int assignmentId,
      required String title}) {
    final $url = '/teacher/edit_assignment';
    final $headers = {
      'Authorization': accessToken,
    };

    final $body = <String, dynamic>{
      'assignment_id': assignmentId,
      'title': title
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> deleteAssignment(
      {required String accessToken, required int assignmentId}) {
    final $url = '/teacher/delete_assignment';
    final $headers = {
      'Authorization': accessToken,
    };

    final $body = <String, dynamic>{'assignment_id': assignmentId};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> getQuestions(
      {required String accessToken, required int assignmentId}) {
    final $url = '/teacher/get_question/$assignmentId';
    final $headers = {
      'Authorization': accessToken,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createQuestions(
      {required String accessToken,
      required int assignmentId,
      required String question,
      required String answer}) {
    final $url = '/teacher/create_question';
    final $headers = {
      'Authorization': accessToken,
    };

    final $body = <String, dynamic>{
      'assignment_id': assignmentId,
      'question': question,
      'answer': answer
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> editQuestions(
      {required String accessToken,
      required int questionId,
      String? question,
      String? answer}) {
    final $url = '/teacher/edit_question';
    final $headers = {
      'Authorization': accessToken,
    };

    final $body = <String, dynamic>{
      'question_id': questionId,
      'question': question,
      'answer': answer
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> deleteQuestions(
      {required String accessToken, required int questionId}) {
    final $url = '/teacher/delete_question';
    final $headers = {
      'Authorization': accessToken,
    };

    final $body = <String, dynamic>{'question_id': questionId};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> getChoices(
      {required String accessToken, required int questionId}) {
    final $url = '/teacher/get_choice/$questionId';
    final $headers = {
      'Authorization': accessToken,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createChoices(
      {required String accessToken,
      required int questionId,
      required String title}) {
    final $url = '/teacher/create_choice';
    final $headers = {
      'Authorization': accessToken,
    };

    final $body = <String, dynamic>{'question_id': questionId, 'title': title};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> editChoices(
      {required String accessToken,
      required int choiceId,
      required String title}) {
    final $url = '/teacher/edit_choice';
    final $headers = {
      'Authorization': accessToken,
    };

    final $body = <String, dynamic>{'choice_id': choiceId, 'title': title};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> deleteChoices(
      {required String accessToken, required int choiceId}) {
    final $url = '/teacher/delete_choice';
    final $headers = {
      'Authorization': accessToken,
    };

    final $body = <String, dynamic>{'choice_id': choiceId};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> sortChoices(
      {required String accessToken, required int questionId}) {
    final $url = '/teacher/sortChoices';
    final $headers = {
      'Authorization': accessToken,
    };

    final $body = <String, dynamic>{'question_id': questionId};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }
}
