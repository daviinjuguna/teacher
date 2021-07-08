import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:teacher/core/util/headers_interceptors.dart';
import 'package:teacher/core/util/logging_interceptor.dart';

abstract class TeacherService {
  Future<http.Response> login({
    required String email,
    required String password,
  });

  Future<http.Response> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<http.Response> refreshToken({required String refreshToken});

  Future<http.Response> getUser({required String accessToken});

  Future<http.Response> logout({required String accessToken});

  //* courses  //
  Future<http.Response> getCourses({
    required String accessToken,
    required int? page,
  });
  Future<http.Response> searchCourse({
    required String accessToken,
    required String query,
    required int? page,
  });

  Future<http.Response> createCourse({
    required String title,
    required String desc,
    required String photo,
    required String accessToken,
  });

  Future<http.Response> editCourse({
    required String accessToken,
    required int courseId,
    required String? title,
    required String? desc,
    required String? photo,
  });

  Future<http.Response> deleteCourse({
    required String accessToken,
    required int courseId,
  });

  //pdf
  Future<http.Response> getPdf({
    required int courseId,
    required String accessToken,
  });

  Future<http.Response> createPdf({
    required int courseId,
    required String accessToken,
    required String link,
    required String name,
  });

  Future<http.Response> editPdf({
    required int pdfId,
    required String accessToken,
    required String? link,
    required String? name,
  });

  Future<http.Response> deletePdf({
    required int pdfId,
    required String accessToken,
  });

  //assignment
  Future<http.Response> getAssignment({
    required int courseId,
    required String accessToken,
  });

  Future<http.Response> createAssignment({
    required int courseId,
    required String accessToken,
    required String title,
  });

  Future<http.Response> editAssignment({
    required int assignmentId,
    required String accessToken,
    required String title,
  });

  Future<http.Response> deleteAssignment({
    required int assignmentId,
    required String accessToken,
  });

  //question
  Future<http.Response> getQuestions({
    required int assignmentId,
    required String accessToken,
  });

  Future<http.Response> createQuestions({
    required int assignmentId,
    required String accessToken,
    required String question,
    required String answer,
  });

  Future<http.Response> editQuestions({
    required int questionId,
    required String accessToken,
    required String? question,
    required String? answer,
  });

  Future<http.Response> deleteQuestions({
    required int questionId,
    required String accessToken,
  });

  //choices
  Future<http.Response> getChoices({
    required int questionId,
    required String accessToken,
  });

  Future<http.Response> createChoices({
    required int questionId,
    required String accessToken,
    required String title,
  });

  Future<http.Response> editChoices({
    required int choiceId,
    required String accessToken,
    required String title,
  });

  Future<http.Response> deleteChoices({
    required int choiceId,
    required String accessToken,
  });

  //random choice
  Future<http.Response> sortChoices({
    required int questionId,
    required String accessToken,
  });

  Future<http.Response> setAnswer({
    required int questionId,
    required String accessToken,
    required int choiceId,
  });

  Future<http.Response> fetchFileFromUrl({required String url});

  //await manual choice
}

@LazySingleton(as: TeacherService)
class TeacherApiImpl implements TeacherService {
  http.Client client = InterceptedClient.build(
      interceptors: [
        LoggingInterceptor(),
        HeadersInterceptors(),
      ],
      requestTimeout: Duration(seconds: 60),
      client: IOClient(
        HttpClient()..idleTimeout = Duration(seconds: 15),
      ));

  @override
  Future<http.Response> login({
    required String email,
    required String password,
  }) {
    final String url = "/teacher/login";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
  }

  @override
  Future<http.Response> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    final String url = "/teacher/register";
    return client.post(Uri.https(BASE_URL, url),
        headers: {"Accept": "application/json"},
        body: jsonEncode(
          {
            "name": name,
            "email": email,
            "password": password,
            "password_confirmation": confirmPassword
          },
        ));
  }

  @override
  Future<http.Response> getUser({required String accessToken}) {
    final String url = "/teacher/user";
    return client.get(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
    );
  }

  @override
  Future<http.Response> logout({required String accessToken}) {
    final String url = "/teacher/logout";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
    );
  }

  @override
  Future<http.Response> refreshToken({required String refreshToken}) {
    final String url = "/teacher/refresh";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {"Accept": "application/json"},
      body: jsonEncode({"refresh_token": refreshToken}),
    );
  }

  @override
  Future<http.Response> createCourse({
    required String title,
    required String desc,
    required String photo,
    required String accessToken,
  }) async {
    final String url = "/teacher/create_course";
    final request = http.MultipartRequest(
      'POST',
      Uri.https(BASE_URL, url),
    )
      ..headers.addAll({
        "Accept": "application/json",
        'Authorization': accessToken,
      })
      ..fields['title'] = title
      ..fields['description'] = desc
      ..files.add(
        await http.MultipartFile.fromPath(
          'photo',
          photo,
          contentType: MediaType('application', 'png'),
        ),
      );

    return http.Response.fromStream(await request.send());
  }

  @override
  Future<http.Response> editCourse({
    required int courseId,
    required String accessToken,
    required String? title,
    required String? desc,
    required String? photo,
  }) async {
    final String url = "/teacher/edit_course";
    final request = http.MultipartRequest(
      'POST',
      Uri.https(BASE_URL, url),
    )
      ..headers.addAll({
        "Accept": "application/json",
        'Authorization': accessToken,
      })
      ..fields['title'] = title ?? ""
      ..fields['course_id'] = "$courseId"
      ..fields['description'] = desc ?? "";
    if (photo != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'photo',
          photo,
          contentType: MediaType('application', 'png'),
        ),
      );
    }

    return http.Response.fromStream(await request.send());
  }

  @override
  Future<http.Response> deleteCourse({
    required int courseId,
    required String accessToken,
  }) async {
    final String url = "/teacher/delete_course";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
      body: jsonEncode({"course_id": "$courseId"}),
    );
  }

  @override
  Future<http.Response> getCourses(
      {required String accessToken, required int? page}) {
    final String url = "/teacher/get_course";
    final _query = {"page": page?.toString() ?? ""};
    return client.get(
      Uri.https(BASE_URL, url, _query),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
    );
  }

  @override
  Future<http.Response> searchCourse({
    required String accessToken,
    required String query,
    required int? page,
  }) {
    final String url = "/teacher/search_course/$query";
    final _query = {"page": page?.toString() ?? ""};
    return client.get(
      Uri.https(BASE_URL, url, _query),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
    );
  }

  //Pdf
  @override
  Future<http.Response> getPdf({
    required int courseId,
    required String accessToken,
  }) {
    final String url = "teacher/get_pdf/$courseId";
    return client.get(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
    );
  }

  @override
  Future<http.Response> createPdf({
    required int courseId,
    required String accessToken,
    required String link,
    required String name,
  }) async {
    final String url = "/teacher/create_pdf";
    final request = http.MultipartRequest(
      'POST',
      Uri.https(BASE_URL, url),
    )
      ..headers.addAll({
        "Accept": "application/json",
        'Authorization': accessToken,
      })
      ..fields['name'] = name
      ..fields['course_id'] = "$courseId"
      ..files.add(
        await http.MultipartFile.fromPath(
          'link',
          link,
          contentType: MediaType('application', 'pdf'),
        ),
      );

    return http.Response.fromStream(await request.send());
  }

  @override
  Future<http.Response> editPdf({
    required int pdfId,
    required String accessToken,
    String? link,
    String? name,
  }) async {
    final String url = "/teacher/edit_pdf";
    final request = http.MultipartRequest(
      'POST',
      Uri.https(BASE_URL, url),
    )
      ..headers.addAll({
        "Accept": "application/json",
        'Authorization': accessToken,
      })
      ..fields['name'] = name ?? ""
      ..fields['pdf_id'] = "$pdfId";
    if (link != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'link',
          link,
          contentType: MediaType('application', 'pdf'),
        ),
      );
    }

    return http.Response.fromStream(await request.send());
  }

  @override
  Future<http.Response> deletePdf({
    required int pdfId,
    required String accessToken,
  }) {
    final String url = "/teacher/delete_pdf";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
      body: jsonEncode({"pdf_id": "$pdfId"}),
    );
  }

  @override
  Future<http.Response> getAssignment(
      {required int courseId, required String accessToken}) {
    final String url = "teacher/get_assignment/$courseId";
    return client.get(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
    );
  }

  @override
  Future<http.Response> createAssignment({
    required int courseId,
    required String accessToken,
    required String title,
  }) {
    final String url = "teacher/create_assignment";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
      body: jsonEncode({
        "course_id": "$courseId",
        "title": title,
      }),
    );
  }

  @override
  Future<http.Response> editAssignment({
    required int assignmentId,
    required String accessToken,
    required String title,
  }) {
    final String url = "teacher/edit_assignment";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
      body: jsonEncode({
        "assignment_id": "$assignmentId",
        "title": title,
      }),
    );
  }

  @override
  Future<http.Response> deleteAssignment({
    required int assignmentId,
    required String accessToken,
  }) {
    final String url = "teacher/delete_assignment";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
      body: jsonEncode({
        "assignment_id": "$assignmentId",
      }),
    );
  }

  @override
  Future<http.Response> getQuestions(
      {required int assignmentId, required String accessToken}) {
    final String url = "teacher/get_question/$assignmentId";
    return client.get(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
    );
  }

  @override
  Future<http.Response> createQuestions({
    required int assignmentId,
    required String accessToken,
    required String question,
    required String answer,
  }) {
    final String url = "teacher/create_question";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
      body: jsonEncode({
        "assignment_id": "$assignmentId",
        "question": question,
        "answer": answer,
      }),
    );
  }

  @override
  Future<http.Response> editQuestions({
    required int questionId,
    required String accessToken,
    required String? question,
    required String? answer,
  }) {
    final String url = "teacher/edit_question";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
      body: jsonEncode({
        "question_id": "$questionId",
        "question": question ?? "",
        "answer": answer ?? "",
      }),
    );
  }

  @override
  Future<http.Response> deleteQuestions({
    required int questionId,
    required String accessToken,
  }) {
    final String url = "teacher/delete_question";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
      body: jsonEncode({
        "question_id": "$questionId",
      }),
    );
  }

  @override
  Future<http.Response> getChoices({
    required int questionId,
    required String accessToken,
  }) {
    final String url = "teacher/get_choice/$questionId";
    return client.get(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
    );
  }

  @override
  Future<http.Response> createChoices({
    required int questionId,
    required String accessToken,
    required String title,
  }) {
    final String url = "teacher/create_choice";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
      body: jsonEncode({
        "question_id": "$questionId",
        "title": title,
      }),
    );
  }

  @override
  Future<http.Response> editChoices({
    required int choiceId,
    required String accessToken,
    required String title,
  }) {
    final String url = "teacher/edit_choice";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
      body: jsonEncode({
        "choice_id": "$choiceId",
        "title": title,
      }),
    );
  }

  @override
  Future<http.Response> deleteChoices({
    required int choiceId,
    required String accessToken,
  }) {
    final String url = "teacher/delete_choice";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
      body: jsonEncode({"choice_id": "$choiceId"}),
    );
  }

  @override
  Future<http.Response> sortChoices({
    required int questionId,
    required String accessToken,
  }) {
    final String url = "teacher/sort_random";
    return client.post(
      Uri.https(BASE_URL, url),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
      body: jsonEncode({"question_id": "$questionId"}),
    );
  }

  @override
  Future<http.Response> setAnswer({
    required int questionId,
    required String accessToken,
    required int choiceId,
  }) {
    final String url = "teacher/set_ans";
    final queryParameters = {
      "choice_id": "$choiceId",
      "question_id": "$questionId"
    };
    return client.put(
      Uri.https(BASE_URL, url, queryParameters),
      headers: {
        "Accept": "application/json",
        'Authorization': accessToken,
      },
      body: jsonEncode({"question_id": "$questionId"}),
    );
  }

  @override
  Future<http.Response> fetchFileFromUrl({required String url}) {
    final String _url = "/$url";
    return client.get(
      Uri.https(BASE_URL, _url),
      headers: {
        "Accept": "application/json",
      },
    );
  }
}
