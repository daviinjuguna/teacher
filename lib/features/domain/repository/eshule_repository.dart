import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:kt_dart/kt.dart';
import 'package:teacher/features/domain/entities/assignment.dart';
import 'package:teacher/features/domain/entities/choice.dart';
import 'package:teacher/features/domain/entities/course.dart';
import 'package:teacher/features/domain/entities/course_paginated.dart';
import 'package:teacher/features/domain/entities/pdf.dart';
import 'package:teacher/features/domain/entities/question.dart';
import 'package:teacher/features/domain/entities/success.dart';
import 'package:teacher/features/domain/entities/token.dart';
import 'package:teacher/features/domain/entities/user.dart';

abstract class Repository {
  Future<Either<String, Token>> login({
    required String email,
    required String password,
  });
  Future<Either<String, Token>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });
  Future<Either<String, Token>> refreshToken();
  Future<Either<String, User>> getUser();
  Future<Either<String, void>> logout();
  Future<Either<String, void>> clearPrefs();

  //connection Checker
  Stream<Either<String, bool>> checkConnection();

  //authChecker
  Future<Either<String, bool>> checkAuth();

  //pickFiles
  Future<Either<String, String?>> pickFiles();
  //pickMultipleFiles
  Future<Either<String, List<String?>>> pickMultipleFiles();
  //pick image
  Future<Either<String, String>> fetchImageUrl({required String url});

  //battery checker
  Stream<Either<String, String>> checkBattery();

  //Fetch Course
  Future<Either<String, CoursePaginated>> getCourses({
    String? query,
    required int? page,
  });
//Update
  Future<Either<String, CoursePaginated>> updateCourse();

  Future<Either<String, KtList<Pdf>>> getPdf({required int courseId});
  Future<Either<String, KtList<Pdf>>> updatePdf({required int courseId});
  Future<Either<String, KtList<Assignment>>> getAssignment({
    required int courseId,
  });
  Future<Either<String, KtList<Assignment>>> updateAssignment({
    required int courseId,
  });
  Future<Either<String, KtList<Question>>> getQuestion({
    required int assignmentId,
  });
  Future<Either<String, KtList<Question>>> updateQuestion({
    required int assignmentId,
  });
  Future<Either<String, KtList<Choice>>> getChoice({required int questionId});
  Future<Either<String, KtList<Choice>>> updateChoice(
      {required int questionId});

  Future<Either<String, Success>> createCourse({
    required String title,
    required String desc,
    required String photo,
  });
  Future<Either<String, Success>> editCourse({
    required int courseId,
    required String? title,
    required String? desc,
    required String? photo,
  });
  Future<Either<String, Success>> deleteCourse({
    required int courseId,
  });
  Future<Either<String, File>> urlToFile({required String url});

  Future<Either<String, Success>> createPdf({
    required int courseId,
    required String title,
    required String pdf,
  });
  Future<Either<String, Success>> editPdf({
    required int pdfId,
    required String? title,
    required String? pdf,
  });
  Future<Either<String, Success>> deletePdf({
    required int pdfId,
  });
  Future<Either<String, Success>> createAssignment({
    required int courseId,
    required String title,
  });
  Future<Either<String, Success>> editAssignment({
    required int assignmentId,
    required String title,
  });
  Future<Either<String, Success>> deleteAssignment({
    required int assignmentId,
  });
  Future<Either<String, Success>> createQuestion({
    required int assignmentId,
    required String question,
    required String answer,
  });
  Future<Either<String, Success>> editQuestion({
    required int questionId,
    required String? question,
    required String? answer,
  });
  Future<Either<String, Success>> deleteQuestion({
    required int questionId,
  });
  Future<Either<String, Success>> createChoice({
    required int questionId,
    required String title,
  });
  Future<Either<String, Success>> editChoice({
    required int choiceId,
    required String title,
  });
  Future<Either<String, Success>> deleteChoice({
    required int choiceId,
  });
  Future<Either<String, KtList<Choice>>> sortChoice({
    required int questionId,
  });
  Future<Either<String, Success>> selectAnswer({
    required int choiceId,
    required int questionId,
  });
  Future<Either<String, dynamic>> saveToRecentSearches(String? searchText);
  Future<Either<String, List<String>?>> getRecentSearchesLike(String? query);
}
