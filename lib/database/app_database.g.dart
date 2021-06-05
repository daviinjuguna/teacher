// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CourseDataClass extends DataClass implements Insertable<CourseDataClass> {
  final int id;
  final String title;
  final String desc;
  final String photo;
  final int? appCount;
  final bool? applied;
  final UserModel? teachedBy;
  CourseDataClass(
      {required this.id,
      required this.title,
      required this.desc,
      required this.photo,
      this.appCount,
      this.applied,
      this.teachedBy});
  factory CourseDataClass.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CourseDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}desc'])!,
      photo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}photo'])!,
      appCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}app_count']),
      applied: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}applied']),
      teachedBy: $CourseTableTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}teached_by'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['desc'] = Variable<String>(desc);
    map['photo'] = Variable<String>(photo);
    if (!nullToAbsent || appCount != null) {
      map['app_count'] = Variable<int?>(appCount);
    }
    if (!nullToAbsent || applied != null) {
      map['applied'] = Variable<bool?>(applied);
    }
    if (!nullToAbsent || teachedBy != null) {
      final converter = $CourseTableTable.$converter0;
      map['teached_by'] = Variable<String?>(converter.mapToSql(teachedBy));
    }
    return map;
  }

  CourseTableCompanion toCompanion(bool nullToAbsent) {
    return CourseTableCompanion(
      id: Value(id),
      title: Value(title),
      desc: Value(desc),
      photo: Value(photo),
      appCount: appCount == null && nullToAbsent
          ? const Value.absent()
          : Value(appCount),
      applied: applied == null && nullToAbsent
          ? const Value.absent()
          : Value(applied),
      teachedBy: teachedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(teachedBy),
    );
  }

  factory CourseDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CourseDataClass(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      desc: serializer.fromJson<String>(json['desc']),
      photo: serializer.fromJson<String>(json['photo']),
      appCount: serializer.fromJson<int?>(json['appCount']),
      applied: serializer.fromJson<bool?>(json['applied']),
      teachedBy: serializer.fromJson<UserModel?>(json['teachedBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'desc': serializer.toJson<String>(desc),
      'photo': serializer.toJson<String>(photo),
      'appCount': serializer.toJson<int?>(appCount),
      'applied': serializer.toJson<bool?>(applied),
      'teachedBy': serializer.toJson<UserModel?>(teachedBy),
    };
  }

  CourseDataClass copyWith(
          {int? id,
          String? title,
          String? desc,
          String? photo,
          int? appCount,
          bool? applied,
          UserModel? teachedBy}) =>
      CourseDataClass(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        photo: photo ?? this.photo,
        appCount: appCount ?? this.appCount,
        applied: applied ?? this.applied,
        teachedBy: teachedBy ?? this.teachedBy,
      );
  @override
  String toString() {
    return (StringBuffer('CourseDataClass(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc, ')
          ..write('photo: $photo, ')
          ..write('appCount: $appCount, ')
          ..write('applied: $applied, ')
          ..write('teachedBy: $teachedBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              desc.hashCode,
              $mrjc(
                  photo.hashCode,
                  $mrjc(appCount.hashCode,
                      $mrjc(applied.hashCode, teachedBy.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseDataClass &&
          other.id == this.id &&
          other.title == this.title &&
          other.desc == this.desc &&
          other.photo == this.photo &&
          other.appCount == this.appCount &&
          other.applied == this.applied &&
          other.teachedBy == this.teachedBy);
}

class CourseTableCompanion extends UpdateCompanion<CourseDataClass> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> desc;
  final Value<String> photo;
  final Value<int?> appCount;
  final Value<bool?> applied;
  final Value<UserModel?> teachedBy;
  const CourseTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.desc = const Value.absent(),
    this.photo = const Value.absent(),
    this.appCount = const Value.absent(),
    this.applied = const Value.absent(),
    this.teachedBy = const Value.absent(),
  });
  CourseTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String desc,
    this.photo = const Value.absent(),
    this.appCount = const Value.absent(),
    this.applied = const Value.absent(),
    this.teachedBy = const Value.absent(),
  })  : title = Value(title),
        desc = Value(desc);
  static Insertable<CourseDataClass> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? desc,
    Expression<String>? photo,
    Expression<int?>? appCount,
    Expression<bool?>? applied,
    Expression<UserModel?>? teachedBy,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (desc != null) 'desc': desc,
      if (photo != null) 'photo': photo,
      if (appCount != null) 'app_count': appCount,
      if (applied != null) 'applied': applied,
      if (teachedBy != null) 'teached_by': teachedBy,
    });
  }

  CourseTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? desc,
      Value<String>? photo,
      Value<int?>? appCount,
      Value<bool?>? applied,
      Value<UserModel?>? teachedBy}) {
    return CourseTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      photo: photo ?? this.photo,
      appCount: appCount ?? this.appCount,
      applied: applied ?? this.applied,
      teachedBy: teachedBy ?? this.teachedBy,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    if (appCount.present) {
      map['app_count'] = Variable<int?>(appCount.value);
    }
    if (applied.present) {
      map['applied'] = Variable<bool?>(applied.value);
    }
    if (teachedBy.present) {
      final converter = $CourseTableTable.$converter0;
      map['teached_by'] =
          Variable<String?>(converter.mapToSql(teachedBy.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc, ')
          ..write('photo: $photo, ')
          ..write('appCount: $appCount, ')
          ..write('applied: $applied, ')
          ..write('teachedBy: $teachedBy')
          ..write(')'))
        .toString();
  }
}

class $CourseTableTable extends CourseTable
    with TableInfo<$CourseTableTable, CourseDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CourseTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedTextColumn desc = _constructDesc();
  GeneratedTextColumn _constructDesc() {
    return GeneratedTextColumn(
      'desc',
      $tableName,
      false,
    );
  }

  final VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedTextColumn photo = _constructPhoto();
  GeneratedTextColumn _constructPhoto() {
    return GeneratedTextColumn('photo', $tableName, false,
        defaultValue: Constant(""));
  }

  final VerificationMeta _appCountMeta = const VerificationMeta('appCount');
  @override
  late final GeneratedIntColumn appCount = _constructAppCount();
  GeneratedIntColumn _constructAppCount() {
    return GeneratedIntColumn(
      'app_count',
      $tableName,
      true,
    );
  }

  final VerificationMeta _appliedMeta = const VerificationMeta('applied');
  @override
  late final GeneratedBoolColumn applied = _constructApplied();
  GeneratedBoolColumn _constructApplied() {
    return GeneratedBoolColumn(
      'applied',
      $tableName,
      true,
    );
  }

  final VerificationMeta _teachedByMeta = const VerificationMeta('teachedBy');
  @override
  late final GeneratedTextColumn teachedBy = _constructTeachedBy();
  GeneratedTextColumn _constructTeachedBy() {
    return GeneratedTextColumn(
      'teached_by',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, desc, photo, appCount, applied, teachedBy];
  @override
  $CourseTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'course_table';
  @override
  final String actualTableName = 'course_table';
  @override
  VerificationContext validateIntegrity(Insertable<CourseDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    }
    if (data.containsKey('app_count')) {
      context.handle(_appCountMeta,
          appCount.isAcceptableOrUnknown(data['app_count']!, _appCountMeta));
    }
    if (data.containsKey('applied')) {
      context.handle(_appliedMeta,
          applied.isAcceptableOrUnknown(data['applied']!, _appliedMeta));
    }
    context.handle(_teachedByMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CourseDataClass.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CourseTableTable createAlias(String alias) {
    return $CourseTableTable(_db, alias);
  }

  static TypeConverter<UserModel, String> $converter0 =
      const UserModelConverter();
}

class UserDataClass extends DataClass implements Insertable<UserDataClass> {
  final String name;
  final String email;
  final String status;
  final String createdAt;
  UserDataClass(
      {required this.name,
      required this.email,
      required this.status,
      required this.createdAt});
  factory UserDataClass.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserDataClass(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      name: Value(name),
      email: Value(email),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory UserDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserDataClass(
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  UserDataClass copyWith(
          {String? name, String? email, String? status, String? createdAt}) =>
      UserDataClass(
        name: name ?? this.name,
        email: email ?? this.email,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('UserDataClass(')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(name.hashCode,
      $mrjc(email.hashCode, $mrjc(status.hashCode, createdAt.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDataClass &&
          other.name == this.name &&
          other.email == this.email &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class UserTableCompanion extends UpdateCompanion<UserDataClass> {
  final Value<String> name;
  final Value<String> email;
  final Value<String> status;
  final Value<String> createdAt;
  const UserTableCompanion({
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UserTableCompanion.insert({
    required String name,
    required String email,
    required String status,
    required String createdAt,
  })  : name = Value(name),
        email = Value(email),
        status = Value(status),
        createdAt = Value(createdAt);
  static Insertable<UserDataClass> custom({
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? status,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UserTableCompanion copyWith(
      {Value<String>? name,
      Value<String>? email,
      Value<String>? status,
      Value<String>? createdAt}) {
    return UserTableCompanion(
      name: name ?? this.name,
      email: email ?? this.email,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UserTableTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedTextColumn email = _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedTextColumn status = _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedTextColumn createdAt = _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [name, email, status, createdAt];
  @override
  $UserTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'user_table';
  @override
  final String actualTableName = 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  UserDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserDataClass.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(_db, alias);
  }
}

class AssignmentDataClass extends DataClass
    implements Insertable<AssignmentDataClass> {
  final int id;
  final String title;
  final int? questions;
  final AttemptedModel? attempted;
  AssignmentDataClass(
      {required this.id, required this.title, this.questions, this.attempted});
  factory AssignmentDataClass.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AssignmentDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      questions: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}questions']),
      attempted: $AssignmentTableTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}attempted'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || questions != null) {
      map['questions'] = Variable<int?>(questions);
    }
    if (!nullToAbsent || attempted != null) {
      final converter = $AssignmentTableTable.$converter0;
      map['attempted'] = Variable<String?>(converter.mapToSql(attempted));
    }
    return map;
  }

  AssignmentTableCompanion toCompanion(bool nullToAbsent) {
    return AssignmentTableCompanion(
      id: Value(id),
      title: Value(title),
      questions: questions == null && nullToAbsent
          ? const Value.absent()
          : Value(questions),
      attempted: attempted == null && nullToAbsent
          ? const Value.absent()
          : Value(attempted),
    );
  }

  factory AssignmentDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AssignmentDataClass(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      questions: serializer.fromJson<int?>(json['questions']),
      attempted: serializer.fromJson<AttemptedModel?>(json['attempted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'questions': serializer.toJson<int?>(questions),
      'attempted': serializer.toJson<AttemptedModel?>(attempted),
    };
  }

  AssignmentDataClass copyWith(
          {int? id,
          String? title,
          int? questions,
          AttemptedModel? attempted}) =>
      AssignmentDataClass(
        id: id ?? this.id,
        title: title ?? this.title,
        questions: questions ?? this.questions,
        attempted: attempted ?? this.attempted,
      );
  @override
  String toString() {
    return (StringBuffer('AssignmentDataClass(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('questions: $questions, ')
          ..write('attempted: $attempted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(questions.hashCode, attempted.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssignmentDataClass &&
          other.id == this.id &&
          other.title == this.title &&
          other.questions == this.questions &&
          other.attempted == this.attempted);
}

class AssignmentTableCompanion extends UpdateCompanion<AssignmentDataClass> {
  final Value<int> id;
  final Value<String> title;
  final Value<int?> questions;
  final Value<AttemptedModel?> attempted;
  const AssignmentTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.questions = const Value.absent(),
    this.attempted = const Value.absent(),
  });
  AssignmentTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.questions = const Value.absent(),
    this.attempted = const Value.absent(),
  }) : title = Value(title);
  static Insertable<AssignmentDataClass> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int?>? questions,
    Expression<AttemptedModel?>? attempted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (questions != null) 'questions': questions,
      if (attempted != null) 'attempted': attempted,
    });
  }

  AssignmentTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<int?>? questions,
      Value<AttemptedModel?>? attempted}) {
    return AssignmentTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      questions: questions ?? this.questions,
      attempted: attempted ?? this.attempted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (questions.present) {
      map['questions'] = Variable<int?>(questions.value);
    }
    if (attempted.present) {
      final converter = $AssignmentTableTable.$converter0;
      map['attempted'] = Variable<String?>(converter.mapToSql(attempted.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssignmentTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('questions: $questions, ')
          ..write('attempted: $attempted')
          ..write(')'))
        .toString();
  }
}

class $AssignmentTableTable extends AssignmentTable
    with TableInfo<$AssignmentTableTable, AssignmentDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AssignmentTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _questionsMeta = const VerificationMeta('questions');
  @override
  late final GeneratedIntColumn questions = _constructQuestions();
  GeneratedIntColumn _constructQuestions() {
    return GeneratedIntColumn(
      'questions',
      $tableName,
      true,
    );
  }

  final VerificationMeta _attemptedMeta = const VerificationMeta('attempted');
  @override
  late final GeneratedTextColumn attempted = _constructAttempted();
  GeneratedTextColumn _constructAttempted() {
    return GeneratedTextColumn(
      'attempted',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, questions, attempted];
  @override
  $AssignmentTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'assignment_table';
  @override
  final String actualTableName = 'assignment_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AssignmentDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('questions')) {
      context.handle(_questionsMeta,
          questions.isAcceptableOrUnknown(data['questions']!, _questionsMeta));
    }
    context.handle(_attemptedMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssignmentDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AssignmentDataClass.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AssignmentTableTable createAlias(String alias) {
    return $AssignmentTableTable(_db, alias);
  }

  static TypeConverter<AttemptedModel, String> $converter0 =
      const AttemptedModelConverter();
}

class PdfDataClass extends DataClass implements Insertable<PdfDataClass> {
  final int id;
  final String name;
  final String pdfDoc;
  PdfDataClass({required this.id, required this.name, required this.pdfDoc});
  factory PdfDataClass.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PdfDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      pdfDoc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pdf_doc'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['pdf_doc'] = Variable<String>(pdfDoc);
    return map;
  }

  PdfTableCompanion toCompanion(bool nullToAbsent) {
    return PdfTableCompanion(
      id: Value(id),
      name: Value(name),
      pdfDoc: Value(pdfDoc),
    );
  }

  factory PdfDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PdfDataClass(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      pdfDoc: serializer.fromJson<String>(json['pdfDoc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'pdfDoc': serializer.toJson<String>(pdfDoc),
    };
  }

  PdfDataClass copyWith({int? id, String? name, String? pdfDoc}) =>
      PdfDataClass(
        id: id ?? this.id,
        name: name ?? this.name,
        pdfDoc: pdfDoc ?? this.pdfDoc,
      );
  @override
  String toString() {
    return (StringBuffer('PdfDataClass(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pdfDoc: $pdfDoc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, pdfDoc.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PdfDataClass &&
          other.id == this.id &&
          other.name == this.name &&
          other.pdfDoc == this.pdfDoc);
}

class PdfTableCompanion extends UpdateCompanion<PdfDataClass> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> pdfDoc;
  const PdfTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.pdfDoc = const Value.absent(),
  });
  PdfTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String pdfDoc,
  })  : name = Value(name),
        pdfDoc = Value(pdfDoc);
  static Insertable<PdfDataClass> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? pdfDoc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (pdfDoc != null) 'pdf_doc': pdfDoc,
    });
  }

  PdfTableCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? pdfDoc}) {
    return PdfTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      pdfDoc: pdfDoc ?? this.pdfDoc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (pdfDoc.present) {
      map['pdf_doc'] = Variable<String>(pdfDoc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PdfTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pdfDoc: $pdfDoc')
          ..write(')'))
        .toString();
  }
}

class $PdfTableTable extends PdfTable
    with TableInfo<$PdfTableTable, PdfDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PdfTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pdfDocMeta = const VerificationMeta('pdfDoc');
  @override
  late final GeneratedTextColumn pdfDoc = _constructPdfDoc();
  GeneratedTextColumn _constructPdfDoc() {
    return GeneratedTextColumn(
      'pdf_doc',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, pdfDoc];
  @override
  $PdfTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'pdf_table';
  @override
  final String actualTableName = 'pdf_table';
  @override
  VerificationContext validateIntegrity(Insertable<PdfDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('pdf_doc')) {
      context.handle(_pdfDocMeta,
          pdfDoc.isAcceptableOrUnknown(data['pdf_doc']!, _pdfDocMeta));
    } else if (isInserting) {
      context.missing(_pdfDocMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PdfDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PdfDataClass.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PdfTableTable createAlias(String alias) {
    return $PdfTableTable(_db, alias);
  }
}

class QuestionTableData extends DataClass
    implements Insertable<QuestionTableData> {
  final int id;
  final String question;
  final List<ChoiceModel>? choices;
  QuestionTableData({required this.id, required this.question, this.choices});
  factory QuestionTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return QuestionTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      question: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}question'])!,
      choices: $QuestionTableTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}choices'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['question'] = Variable<String>(question);
    if (!nullToAbsent || choices != null) {
      final converter = $QuestionTableTable.$converter0;
      map['choices'] = Variable<String?>(converter.mapToSql(choices));
    }
    return map;
  }

  QuestionTableCompanion toCompanion(bool nullToAbsent) {
    return QuestionTableCompanion(
      id: Value(id),
      question: Value(question),
      choices: choices == null && nullToAbsent
          ? const Value.absent()
          : Value(choices),
    );
  }

  factory QuestionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return QuestionTableData(
      id: serializer.fromJson<int>(json['id']),
      question: serializer.fromJson<String>(json['question']),
      choices: serializer.fromJson<List<ChoiceModel>?>(json['choices']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'question': serializer.toJson<String>(question),
      'choices': serializer.toJson<List<ChoiceModel>?>(choices),
    };
  }

  QuestionTableData copyWith(
          {int? id, String? question, List<ChoiceModel>? choices}) =>
      QuestionTableData(
        id: id ?? this.id,
        question: question ?? this.question,
        choices: choices ?? this.choices,
      );
  @override
  String toString() {
    return (StringBuffer('QuestionTableData(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('choices: $choices')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(question.hashCode, choices.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionTableData &&
          other.id == this.id &&
          other.question == this.question &&
          other.choices == this.choices);
}

class QuestionTableCompanion extends UpdateCompanion<QuestionTableData> {
  final Value<int> id;
  final Value<String> question;
  final Value<List<ChoiceModel>?> choices;
  const QuestionTableCompanion({
    this.id = const Value.absent(),
    this.question = const Value.absent(),
    this.choices = const Value.absent(),
  });
  QuestionTableCompanion.insert({
    this.id = const Value.absent(),
    required String question,
    this.choices = const Value.absent(),
  }) : question = Value(question);
  static Insertable<QuestionTableData> custom({
    Expression<int>? id,
    Expression<String>? question,
    Expression<List<ChoiceModel>?>? choices,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (question != null) 'question': question,
      if (choices != null) 'choices': choices,
    });
  }

  QuestionTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? question,
      Value<List<ChoiceModel>?>? choices}) {
    return QuestionTableCompanion(
      id: id ?? this.id,
      question: question ?? this.question,
      choices: choices ?? this.choices,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (choices.present) {
      final converter = $QuestionTableTable.$converter0;
      map['choices'] = Variable<String?>(converter.mapToSql(choices.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionTableCompanion(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('choices: $choices')
          ..write(')'))
        .toString();
  }
}

class $QuestionTableTable extends QuestionTable
    with TableInfo<$QuestionTableTable, QuestionTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $QuestionTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _questionMeta = const VerificationMeta('question');
  @override
  late final GeneratedTextColumn question = _constructQuestion();
  GeneratedTextColumn _constructQuestion() {
    return GeneratedTextColumn(
      'question',
      $tableName,
      false,
    );
  }

  final VerificationMeta _choicesMeta = const VerificationMeta('choices');
  @override
  late final GeneratedTextColumn choices = _constructChoices();
  GeneratedTextColumn _constructChoices() {
    return GeneratedTextColumn(
      'choices',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, question, choices];
  @override
  $QuestionTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'question_table';
  @override
  final String actualTableName = 'question_table';
  @override
  VerificationContext validateIntegrity(Insertable<QuestionTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    context.handle(_choicesMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return QuestionTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $QuestionTableTable createAlias(String alias) {
    return $QuestionTableTable(_db, alias);
  }

  static TypeConverter<List<ChoiceModel>, String> $converter0 =
      const ChoiceModelConverter();
}

class ChoiceTableData extends DataClass implements Insertable<ChoiceTableData> {
  final int id;
  final String title;
  ChoiceTableData({required this.id, required this.title});
  factory ChoiceTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ChoiceTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  ChoiceTableCompanion toCompanion(bool nullToAbsent) {
    return ChoiceTableCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory ChoiceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ChoiceTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  ChoiceTableData copyWith({int? id, String? title}) => ChoiceTableData(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('ChoiceTableData(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, title.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChoiceTableData &&
          other.id == this.id &&
          other.title == this.title);
}

class ChoiceTableCompanion extends UpdateCompanion<ChoiceTableData> {
  final Value<int> id;
  final Value<String> title;
  const ChoiceTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  ChoiceTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<ChoiceTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  ChoiceTableCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return ChoiceTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChoiceTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $ChoiceTableTable extends ChoiceTable
    with TableInfo<$ChoiceTableTable, ChoiceTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ChoiceTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  $ChoiceTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'choice_table';
  @override
  final String actualTableName = 'choice_table';
  @override
  VerificationContext validateIntegrity(Insertable<ChoiceTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChoiceTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ChoiceTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChoiceTableTable createAlias(String alias) {
    return $ChoiceTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CourseTableTable courseTable = $CourseTableTable(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $AssignmentTableTable assignmentTable =
      $AssignmentTableTable(this);
  late final $PdfTableTable pdfTable = $PdfTableTable(this);
  late final $QuestionTableTable questionTable = $QuestionTableTable(this);
  late final $ChoiceTableTable choiceTable = $ChoiceTableTable(this);
  late final CourseDao courseDao = CourseDao(this as AppDatabase);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final AssignmentDao assignmentDao = AssignmentDao(this as AppDatabase);
  late final PdfDao pdfDao = PdfDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        courseTable,
        userTable,
        assignmentTable,
        pdfTable,
        questionTable,
        choiceTable
      ];
}
