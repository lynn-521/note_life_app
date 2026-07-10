// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MembersTable extends Members with TableInfo<$MembersTable, Member> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
      'avatar', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<MemberRole, String> role =
      GeneratedColumn<String>('role', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<MemberRole>($MembersTable.$converterrole);
  static const VerificationMeta _wxUidMeta = const VerificationMeta('wxUid');
  @override
  late final GeneratedColumn<String> wxUid = GeneratedColumn<String>(
      'wx_uid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        avatar,
        role,
        wxUid,
        color,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'members';
  @override
  VerificationContext validateIntegrity(Insertable<Member> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    }
    if (data.containsKey('wx_uid')) {
      context.handle(
          _wxUidMeta, wxUid.isAcceptableOrUnknown(data['wx_uid']!, _wxUidMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Member map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Member(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      avatar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar']),
      role: $MembersTable.$converterrole.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!),
      wxUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wx_uid']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $MembersTable createAlias(String alias) {
    return $MembersTable(attachedDatabase, alias);
  }

  static TypeConverter<MemberRole, String> $converterrole =
      const EnumConverter<MemberRole>(MemberRole.values);
}

class Member extends DataClass implements Insertable<Member> {
  final String id;
  final String name;
  final String? avatar;
  final MemberRole role;
  final String? wxUid;
  final int color;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const Member(
      {required this.id,
      required this.name,
      this.avatar,
      required this.role,
      this.wxUid,
      required this.color,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    {
      map['role'] = Variable<String>($MembersTable.$converterrole.toSql(role));
    }
    if (!nullToAbsent || wxUid != null) {
      map['wx_uid'] = Variable<String>(wxUid);
    }
    map['color'] = Variable<int>(color);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  MembersCompanion toCompanion(bool nullToAbsent) {
    return MembersCompanion(
      id: Value(id),
      name: Value(name),
      avatar:
          avatar == null && nullToAbsent ? const Value.absent() : Value(avatar),
      role: Value(role),
      wxUid:
          wxUid == null && nullToAbsent ? const Value.absent() : Value(wxUid),
      color: Value(color),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Member.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Member(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      role: serializer.fromJson<MemberRole>(json['role']),
      wxUid: serializer.fromJson<String?>(json['wxUid']),
      color: serializer.fromJson<int>(json['color']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'avatar': serializer.toJson<String?>(avatar),
      'role': serializer.toJson<MemberRole>(role),
      'wxUid': serializer.toJson<String?>(wxUid),
      'color': serializer.toJson<int>(color),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Member copyWith(
          {String? id,
          String? name,
          Value<String?> avatar = const Value.absent(),
          MemberRole? role,
          Value<String?> wxUid = const Value.absent(),
          int? color,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Member(
        id: id ?? this.id,
        name: name ?? this.name,
        avatar: avatar.present ? avatar.value : this.avatar,
        role: role ?? this.role,
        wxUid: wxUid.present ? wxUid.value : this.wxUid,
        color: color ?? this.color,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Member copyWithCompanion(MembersCompanion data) {
    return Member(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
      role: data.role.present ? data.role.value : this.role,
      wxUid: data.wxUid.present ? data.wxUid.value : this.wxUid,
      color: data.color.present ? data.color.value : this.color,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Member(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar, ')
          ..write('role: $role, ')
          ..write('wxUid: $wxUid, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, avatar, role, wxUid, color,
      createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          other.id == this.id &&
          other.name == this.name &&
          other.avatar == this.avatar &&
          other.role == this.role &&
          other.wxUid == this.wxUid &&
          other.color == this.color &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class MembersCompanion extends UpdateCompanion<Member> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> avatar;
  final Value<MemberRole> role;
  final Value<String?> wxUid;
  final Value<int> color;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const MembersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.avatar = const Value.absent(),
    this.role = const Value.absent(),
    this.wxUid = const Value.absent(),
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MembersCompanion.insert({
    required String id,
    required String name,
    this.avatar = const Value.absent(),
    required MemberRole role,
    this.wxUid = const Value.absent(),
    required int color,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        role = Value(role),
        color = Value(color),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Member> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? avatar,
    Expression<String>? role,
    Expression<String>? wxUid,
    Expression<int>? color,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (avatar != null) 'avatar': avatar,
      if (role != null) 'role': role,
      if (wxUid != null) 'wx_uid': wxUid,
      if (color != null) 'color': color,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MembersCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? avatar,
      Value<MemberRole>? role,
      Value<String?>? wxUid,
      Value<int>? color,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return MembersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
      wxUid: wxUid ?? this.wxUid,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (role.present) {
      map['role'] =
          Variable<String>($MembersTable.$converterrole.toSql(role.value));
    }
    if (wxUid.present) {
      map['wx_uid'] = Variable<String>(wxUid.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MembersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar, ')
          ..write('role: $role, ')
          ..write('wxUid: $wxUid, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<CategoryKind, String> kind =
      GeneratedColumn<String>('kind', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<CategoryKind>($CategoriesTable.$converterkind);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, kind, createdAt, updatedAt, version, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      kind: $CategoriesTable.$converterkind.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kind'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }

  static TypeConverter<CategoryKind, String> $converterkind =
      const EnumConverter<CategoryKind>(CategoryKind.values);
}

class Category extends DataClass implements Insertable<Category> {
  final String id;
  final String name;
  final CategoryKind kind;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const Category(
      {required this.id,
      required this.name,
      required this.kind,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    {
      map['kind'] =
          Variable<String>($CategoriesTable.$converterkind.toSql(kind));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      kind: Value(kind),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      kind: serializer.fromJson<CategoryKind>(json['kind']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'kind': serializer.toJson<CategoryKind>(kind),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Category copyWith(
          {String? id,
          String? name,
          CategoryKind? kind,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        kind: kind ?? this.kind,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      kind: data.kind.present ? data.kind.value : this.kind,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('kind: $kind, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, kind, createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.kind == this.kind &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> id;
  final Value<String> name;
  final Value<CategoryKind> kind;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.kind = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String name,
    required CategoryKind kind,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        kind = Value(kind),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Category> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? kind,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (kind != null) 'kind': kind,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<CategoryKind>? kind,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      kind: kind ?? this.kind,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (kind.present) {
      map['kind'] =
          Variable<String>($CategoriesTable.$converterkind.toSql(kind.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('kind: $kind, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lowStockThresholdMeta =
      const VerificationMeta('lowStockThreshold');
  @override
  late final GeneratedColumn<int> lowStockThreshold = GeneratedColumn<int>(
      'low_stock_threshold', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        categoryId,
        unit,
        barcode,
        location,
        lowStockThreshold,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('low_stock_threshold')) {
      context.handle(
          _lowStockThresholdMeta,
          lowStockThreshold.isAcceptableOrUnknown(
              data['low_stock_threshold']!, _lowStockThresholdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      lowStockThreshold: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}low_stock_threshold'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final String id;
  final String name;
  final String categoryId;
  final String unit;
  final String? barcode;
  final String? location;
  final int lowStockThreshold;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const Product(
      {required this.id,
      required this.name,
      required this.categoryId,
      required this.unit,
      this.barcode,
      this.location,
      required this.lowStockThreshold,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['category_id'] = Variable<String>(categoryId);
    map['unit'] = Variable<String>(unit);
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['low_stock_threshold'] = Variable<int>(lowStockThreshold);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      name: Value(name),
      categoryId: Value(categoryId),
      unit: Value(unit),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      lowStockThreshold: Value(lowStockThreshold),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      unit: serializer.fromJson<String>(json['unit']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      location: serializer.fromJson<String?>(json['location']),
      lowStockThreshold: serializer.fromJson<int>(json['lowStockThreshold']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'categoryId': serializer.toJson<String>(categoryId),
      'unit': serializer.toJson<String>(unit),
      'barcode': serializer.toJson<String?>(barcode),
      'location': serializer.toJson<String?>(location),
      'lowStockThreshold': serializer.toJson<int>(lowStockThreshold),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Product copyWith(
          {String? id,
          String? name,
          String? categoryId,
          String? unit,
          Value<String?> barcode = const Value.absent(),
          Value<String?> location = const Value.absent(),
          int? lowStockThreshold,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        unit: unit ?? this.unit,
        barcode: barcode.present ? barcode.value : this.barcode,
        location: location.present ? location.value : this.location,
        lowStockThreshold: lowStockThreshold ?? this.lowStockThreshold,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      unit: data.unit.present ? data.unit.value : this.unit,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      location: data.location.present ? data.location.value : this.location,
      lowStockThreshold: data.lowStockThreshold.present
          ? data.lowStockThreshold.value
          : this.lowStockThreshold,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('unit: $unit, ')
          ..write('barcode: $barcode, ')
          ..write('location: $location, ')
          ..write('lowStockThreshold: $lowStockThreshold, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, categoryId, unit, barcode, location,
      lowStockThreshold, createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.name == this.name &&
          other.categoryId == this.categoryId &&
          other.unit == this.unit &&
          other.barcode == this.barcode &&
          other.location == this.location &&
          other.lowStockThreshold == this.lowStockThreshold &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> categoryId;
  final Value<String> unit;
  final Value<String?> barcode;
  final Value<String?> location;
  final Value<int> lowStockThreshold;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.unit = const Value.absent(),
    this.barcode = const Value.absent(),
    this.location = const Value.absent(),
    this.lowStockThreshold = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    required String name,
    required String categoryId,
    required String unit,
    this.barcode = const Value.absent(),
    this.location = const Value.absent(),
    this.lowStockThreshold = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        categoryId = Value(categoryId),
        unit = Value(unit),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? categoryId,
    Expression<String>? unit,
    Expression<String>? barcode,
    Expression<String>? location,
    Expression<int>? lowStockThreshold,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (categoryId != null) 'category_id': categoryId,
      if (unit != null) 'unit': unit,
      if (barcode != null) 'barcode': barcode,
      if (location != null) 'location': location,
      if (lowStockThreshold != null) 'low_stock_threshold': lowStockThreshold,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? categoryId,
      Value<String>? unit,
      Value<String?>? barcode,
      Value<String?>? location,
      Value<int>? lowStockThreshold,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return ProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      unit: unit ?? this.unit,
      barcode: barcode ?? this.barcode,
      location: location ?? this.location,
      lowStockThreshold: lowStockThreshold ?? this.lowStockThreshold,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (lowStockThreshold.present) {
      map['low_stock_threshold'] = Variable<int>(lowStockThreshold.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('unit: $unit, ')
          ..write('barcode: $barcode, ')
          ..write('location: $location, ')
          ..write('lowStockThreshold: $lowStockThreshold, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StockBatchesTable extends StockBatches
    with TableInfo<$StockBatchesTable, StockBatche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockBatchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _expireDateMeta =
      const VerificationMeta('expireDate');
  @override
  late final GeneratedColumn<DateTime> expireDate = GeneratedColumn<DateTime>(
      'expire_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _batchNoMeta =
      const VerificationMeta('batchNo');
  @override
  late final GeneratedColumn<String> batchNo = GeneratedColumn<String>(
      'batch_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _inboundAtMeta =
      const VerificationMeta('inboundAt');
  @override
  late final GeneratedColumn<DateTime> inboundAt = GeneratedColumn<DateTime>(
      'inbound_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productId,
        quantity,
        expireDate,
        batchNo,
        inboundAt,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stock_batches';
  @override
  VerificationContext validateIntegrity(Insertable<StockBatche> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('expire_date')) {
      context.handle(
          _expireDateMeta,
          expireDate.isAcceptableOrUnknown(
              data['expire_date']!, _expireDateMeta));
    }
    if (data.containsKey('batch_no')) {
      context.handle(_batchNoMeta,
          batchNo.isAcceptableOrUnknown(data['batch_no']!, _batchNoMeta));
    }
    if (data.containsKey('inbound_at')) {
      context.handle(_inboundAtMeta,
          inboundAt.isAcceptableOrUnknown(data['inbound_at']!, _inboundAtMeta));
    } else if (isInserting) {
      context.missing(_inboundAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockBatche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockBatche(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      expireDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expire_date']),
      batchNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}batch_no']),
      inboundAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}inbound_at'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $StockBatchesTable createAlias(String alias) {
    return $StockBatchesTable(attachedDatabase, alias);
  }
}

class StockBatche extends DataClass implements Insertable<StockBatche> {
  final String id;
  final String productId;
  final double quantity;
  final DateTime? expireDate;
  final String? batchNo;
  final DateTime inboundAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const StockBatche(
      {required this.id,
      required this.productId,
      required this.quantity,
      this.expireDate,
      this.batchNo,
      required this.inboundAt,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['product_id'] = Variable<String>(productId);
    map['quantity'] = Variable<double>(quantity);
    if (!nullToAbsent || expireDate != null) {
      map['expire_date'] = Variable<DateTime>(expireDate);
    }
    if (!nullToAbsent || batchNo != null) {
      map['batch_no'] = Variable<String>(batchNo);
    }
    map['inbound_at'] = Variable<DateTime>(inboundAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  StockBatchesCompanion toCompanion(bool nullToAbsent) {
    return StockBatchesCompanion(
      id: Value(id),
      productId: Value(productId),
      quantity: Value(quantity),
      expireDate: expireDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expireDate),
      batchNo: batchNo == null && nullToAbsent
          ? const Value.absent()
          : Value(batchNo),
      inboundAt: Value(inboundAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory StockBatche.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockBatche(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      expireDate: serializer.fromJson<DateTime?>(json['expireDate']),
      batchNo: serializer.fromJson<String?>(json['batchNo']),
      inboundAt: serializer.fromJson<DateTime>(json['inboundAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productId': serializer.toJson<String>(productId),
      'quantity': serializer.toJson<double>(quantity),
      'expireDate': serializer.toJson<DateTime?>(expireDate),
      'batchNo': serializer.toJson<String?>(batchNo),
      'inboundAt': serializer.toJson<DateTime>(inboundAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  StockBatche copyWith(
          {String? id,
          String? productId,
          double? quantity,
          Value<DateTime?> expireDate = const Value.absent(),
          Value<String?> batchNo = const Value.absent(),
          DateTime? inboundAt,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      StockBatche(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        expireDate: expireDate.present ? expireDate.value : this.expireDate,
        batchNo: batchNo.present ? batchNo.value : this.batchNo,
        inboundAt: inboundAt ?? this.inboundAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  StockBatche copyWithCompanion(StockBatchesCompanion data) {
    return StockBatche(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      expireDate:
          data.expireDate.present ? data.expireDate.value : this.expireDate,
      batchNo: data.batchNo.present ? data.batchNo.value : this.batchNo,
      inboundAt: data.inboundAt.present ? data.inboundAt.value : this.inboundAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockBatche(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('expireDate: $expireDate, ')
          ..write('batchNo: $batchNo, ')
          ..write('inboundAt: $inboundAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, quantity, expireDate, batchNo,
      inboundAt, createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockBatche &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.expireDate == this.expireDate &&
          other.batchNo == this.batchNo &&
          other.inboundAt == this.inboundAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class StockBatchesCompanion extends UpdateCompanion<StockBatche> {
  final Value<String> id;
  final Value<String> productId;
  final Value<double> quantity;
  final Value<DateTime?> expireDate;
  final Value<String?> batchNo;
  final Value<DateTime> inboundAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const StockBatchesCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.expireDate = const Value.absent(),
    this.batchNo = const Value.absent(),
    this.inboundAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StockBatchesCompanion.insert({
    required String id,
    required String productId,
    required double quantity,
    this.expireDate = const Value.absent(),
    this.batchNo = const Value.absent(),
    required DateTime inboundAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        productId = Value(productId),
        quantity = Value(quantity),
        inboundAt = Value(inboundAt),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<StockBatche> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<double>? quantity,
    Expression<DateTime>? expireDate,
    Expression<String>? batchNo,
    Expression<DateTime>? inboundAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (expireDate != null) 'expire_date': expireDate,
      if (batchNo != null) 'batch_no': batchNo,
      if (inboundAt != null) 'inbound_at': inboundAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StockBatchesCompanion copyWith(
      {Value<String>? id,
      Value<String>? productId,
      Value<double>? quantity,
      Value<DateTime?>? expireDate,
      Value<String?>? batchNo,
      Value<DateTime>? inboundAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return StockBatchesCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      expireDate: expireDate ?? this.expireDate,
      batchNo: batchNo ?? this.batchNo,
      inboundAt: inboundAt ?? this.inboundAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (expireDate.present) {
      map['expire_date'] = Variable<DateTime>(expireDate.value);
    }
    if (batchNo.present) {
      map['batch_no'] = Variable<String>(batchNo.value);
    }
    if (inboundAt.present) {
      map['inbound_at'] = Variable<DateTime>(inboundAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockBatchesCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('expireDate: $expireDate, ')
          ..write('batchNo: $batchNo, ')
          ..write('inboundAt: $inboundAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InboundOrdersTable extends InboundOrders
    with TableInfo<$InboundOrdersTable, InboundOrder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InboundOrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<double> qty = GeneratedColumn<double>(
      'qty', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _operatorIdMeta =
      const VerificationMeta('operatorId');
  @override
  late final GeneratedColumn<String> operatorId = GeneratedColumn<String>(
      'operator_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _atMeta = const VerificationMeta('at');
  @override
  late final GeneratedColumn<DateTime> at = GeneratedColumn<DateTime>(
      'at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productId,
        qty,
        operatorId,
        at,
        note,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inbound_orders';
  @override
  VerificationContext validateIntegrity(Insertable<InboundOrder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta));
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('operator_id')) {
      context.handle(
          _operatorIdMeta,
          operatorId.isAcceptableOrUnknown(
              data['operator_id']!, _operatorIdMeta));
    } else if (isInserting) {
      context.missing(_operatorIdMeta);
    }
    if (data.containsKey('at')) {
      context.handle(_atMeta, at.isAcceptableOrUnknown(data['at']!, _atMeta));
    } else if (isInserting) {
      context.missing(_atMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InboundOrder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InboundOrder(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      qty: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}qty'])!,
      operatorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operator_id'])!,
      at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}at'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $InboundOrdersTable createAlias(String alias) {
    return $InboundOrdersTable(attachedDatabase, alias);
  }
}

class InboundOrder extends DataClass implements Insertable<InboundOrder> {
  final String id;
  final String productId;
  final double qty;
  final String operatorId;
  final DateTime at;
  final String? note;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const InboundOrder(
      {required this.id,
      required this.productId,
      required this.qty,
      required this.operatorId,
      required this.at,
      this.note,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['product_id'] = Variable<String>(productId);
    map['qty'] = Variable<double>(qty);
    map['operator_id'] = Variable<String>(operatorId);
    map['at'] = Variable<DateTime>(at);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  InboundOrdersCompanion toCompanion(bool nullToAbsent) {
    return InboundOrdersCompanion(
      id: Value(id),
      productId: Value(productId),
      qty: Value(qty),
      operatorId: Value(operatorId),
      at: Value(at),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory InboundOrder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InboundOrder(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      qty: serializer.fromJson<double>(json['qty']),
      operatorId: serializer.fromJson<String>(json['operatorId']),
      at: serializer.fromJson<DateTime>(json['at']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productId': serializer.toJson<String>(productId),
      'qty': serializer.toJson<double>(qty),
      'operatorId': serializer.toJson<String>(operatorId),
      'at': serializer.toJson<DateTime>(at),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  InboundOrder copyWith(
          {String? id,
          String? productId,
          double? qty,
          String? operatorId,
          DateTime? at,
          Value<String?> note = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      InboundOrder(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        qty: qty ?? this.qty,
        operatorId: operatorId ?? this.operatorId,
        at: at ?? this.at,
        note: note.present ? note.value : this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  InboundOrder copyWithCompanion(InboundOrdersCompanion data) {
    return InboundOrder(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      qty: data.qty.present ? data.qty.value : this.qty,
      operatorId:
          data.operatorId.present ? data.operatorId.value : this.operatorId,
      at: data.at.present ? data.at.value : this.at,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InboundOrder(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('qty: $qty, ')
          ..write('operatorId: $operatorId, ')
          ..write('at: $at, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, qty, operatorId, at, note,
      createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InboundOrder &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.qty == this.qty &&
          other.operatorId == this.operatorId &&
          other.at == this.at &&
          other.note == this.note &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class InboundOrdersCompanion extends UpdateCompanion<InboundOrder> {
  final Value<String> id;
  final Value<String> productId;
  final Value<double> qty;
  final Value<String> operatorId;
  final Value<DateTime> at;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const InboundOrdersCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.qty = const Value.absent(),
    this.operatorId = const Value.absent(),
    this.at = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InboundOrdersCompanion.insert({
    required String id,
    required String productId,
    required double qty,
    required String operatorId,
    required DateTime at,
    this.note = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        productId = Value(productId),
        qty = Value(qty),
        operatorId = Value(operatorId),
        at = Value(at),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<InboundOrder> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<double>? qty,
    Expression<String>? operatorId,
    Expression<DateTime>? at,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (qty != null) 'qty': qty,
      if (operatorId != null) 'operator_id': operatorId,
      if (at != null) 'at': at,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InboundOrdersCompanion copyWith(
      {Value<String>? id,
      Value<String>? productId,
      Value<double>? qty,
      Value<String>? operatorId,
      Value<DateTime>? at,
      Value<String?>? note,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return InboundOrdersCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      qty: qty ?? this.qty,
      operatorId: operatorId ?? this.operatorId,
      at: at ?? this.at,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (qty.present) {
      map['qty'] = Variable<double>(qty.value);
    }
    if (operatorId.present) {
      map['operator_id'] = Variable<String>(operatorId.value);
    }
    if (at.present) {
      map['at'] = Variable<DateTime>(at.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InboundOrdersCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('qty: $qty, ')
          ..write('operatorId: $operatorId, ')
          ..write('at: $at, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OutboundOrdersTable extends OutboundOrders
    with TableInfo<$OutboundOrdersTable, OutboundOrder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutboundOrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<double> qty = GeneratedColumn<double>(
      'qty', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<OutboundReason, String> reason =
      GeneratedColumn<String>('reason', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<OutboundReason>($OutboundOrdersTable.$converterreason);
  static const VerificationMeta _operatorIdMeta =
      const VerificationMeta('operatorId');
  @override
  late final GeneratedColumn<String> operatorId = GeneratedColumn<String>(
      'operator_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _atMeta = const VerificationMeta('at');
  @override
  late final GeneratedColumn<DateTime> at = GeneratedColumn<DateTime>(
      'at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productId,
        qty,
        reason,
        operatorId,
        at,
        note,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outbound_orders';
  @override
  VerificationContext validateIntegrity(Insertable<OutboundOrder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta));
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('operator_id')) {
      context.handle(
          _operatorIdMeta,
          operatorId.isAcceptableOrUnknown(
              data['operator_id']!, _operatorIdMeta));
    } else if (isInserting) {
      context.missing(_operatorIdMeta);
    }
    if (data.containsKey('at')) {
      context.handle(_atMeta, at.isAcceptableOrUnknown(data['at']!, _atMeta));
    } else if (isInserting) {
      context.missing(_atMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OutboundOrder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutboundOrder(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      qty: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}qty'])!,
      reason: $OutboundOrdersTable.$converterreason.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason'])!),
      operatorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operator_id'])!,
      at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}at'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $OutboundOrdersTable createAlias(String alias) {
    return $OutboundOrdersTable(attachedDatabase, alias);
  }

  static TypeConverter<OutboundReason, String> $converterreason =
      const EnumConverter<OutboundReason>(OutboundReason.values);
}

class OutboundOrder extends DataClass implements Insertable<OutboundOrder> {
  final String id;
  final String productId;
  final double qty;
  final OutboundReason reason;
  final String operatorId;
  final DateTime at;
  final String? note;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const OutboundOrder(
      {required this.id,
      required this.productId,
      required this.qty,
      required this.reason,
      required this.operatorId,
      required this.at,
      this.note,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['product_id'] = Variable<String>(productId);
    map['qty'] = Variable<double>(qty);
    {
      map['reason'] =
          Variable<String>($OutboundOrdersTable.$converterreason.toSql(reason));
    }
    map['operator_id'] = Variable<String>(operatorId);
    map['at'] = Variable<DateTime>(at);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  OutboundOrdersCompanion toCompanion(bool nullToAbsent) {
    return OutboundOrdersCompanion(
      id: Value(id),
      productId: Value(productId),
      qty: Value(qty),
      reason: Value(reason),
      operatorId: Value(operatorId),
      at: Value(at),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory OutboundOrder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutboundOrder(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      qty: serializer.fromJson<double>(json['qty']),
      reason: serializer.fromJson<OutboundReason>(json['reason']),
      operatorId: serializer.fromJson<String>(json['operatorId']),
      at: serializer.fromJson<DateTime>(json['at']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productId': serializer.toJson<String>(productId),
      'qty': serializer.toJson<double>(qty),
      'reason': serializer.toJson<OutboundReason>(reason),
      'operatorId': serializer.toJson<String>(operatorId),
      'at': serializer.toJson<DateTime>(at),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  OutboundOrder copyWith(
          {String? id,
          String? productId,
          double? qty,
          OutboundReason? reason,
          String? operatorId,
          DateTime? at,
          Value<String?> note = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      OutboundOrder(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        qty: qty ?? this.qty,
        reason: reason ?? this.reason,
        operatorId: operatorId ?? this.operatorId,
        at: at ?? this.at,
        note: note.present ? note.value : this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  OutboundOrder copyWithCompanion(OutboundOrdersCompanion data) {
    return OutboundOrder(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      qty: data.qty.present ? data.qty.value : this.qty,
      reason: data.reason.present ? data.reason.value : this.reason,
      operatorId:
          data.operatorId.present ? data.operatorId.value : this.operatorId,
      at: data.at.present ? data.at.value : this.at,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OutboundOrder(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('qty: $qty, ')
          ..write('reason: $reason, ')
          ..write('operatorId: $operatorId, ')
          ..write('at: $at, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, qty, reason, operatorId, at,
      note, createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutboundOrder &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.qty == this.qty &&
          other.reason == this.reason &&
          other.operatorId == this.operatorId &&
          other.at == this.at &&
          other.note == this.note &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class OutboundOrdersCompanion extends UpdateCompanion<OutboundOrder> {
  final Value<String> id;
  final Value<String> productId;
  final Value<double> qty;
  final Value<OutboundReason> reason;
  final Value<String> operatorId;
  final Value<DateTime> at;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const OutboundOrdersCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.qty = const Value.absent(),
    this.reason = const Value.absent(),
    this.operatorId = const Value.absent(),
    this.at = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OutboundOrdersCompanion.insert({
    required String id,
    required String productId,
    required double qty,
    required OutboundReason reason,
    required String operatorId,
    required DateTime at,
    this.note = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        productId = Value(productId),
        qty = Value(qty),
        reason = Value(reason),
        operatorId = Value(operatorId),
        at = Value(at),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<OutboundOrder> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<double>? qty,
    Expression<String>? reason,
    Expression<String>? operatorId,
    Expression<DateTime>? at,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (qty != null) 'qty': qty,
      if (reason != null) 'reason': reason,
      if (operatorId != null) 'operator_id': operatorId,
      if (at != null) 'at': at,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OutboundOrdersCompanion copyWith(
      {Value<String>? id,
      Value<String>? productId,
      Value<double>? qty,
      Value<OutboundReason>? reason,
      Value<String>? operatorId,
      Value<DateTime>? at,
      Value<String?>? note,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return OutboundOrdersCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      qty: qty ?? this.qty,
      reason: reason ?? this.reason,
      operatorId: operatorId ?? this.operatorId,
      at: at ?? this.at,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (qty.present) {
      map['qty'] = Variable<double>(qty.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(
          $OutboundOrdersTable.$converterreason.toSql(reason.value));
    }
    if (operatorId.present) {
      map['operator_id'] = Variable<String>(operatorId.value);
    }
    if (at.present) {
      map['at'] = Variable<DateTime>(at.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutboundOrdersCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('qty: $qty, ')
          ..write('reason: $reason, ')
          ..write('operatorId: $operatorId, ')
          ..write('at: $at, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicationsTable extends Medications
    with TableInfo<$MedicationsTable, Medication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _memberIdMeta =
      const VerificationMeta('memberId');
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
      'member_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<MedicationType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<MedicationType>($MedicationsTable.$convertertype);
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<String> dosage = GeneratedColumn<String>(
      'dosage', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<Frequency, String> frequency =
      GeneratedColumn<String>('frequency', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Frequency>($MedicationsTable.$converterfrequency);
  @override
  late final GeneratedColumnWithTypeConverter<List<TimeOfDay>, String> times =
      GeneratedColumn<String>('times', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<TimeOfDay>>($MedicationsTable.$convertertimes);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        memberId,
        name,
        type,
        dosage,
        frequency,
        times,
        startDate,
        endDate,
        active,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medications';
  @override
  VerificationContext validateIntegrity(Insertable<Medication> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('dosage')) {
      context.handle(_dosageMeta,
          dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta));
    } else if (isInserting) {
      context.missing(_dosageMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medication(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      memberId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: $MedicationsTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      dosage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dosage'])!,
      frequency: $MedicationsTable.$converterfrequency.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}frequency'])!),
      times: $MedicationsTable.$convertertimes.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}times'])!),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $MedicationsTable createAlias(String alias) {
    return $MedicationsTable(attachedDatabase, alias);
  }

  static TypeConverter<MedicationType, String> $convertertype =
      const EnumConverter<MedicationType>(MedicationType.values);
  static TypeConverter<Frequency, String> $converterfrequency =
      const EnumConverter<Frequency>(Frequency.values);
  static TypeConverter<List<TimeOfDay>, String> $convertertimes =
      const DriftTimeOfDayListConverter();
}

class Medication extends DataClass implements Insertable<Medication> {
  final String id;
  final String memberId;
  final String name;
  final MedicationType type;
  final String dosage;
  final Frequency frequency;
  final List<TimeOfDay> times;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const Medication(
      {required this.id,
      required this.memberId,
      required this.name,
      required this.type,
      required this.dosage,
      required this.frequency,
      required this.times,
      this.startDate,
      this.endDate,
      required this.active,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['member_id'] = Variable<String>(memberId);
    map['name'] = Variable<String>(name);
    {
      map['type'] =
          Variable<String>($MedicationsTable.$convertertype.toSql(type));
    }
    map['dosage'] = Variable<String>(dosage);
    {
      map['frequency'] = Variable<String>(
          $MedicationsTable.$converterfrequency.toSql(frequency));
    }
    {
      map['times'] =
          Variable<String>($MedicationsTable.$convertertimes.toSql(times));
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['active'] = Variable<bool>(active);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  MedicationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      id: Value(id),
      memberId: Value(memberId),
      name: Value(name),
      type: Value(type),
      dosage: Value(dosage),
      frequency: Value(frequency),
      times: Value(times),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      active: Value(active),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Medication.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medication(
      id: serializer.fromJson<String>(json['id']),
      memberId: serializer.fromJson<String>(json['memberId']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<MedicationType>(json['type']),
      dosage: serializer.fromJson<String>(json['dosage']),
      frequency: serializer.fromJson<Frequency>(json['frequency']),
      times: serializer.fromJson<List<TimeOfDay>>(json['times']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      active: serializer.fromJson<bool>(json['active']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'memberId': serializer.toJson<String>(memberId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<MedicationType>(type),
      'dosage': serializer.toJson<String>(dosage),
      'frequency': serializer.toJson<Frequency>(frequency),
      'times': serializer.toJson<List<TimeOfDay>>(times),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'active': serializer.toJson<bool>(active),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Medication copyWith(
          {String? id,
          String? memberId,
          String? name,
          MedicationType? type,
          String? dosage,
          Frequency? frequency,
          List<TimeOfDay>? times,
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent(),
          bool? active,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Medication(
        id: id ?? this.id,
        memberId: memberId ?? this.memberId,
        name: name ?? this.name,
        type: type ?? this.type,
        dosage: dosage ?? this.dosage,
        frequency: frequency ?? this.frequency,
        times: times ?? this.times,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        active: active ?? this.active,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Medication copyWithCompanion(MedicationsCompanion data) {
    return Medication(
      id: data.id.present ? data.id.value : this.id,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      dosage: data.dosage.present ? data.dosage.value : this.dosage,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      times: data.times.present ? data.times.value : this.times,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      active: data.active.present ? data.active.value : this.active,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medication(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('times: $times, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      memberId,
      name,
      type,
      dosage,
      frequency,
      times,
      startDate,
      endDate,
      active,
      createdAt,
      updatedAt,
      version,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medication &&
          other.id == this.id &&
          other.memberId == this.memberId &&
          other.name == this.name &&
          other.type == this.type &&
          other.dosage == this.dosage &&
          other.frequency == this.frequency &&
          other.times == this.times &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.active == this.active &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class MedicationsCompanion extends UpdateCompanion<Medication> {
  final Value<String> id;
  final Value<String> memberId;
  final Value<String> name;
  final Value<MedicationType> type;
  final Value<String> dosage;
  final Value<Frequency> frequency;
  final Value<List<TimeOfDay>> times;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<bool> active;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const MedicationsCompanion({
    this.id = const Value.absent(),
    this.memberId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.dosage = const Value.absent(),
    this.frequency = const Value.absent(),
    this.times = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.active = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicationsCompanion.insert({
    required String id,
    required String memberId,
    required String name,
    required MedicationType type,
    required String dosage,
    required Frequency frequency,
    required List<TimeOfDay> times,
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.active = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        memberId = Value(memberId),
        name = Value(name),
        type = Value(type),
        dosage = Value(dosage),
        frequency = Value(frequency),
        times = Value(times),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Medication> custom({
    Expression<String>? id,
    Expression<String>? memberId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? dosage,
    Expression<String>? frequency,
    Expression<String>? times,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? active,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memberId != null) 'member_id': memberId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (dosage != null) 'dosage': dosage,
      if (frequency != null) 'frequency': frequency,
      if (times != null) 'times': times,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (active != null) 'active': active,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? memberId,
      Value<String>? name,
      Value<MedicationType>? type,
      Value<String>? dosage,
      Value<Frequency>? frequency,
      Value<List<TimeOfDay>>? times,
      Value<DateTime?>? startDate,
      Value<DateTime?>? endDate,
      Value<bool>? active,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return MedicationsCompanion(
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      name: name ?? this.name,
      type: type ?? this.type,
      dosage: dosage ?? this.dosage,
      frequency: frequency ?? this.frequency,
      times: times ?? this.times,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] =
          Variable<String>($MedicationsTable.$convertertype.toSql(type.value));
    }
    if (dosage.present) {
      map['dosage'] = Variable<String>(dosage.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(
          $MedicationsTable.$converterfrequency.toSql(frequency.value));
    }
    if (times.present) {
      map['times'] = Variable<String>(
          $MedicationsTable.$convertertimes.toSql(times.value));
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationsCompanion(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('times: $times, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DoseSchedulesTable extends DoseSchedules
    with TableInfo<$DoseSchedulesTable, DoseSchedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoseSchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _medicationIdMeta =
      const VerificationMeta('medicationId');
  @override
  late final GeneratedColumn<String> medicationId = GeneratedColumn<String>(
      'medication_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _memberIdMeta =
      const VerificationMeta('memberId');
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
      'member_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scheduledTimeMeta =
      const VerificationMeta('scheduledTime');
  @override
  late final GeneratedColumn<DateTime> scheduledTime =
      GeneratedColumn<DateTime>('scheduled_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        medicationId,
        memberId,
        scheduledTime,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dose_schedules';
  @override
  VerificationContext validateIntegrity(Insertable<DoseSchedule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('medication_id')) {
      context.handle(
          _medicationIdMeta,
          medicationId.isAcceptableOrUnknown(
              data['medication_id']!, _medicationIdMeta));
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('scheduled_time')) {
      context.handle(
          _scheduledTimeMeta,
          scheduledTime.isAcceptableOrUnknown(
              data['scheduled_time']!, _scheduledTimeMeta));
    } else if (isInserting) {
      context.missing(_scheduledTimeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DoseSchedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoseSchedule(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      medicationId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}medication_id'])!,
      memberId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_id'])!,
      scheduledTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}scheduled_time'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $DoseSchedulesTable createAlias(String alias) {
    return $DoseSchedulesTable(attachedDatabase, alias);
  }
}

class DoseSchedule extends DataClass implements Insertable<DoseSchedule> {
  final String id;
  final String medicationId;
  final String memberId;
  final DateTime scheduledTime;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const DoseSchedule(
      {required this.id,
      required this.medicationId,
      required this.memberId,
      required this.scheduledTime,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['medication_id'] = Variable<String>(medicationId);
    map['member_id'] = Variable<String>(memberId);
    map['scheduled_time'] = Variable<DateTime>(scheduledTime);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  DoseSchedulesCompanion toCompanion(bool nullToAbsent) {
    return DoseSchedulesCompanion(
      id: Value(id),
      medicationId: Value(medicationId),
      memberId: Value(memberId),
      scheduledTime: Value(scheduledTime),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory DoseSchedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoseSchedule(
      id: serializer.fromJson<String>(json['id']),
      medicationId: serializer.fromJson<String>(json['medicationId']),
      memberId: serializer.fromJson<String>(json['memberId']),
      scheduledTime: serializer.fromJson<DateTime>(json['scheduledTime']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'medicationId': serializer.toJson<String>(medicationId),
      'memberId': serializer.toJson<String>(memberId),
      'scheduledTime': serializer.toJson<DateTime>(scheduledTime),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  DoseSchedule copyWith(
          {String? id,
          String? medicationId,
          String? memberId,
          DateTime? scheduledTime,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      DoseSchedule(
        id: id ?? this.id,
        medicationId: medicationId ?? this.medicationId,
        memberId: memberId ?? this.memberId,
        scheduledTime: scheduledTime ?? this.scheduledTime,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  DoseSchedule copyWithCompanion(DoseSchedulesCompanion data) {
    return DoseSchedule(
      id: data.id.present ? data.id.value : this.id,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      scheduledTime: data.scheduledTime.present
          ? data.scheduledTime.value
          : this.scheduledTime,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoseSchedule(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('memberId: $memberId, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, medicationId, memberId, scheduledTime,
      createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoseSchedule &&
          other.id == this.id &&
          other.medicationId == this.medicationId &&
          other.memberId == this.memberId &&
          other.scheduledTime == this.scheduledTime &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class DoseSchedulesCompanion extends UpdateCompanion<DoseSchedule> {
  final Value<String> id;
  final Value<String> medicationId;
  final Value<String> memberId;
  final Value<DateTime> scheduledTime;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const DoseSchedulesCompanion({
    this.id = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.scheduledTime = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoseSchedulesCompanion.insert({
    required String id,
    required String medicationId,
    required String memberId,
    required DateTime scheduledTime,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        medicationId = Value(medicationId),
        memberId = Value(memberId),
        scheduledTime = Value(scheduledTime),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<DoseSchedule> custom({
    Expression<String>? id,
    Expression<String>? medicationId,
    Expression<String>? memberId,
    Expression<DateTime>? scheduledTime,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicationId != null) 'medication_id': medicationId,
      if (memberId != null) 'member_id': memberId,
      if (scheduledTime != null) 'scheduled_time': scheduledTime,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoseSchedulesCompanion copyWith(
      {Value<String>? id,
      Value<String>? medicationId,
      Value<String>? memberId,
      Value<DateTime>? scheduledTime,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return DoseSchedulesCompanion(
      id: id ?? this.id,
      medicationId: medicationId ?? this.medicationId,
      memberId: memberId ?? this.memberId,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<String>(medicationId.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (scheduledTime.present) {
      map['scheduled_time'] = Variable<DateTime>(scheduledTime.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoseSchedulesCompanion(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('memberId: $memberId, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DoseLogsTable extends DoseLogs with TableInfo<$DoseLogsTable, DoseLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoseLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _medicationIdMeta =
      const VerificationMeta('medicationId');
  @override
  late final GeneratedColumn<String> medicationId = GeneratedColumn<String>(
      'medication_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _memberIdMeta =
      const VerificationMeta('memberId');
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
      'member_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scheduledTimeMeta =
      const VerificationMeta('scheduledTime');
  @override
  late final GeneratedColumn<DateTime> scheduledTime =
      GeneratedColumn<DateTime>('scheduled_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<DoseStatus, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<DoseStatus>($DoseLogsTable.$converterstatus);
  static const VerificationMeta _takenAtMeta =
      const VerificationMeta('takenAt');
  @override
  late final GeneratedColumn<DateTime> takenAt = GeneratedColumn<DateTime>(
      'taken_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        medicationId,
        memberId,
        scheduledTime,
        status,
        takenAt,
        note,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dose_logs';
  @override
  VerificationContext validateIntegrity(Insertable<DoseLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('medication_id')) {
      context.handle(
          _medicationIdMeta,
          medicationId.isAcceptableOrUnknown(
              data['medication_id']!, _medicationIdMeta));
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('scheduled_time')) {
      context.handle(
          _scheduledTimeMeta,
          scheduledTime.isAcceptableOrUnknown(
              data['scheduled_time']!, _scheduledTimeMeta));
    } else if (isInserting) {
      context.missing(_scheduledTimeMeta);
    }
    if (data.containsKey('taken_at')) {
      context.handle(_takenAtMeta,
          takenAt.isAcceptableOrUnknown(data['taken_at']!, _takenAtMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DoseLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoseLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      medicationId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}medication_id'])!,
      memberId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_id'])!,
      scheduledTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}scheduled_time'])!,
      status: $DoseLogsTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      takenAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}taken_at']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $DoseLogsTable createAlias(String alias) {
    return $DoseLogsTable(attachedDatabase, alias);
  }

  static TypeConverter<DoseStatus, String> $converterstatus =
      const EnumConverter<DoseStatus>(DoseStatus.values);
}

class DoseLog extends DataClass implements Insertable<DoseLog> {
  final String id;
  final String medicationId;
  final String memberId;
  final DateTime scheduledTime;
  final DoseStatus status;
  final DateTime? takenAt;
  final String? note;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const DoseLog(
      {required this.id,
      required this.medicationId,
      required this.memberId,
      required this.scheduledTime,
      required this.status,
      this.takenAt,
      this.note,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['medication_id'] = Variable<String>(medicationId);
    map['member_id'] = Variable<String>(memberId);
    map['scheduled_time'] = Variable<DateTime>(scheduledTime);
    {
      map['status'] =
          Variable<String>($DoseLogsTable.$converterstatus.toSql(status));
    }
    if (!nullToAbsent || takenAt != null) {
      map['taken_at'] = Variable<DateTime>(takenAt);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  DoseLogsCompanion toCompanion(bool nullToAbsent) {
    return DoseLogsCompanion(
      id: Value(id),
      medicationId: Value(medicationId),
      memberId: Value(memberId),
      scheduledTime: Value(scheduledTime),
      status: Value(status),
      takenAt: takenAt == null && nullToAbsent
          ? const Value.absent()
          : Value(takenAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory DoseLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoseLog(
      id: serializer.fromJson<String>(json['id']),
      medicationId: serializer.fromJson<String>(json['medicationId']),
      memberId: serializer.fromJson<String>(json['memberId']),
      scheduledTime: serializer.fromJson<DateTime>(json['scheduledTime']),
      status: serializer.fromJson<DoseStatus>(json['status']),
      takenAt: serializer.fromJson<DateTime?>(json['takenAt']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'medicationId': serializer.toJson<String>(medicationId),
      'memberId': serializer.toJson<String>(memberId),
      'scheduledTime': serializer.toJson<DateTime>(scheduledTime),
      'status': serializer.toJson<DoseStatus>(status),
      'takenAt': serializer.toJson<DateTime?>(takenAt),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  DoseLog copyWith(
          {String? id,
          String? medicationId,
          String? memberId,
          DateTime? scheduledTime,
          DoseStatus? status,
          Value<DateTime?> takenAt = const Value.absent(),
          Value<String?> note = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      DoseLog(
        id: id ?? this.id,
        medicationId: medicationId ?? this.medicationId,
        memberId: memberId ?? this.memberId,
        scheduledTime: scheduledTime ?? this.scheduledTime,
        status: status ?? this.status,
        takenAt: takenAt.present ? takenAt.value : this.takenAt,
        note: note.present ? note.value : this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  DoseLog copyWithCompanion(DoseLogsCompanion data) {
    return DoseLog(
      id: data.id.present ? data.id.value : this.id,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      scheduledTime: data.scheduledTime.present
          ? data.scheduledTime.value
          : this.scheduledTime,
      status: data.status.present ? data.status.value : this.status,
      takenAt: data.takenAt.present ? data.takenAt.value : this.takenAt,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoseLog(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('memberId: $memberId, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('status: $status, ')
          ..write('takenAt: $takenAt, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, medicationId, memberId, scheduledTime,
      status, takenAt, note, createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoseLog &&
          other.id == this.id &&
          other.medicationId == this.medicationId &&
          other.memberId == this.memberId &&
          other.scheduledTime == this.scheduledTime &&
          other.status == this.status &&
          other.takenAt == this.takenAt &&
          other.note == this.note &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class DoseLogsCompanion extends UpdateCompanion<DoseLog> {
  final Value<String> id;
  final Value<String> medicationId;
  final Value<String> memberId;
  final Value<DateTime> scheduledTime;
  final Value<DoseStatus> status;
  final Value<DateTime?> takenAt;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const DoseLogsCompanion({
    this.id = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.scheduledTime = const Value.absent(),
    this.status = const Value.absent(),
    this.takenAt = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoseLogsCompanion.insert({
    required String id,
    required String medicationId,
    required String memberId,
    required DateTime scheduledTime,
    required DoseStatus status,
    this.takenAt = const Value.absent(),
    this.note = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        medicationId = Value(medicationId),
        memberId = Value(memberId),
        scheduledTime = Value(scheduledTime),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<DoseLog> custom({
    Expression<String>? id,
    Expression<String>? medicationId,
    Expression<String>? memberId,
    Expression<DateTime>? scheduledTime,
    Expression<String>? status,
    Expression<DateTime>? takenAt,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicationId != null) 'medication_id': medicationId,
      if (memberId != null) 'member_id': memberId,
      if (scheduledTime != null) 'scheduled_time': scheduledTime,
      if (status != null) 'status': status,
      if (takenAt != null) 'taken_at': takenAt,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoseLogsCompanion copyWith(
      {Value<String>? id,
      Value<String>? medicationId,
      Value<String>? memberId,
      Value<DateTime>? scheduledTime,
      Value<DoseStatus>? status,
      Value<DateTime?>? takenAt,
      Value<String?>? note,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return DoseLogsCompanion(
      id: id ?? this.id,
      medicationId: medicationId ?? this.medicationId,
      memberId: memberId ?? this.memberId,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      status: status ?? this.status,
      takenAt: takenAt ?? this.takenAt,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<String>(medicationId.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (scheduledTime.present) {
      map['scheduled_time'] = Variable<DateTime>(scheduledTime.value);
    }
    if (status.present) {
      map['status'] =
          Variable<String>($DoseLogsTable.$converterstatus.toSql(status.value));
    }
    if (takenAt.present) {
      map['taken_at'] = Variable<DateTime>(takenAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoseLogsCompanion(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('memberId: $memberId, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('status: $status, ')
          ..write('takenAt: $takenAt, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipesTable extends Recipes with TableInfo<$RecipesTable, Recipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stepsMeta = const VerificationMeta('steps');
  @override
  late final GeneratedColumn<String> steps = GeneratedColumn<String>(
      'steps', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _servingsMeta =
      const VerificationMeta('servings');
  @override
  late final GeneratedColumn<int> servings = GeneratedColumn<int>(
      'servings', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($RecipesTable.$convertertags);
  static const VerificationMeta _authorIdMeta =
      const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<String> authorId = GeneratedColumn<String>(
      'author_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        steps,
        servings,
        tags,
        authorId,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(Insertable<Recipe> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('steps')) {
      context.handle(
          _stepsMeta, steps.isAcceptableOrUnknown(data['steps']!, _stepsMeta));
    } else if (isInserting) {
      context.missing(_stepsMeta);
    }
    if (data.containsKey('servings')) {
      context.handle(_servingsMeta,
          servings.isAcceptableOrUnknown(data['servings']!, _servingsMeta));
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Recipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Recipe(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      steps: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}steps'])!,
      servings: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}servings'])!,
      tags: $RecipesTable.$convertertags.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      authorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertertags =
      const StringListConverter();
}

class Recipe extends DataClass implements Insertable<Recipe> {
  final String id;
  final String name;
  final String steps;
  final int servings;
  final List<String> tags;
  final String authorId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const Recipe(
      {required this.id,
      required this.name,
      required this.steps,
      required this.servings,
      required this.tags,
      required this.authorId,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['steps'] = Variable<String>(steps);
    map['servings'] = Variable<int>(servings);
    {
      map['tags'] = Variable<String>($RecipesTable.$convertertags.toSql(tags));
    }
    map['author_id'] = Variable<String>(authorId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      name: Value(name),
      steps: Value(steps),
      servings: Value(servings),
      tags: Value(tags),
      authorId: Value(authorId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Recipe.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Recipe(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      steps: serializer.fromJson<String>(json['steps']),
      servings: serializer.fromJson<int>(json['servings']),
      tags: serializer.fromJson<List<String>>(json['tags']),
      authorId: serializer.fromJson<String>(json['authorId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'steps': serializer.toJson<String>(steps),
      'servings': serializer.toJson<int>(servings),
      'tags': serializer.toJson<List<String>>(tags),
      'authorId': serializer.toJson<String>(authorId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Recipe copyWith(
          {String? id,
          String? name,
          String? steps,
          int? servings,
          List<String>? tags,
          String? authorId,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Recipe(
        id: id ?? this.id,
        name: name ?? this.name,
        steps: steps ?? this.steps,
        servings: servings ?? this.servings,
        tags: tags ?? this.tags,
        authorId: authorId ?? this.authorId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Recipe copyWithCompanion(RecipesCompanion data) {
    return Recipe(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      steps: data.steps.present ? data.steps.value : this.steps,
      servings: data.servings.present ? data.servings.value : this.servings,
      tags: data.tags.present ? data.tags.value : this.tags,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Recipe(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('steps: $steps, ')
          ..write('servings: $servings, ')
          ..write('tags: $tags, ')
          ..write('authorId: $authorId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, steps, servings, tags, authorId,
      createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Recipe &&
          other.id == this.id &&
          other.name == this.name &&
          other.steps == this.steps &&
          other.servings == this.servings &&
          other.tags == this.tags &&
          other.authorId == this.authorId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class RecipesCompanion extends UpdateCompanion<Recipe> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> steps;
  final Value<int> servings;
  final Value<List<String>> tags;
  final Value<String> authorId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.steps = const Value.absent(),
    this.servings = const Value.absent(),
    this.tags = const Value.absent(),
    this.authorId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipesCompanion.insert({
    required String id,
    required String name,
    required String steps,
    this.servings = const Value.absent(),
    required List<String> tags,
    required String authorId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        steps = Value(steps),
        tags = Value(tags),
        authorId = Value(authorId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Recipe> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? steps,
    Expression<int>? servings,
    Expression<String>? tags,
    Expression<String>? authorId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (steps != null) 'steps': steps,
      if (servings != null) 'servings': servings,
      if (tags != null) 'tags': tags,
      if (authorId != null) 'author_id': authorId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? steps,
      Value<int>? servings,
      Value<List<String>>? tags,
      Value<String>? authorId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return RecipesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      steps: steps ?? this.steps,
      servings: servings ?? this.servings,
      tags: tags ?? this.tags,
      authorId: authorId ?? this.authorId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (steps.present) {
      map['steps'] = Variable<String>(steps.value);
    }
    if (servings.present) {
      map['servings'] = Variable<int>(servings.value);
    }
    if (tags.present) {
      map['tags'] =
          Variable<String>($RecipesTable.$convertertags.toSql(tags.value));
    }
    if (authorId.present) {
      map['author_id'] = Variable<String>(authorId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('steps: $steps, ')
          ..write('servings: $servings, ')
          ..write('tags: $tags, ')
          ..write('authorId: $authorId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipeIngredientsTable extends RecipeIngredients
    with TableInfo<$RecipeIngredientsTable, RecipeIngredient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeIngredientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [recipeId, productId, amount, unit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_ingredients';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeIngredient> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {recipeId, productId};
  @override
  RecipeIngredient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeIngredient(
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipe_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit']),
    );
  }

  @override
  $RecipeIngredientsTable createAlias(String alias) {
    return $RecipeIngredientsTable(attachedDatabase, alias);
  }
}

class RecipeIngredient extends DataClass
    implements Insertable<RecipeIngredient> {
  final String recipeId;
  final String productId;
  final double amount;
  final String? unit;
  const RecipeIngredient(
      {required this.recipeId,
      required this.productId,
      required this.amount,
      this.unit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['recipe_id'] = Variable<String>(recipeId);
    map['product_id'] = Variable<String>(productId);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    return map;
  }

  RecipeIngredientsCompanion toCompanion(bool nullToAbsent) {
    return RecipeIngredientsCompanion(
      recipeId: Value(recipeId),
      productId: Value(productId),
      amount: Value(amount),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
    );
  }

  factory RecipeIngredient.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeIngredient(
      recipeId: serializer.fromJson<String>(json['recipeId']),
      productId: serializer.fromJson<String>(json['productId']),
      amount: serializer.fromJson<double>(json['amount']),
      unit: serializer.fromJson<String?>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recipeId': serializer.toJson<String>(recipeId),
      'productId': serializer.toJson<String>(productId),
      'amount': serializer.toJson<double>(amount),
      'unit': serializer.toJson<String?>(unit),
    };
  }

  RecipeIngredient copyWith(
          {String? recipeId,
          String? productId,
          double? amount,
          Value<String?> unit = const Value.absent()}) =>
      RecipeIngredient(
        recipeId: recipeId ?? this.recipeId,
        productId: productId ?? this.productId,
        amount: amount ?? this.amount,
        unit: unit.present ? unit.value : this.unit,
      );
  RecipeIngredient copyWithCompanion(RecipeIngredientsCompanion data) {
    return RecipeIngredient(
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      productId: data.productId.present ? data.productId.value : this.productId,
      amount: data.amount.present ? data.amount.value : this.amount,
      unit: data.unit.present ? data.unit.value : this.unit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredient(')
          ..write('recipeId: $recipeId, ')
          ..write('productId: $productId, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(recipeId, productId, amount, unit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeIngredient &&
          other.recipeId == this.recipeId &&
          other.productId == this.productId &&
          other.amount == this.amount &&
          other.unit == this.unit);
}

class RecipeIngredientsCompanion extends UpdateCompanion<RecipeIngredient> {
  final Value<String> recipeId;
  final Value<String> productId;
  final Value<double> amount;
  final Value<String?> unit;
  final Value<int> rowid;
  const RecipeIngredientsCompanion({
    this.recipeId = const Value.absent(),
    this.productId = const Value.absent(),
    this.amount = const Value.absent(),
    this.unit = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeIngredientsCompanion.insert({
    required String recipeId,
    required String productId,
    required double amount,
    this.unit = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : recipeId = Value(recipeId),
        productId = Value(productId),
        amount = Value(amount);
  static Insertable<RecipeIngredient> custom({
    Expression<String>? recipeId,
    Expression<String>? productId,
    Expression<double>? amount,
    Expression<String>? unit,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (recipeId != null) 'recipe_id': recipeId,
      if (productId != null) 'product_id': productId,
      if (amount != null) 'amount': amount,
      if (unit != null) 'unit': unit,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeIngredientsCompanion copyWith(
      {Value<String>? recipeId,
      Value<String>? productId,
      Value<double>? amount,
      Value<String?>? unit,
      Value<int>? rowid}) {
    return RecipeIngredientsCompanion(
      recipeId: recipeId ?? this.recipeId,
      productId: productId ?? this.productId,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredientsCompanion(')
          ..write('recipeId: $recipeId, ')
          ..write('productId: $productId, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipeCookableBysTable extends RecipeCookableBys
    with TableInfo<$RecipeCookableBysTable, RecipeCookableBy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeCookableBysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _memberIdMeta =
      const VerificationMeta('memberId');
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
      'member_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [recipeId, memberId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_cookable_bys';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeCookableBy> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {recipeId, memberId};
  @override
  RecipeCookableBy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeCookableBy(
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipe_id'])!,
      memberId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_id'])!,
    );
  }

  @override
  $RecipeCookableBysTable createAlias(String alias) {
    return $RecipeCookableBysTable(attachedDatabase, alias);
  }
}

class RecipeCookableBy extends DataClass
    implements Insertable<RecipeCookableBy> {
  final String recipeId;
  final String memberId;
  const RecipeCookableBy({required this.recipeId, required this.memberId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['recipe_id'] = Variable<String>(recipeId);
    map['member_id'] = Variable<String>(memberId);
    return map;
  }

  RecipeCookableBysCompanion toCompanion(bool nullToAbsent) {
    return RecipeCookableBysCompanion(
      recipeId: Value(recipeId),
      memberId: Value(memberId),
    );
  }

  factory RecipeCookableBy.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeCookableBy(
      recipeId: serializer.fromJson<String>(json['recipeId']),
      memberId: serializer.fromJson<String>(json['memberId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recipeId': serializer.toJson<String>(recipeId),
      'memberId': serializer.toJson<String>(memberId),
    };
  }

  RecipeCookableBy copyWith({String? recipeId, String? memberId}) =>
      RecipeCookableBy(
        recipeId: recipeId ?? this.recipeId,
        memberId: memberId ?? this.memberId,
      );
  RecipeCookableBy copyWithCompanion(RecipeCookableBysCompanion data) {
    return RecipeCookableBy(
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeCookableBy(')
          ..write('recipeId: $recipeId, ')
          ..write('memberId: $memberId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(recipeId, memberId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeCookableBy &&
          other.recipeId == this.recipeId &&
          other.memberId == this.memberId);
}

class RecipeCookableBysCompanion extends UpdateCompanion<RecipeCookableBy> {
  final Value<String> recipeId;
  final Value<String> memberId;
  final Value<int> rowid;
  const RecipeCookableBysCompanion({
    this.recipeId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeCookableBysCompanion.insert({
    required String recipeId,
    required String memberId,
    this.rowid = const Value.absent(),
  })  : recipeId = Value(recipeId),
        memberId = Value(memberId);
  static Insertable<RecipeCookableBy> custom({
    Expression<String>? recipeId,
    Expression<String>? memberId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (recipeId != null) 'recipe_id': recipeId,
      if (memberId != null) 'member_id': memberId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeCookableBysCompanion copyWith(
      {Value<String>? recipeId, Value<String>? memberId, Value<int>? rowid}) {
    return RecipeCookableBysCompanion(
      recipeId: recipeId ?? this.recipeId,
      memberId: memberId ?? this.memberId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeCookableBysCompanion(')
          ..write('recipeId: $recipeId, ')
          ..write('memberId: $memberId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailyMealsTable extends DailyMeals
    with TableInfo<$DailyMealsTable, DailyMeal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyMealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<MealType, String> mealType =
      GeneratedColumn<String>('meal_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<MealType>($DailyMealsTable.$convertermealType);
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, mealType, recipeId, createdAt, updatedAt, version, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_meals';
  @override
  VerificationContext validateIntegrity(Insertable<DailyMeal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyMeal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyMeal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      mealType: $DailyMealsTable.$convertermealType.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meal_type'])!),
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipe_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $DailyMealsTable createAlias(String alias) {
    return $DailyMealsTable(attachedDatabase, alias);
  }

  static TypeConverter<MealType, String> $convertermealType =
      const EnumConverter<MealType>(MealType.values);
}

class DailyMeal extends DataClass implements Insertable<DailyMeal> {
  final String id;
  final DateTime date;
  final MealType mealType;
  final String recipeId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const DailyMeal(
      {required this.id,
      required this.date,
      required this.mealType,
      required this.recipeId,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    {
      map['meal_type'] =
          Variable<String>($DailyMealsTable.$convertermealType.toSql(mealType));
    }
    map['recipe_id'] = Variable<String>(recipeId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  DailyMealsCompanion toCompanion(bool nullToAbsent) {
    return DailyMealsCompanion(
      id: Value(id),
      date: Value(date),
      mealType: Value(mealType),
      recipeId: Value(recipeId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory DailyMeal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyMeal(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      mealType: serializer.fromJson<MealType>(json['mealType']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'mealType': serializer.toJson<MealType>(mealType),
      'recipeId': serializer.toJson<String>(recipeId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  DailyMeal copyWith(
          {String? id,
          DateTime? date,
          MealType? mealType,
          String? recipeId,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      DailyMeal(
        id: id ?? this.id,
        date: date ?? this.date,
        mealType: mealType ?? this.mealType,
        recipeId: recipeId ?? this.recipeId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  DailyMeal copyWithCompanion(DailyMealsCompanion data) {
    return DailyMeal(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      mealType: data.mealType.present ? data.mealType.value : this.mealType,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyMeal(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('mealType: $mealType, ')
          ..write('recipeId: $recipeId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, date, mealType, recipeId, createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyMeal &&
          other.id == this.id &&
          other.date == this.date &&
          other.mealType == this.mealType &&
          other.recipeId == this.recipeId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class DailyMealsCompanion extends UpdateCompanion<DailyMeal> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<MealType> mealType;
  final Value<String> recipeId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const DailyMealsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.mealType = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyMealsCompanion.insert({
    required String id,
    required DateTime date,
    required MealType mealType,
    required String recipeId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date),
        mealType = Value(mealType),
        recipeId = Value(recipeId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<DailyMeal> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<String>? mealType,
    Expression<String>? recipeId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (mealType != null) 'meal_type': mealType,
      if (recipeId != null) 'recipe_id': recipeId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyMealsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? date,
      Value<MealType>? mealType,
      Value<String>? recipeId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return DailyMealsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      mealType: mealType ?? this.mealType,
      recipeId: recipeId ?? this.recipeId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (mealType.present) {
      map['meal_type'] = Variable<String>(
          $DailyMealsTable.$convertermealType.toSql(mealType.value));
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyMealsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('mealType: $mealType, ')
          ..write('recipeId: $recipeId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MemosTable extends Memos with TableInfo<$MemosTable, Memo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _authorIdMeta =
      const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<String> authorId = GeneratedColumn<String>(
      'author_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pinnedMeta = const VerificationMeta('pinned');
  @override
  late final GeneratedColumn<bool> pinned = GeneratedColumn<bool>(
      'pinned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("pinned" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
      'done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("done" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _dueAtMeta = const VerificationMeta('dueAt');
  @override
  late final GeneratedColumn<DateTime> dueAt = GeneratedColumn<DateTime>(
      'due_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        body,
        authorId,
        pinned,
        done,
        dueAt,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'memos';
  @override
  VerificationContext validateIntegrity(Insertable<Memo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('pinned')) {
      context.handle(_pinnedMeta,
          pinned.isAcceptableOrUnknown(data['pinned']!, _pinnedMeta));
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    }
    if (data.containsKey('due_at')) {
      context.handle(
          _dueAtMeta, dueAt.isAcceptableOrUnknown(data['due_at']!, _dueAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Memo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Memo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      authorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author_id'])!,
      pinned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}pinned'])!,
      done: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}done'])!,
      dueAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $MemosTable createAlias(String alias) {
    return $MemosTable(attachedDatabase, alias);
  }
}

class Memo extends DataClass implements Insertable<Memo> {
  final String id;
  final String title;
  final String body;
  final String authorId;
  final bool pinned;
  final bool done;
  final DateTime? dueAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const Memo(
      {required this.id,
      required this.title,
      required this.body,
      required this.authorId,
      required this.pinned,
      required this.done,
      this.dueAt,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['author_id'] = Variable<String>(authorId);
    map['pinned'] = Variable<bool>(pinned);
    map['done'] = Variable<bool>(done);
    if (!nullToAbsent || dueAt != null) {
      map['due_at'] = Variable<DateTime>(dueAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  MemosCompanion toCompanion(bool nullToAbsent) {
    return MemosCompanion(
      id: Value(id),
      title: Value(title),
      body: Value(body),
      authorId: Value(authorId),
      pinned: Value(pinned),
      done: Value(done),
      dueAt:
          dueAt == null && nullToAbsent ? const Value.absent() : Value(dueAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Memo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Memo(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      authorId: serializer.fromJson<String>(json['authorId']),
      pinned: serializer.fromJson<bool>(json['pinned']),
      done: serializer.fromJson<bool>(json['done']),
      dueAt: serializer.fromJson<DateTime?>(json['dueAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'authorId': serializer.toJson<String>(authorId),
      'pinned': serializer.toJson<bool>(pinned),
      'done': serializer.toJson<bool>(done),
      'dueAt': serializer.toJson<DateTime?>(dueAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Memo copyWith(
          {String? id,
          String? title,
          String? body,
          String? authorId,
          bool? pinned,
          bool? done,
          Value<DateTime?> dueAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Memo(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        authorId: authorId ?? this.authorId,
        pinned: pinned ?? this.pinned,
        done: done ?? this.done,
        dueAt: dueAt.present ? dueAt.value : this.dueAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Memo copyWithCompanion(MemosCompanion data) {
    return Memo(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
      pinned: data.pinned.present ? data.pinned.value : this.pinned,
      done: data.done.present ? data.done.value : this.done,
      dueAt: data.dueAt.present ? data.dueAt.value : this.dueAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Memo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('authorId: $authorId, ')
          ..write('pinned: $pinned, ')
          ..write('done: $done, ')
          ..write('dueAt: $dueAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, body, authorId, pinned, done,
      dueAt, createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Memo &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.authorId == this.authorId &&
          other.pinned == this.pinned &&
          other.done == this.done &&
          other.dueAt == this.dueAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class MemosCompanion extends UpdateCompanion<Memo> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> body;
  final Value<String> authorId;
  final Value<bool> pinned;
  final Value<bool> done;
  final Value<DateTime?> dueAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const MemosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.authorId = const Value.absent(),
    this.pinned = const Value.absent(),
    this.done = const Value.absent(),
    this.dueAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MemosCompanion.insert({
    required String id,
    required String title,
    this.body = const Value.absent(),
    required String authorId,
    this.pinned = const Value.absent(),
    this.done = const Value.absent(),
    this.dueAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        authorId = Value(authorId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Memo> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? authorId,
    Expression<bool>? pinned,
    Expression<bool>? done,
    Expression<DateTime>? dueAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (authorId != null) 'author_id': authorId,
      if (pinned != null) 'pinned': pinned,
      if (done != null) 'done': done,
      if (dueAt != null) 'due_at': dueAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MemosCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? body,
      Value<String>? authorId,
      Value<bool>? pinned,
      Value<bool>? done,
      Value<DateTime?>? dueAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return MemosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      authorId: authorId ?? this.authorId,
      pinned: pinned ?? this.pinned,
      done: done ?? this.done,
      dueAt: dueAt ?? this.dueAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<String>(authorId.value);
    }
    if (pinned.present) {
      map['pinned'] = Variable<bool>(pinned.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    if (dueAt.present) {
      map['due_at'] = Variable<DateTime>(dueAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('authorId: $authorId, ')
          ..write('pinned: $pinned, ')
          ..write('done: $done, ')
          ..write('dueAt: $dueAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TravelPlansTable extends TravelPlans
    with TableInfo<$TravelPlansTable, TravelPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TravelPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<DateTime> end = GeneratedColumn<DateTime>(
      'end', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> memberIds =
      GeneratedColumn<String>('member_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($TravelPlansTable.$convertermemberIds);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        start,
        end,
        memberIds,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'travel_plans';
  @override
  VerificationContext validateIntegrity(Insertable<TravelPlan> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('end')) {
      context.handle(
          _endMeta, end.isAcceptableOrUnknown(data['end']!, _endMeta));
    } else if (isInserting) {
      context.missing(_endMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TravelPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TravelPlan(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start'])!,
      end: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end'])!,
      memberIds: $TravelPlansTable.$convertermemberIds.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_ids'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TravelPlansTable createAlias(String alias) {
    return $TravelPlansTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertermemberIds =
      const StringListConverter();
}

class TravelPlan extends DataClass implements Insertable<TravelPlan> {
  final String id;
  final String title;
  final DateTime start;
  final DateTime end;
  final List<String> memberIds;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const TravelPlan(
      {required this.id,
      required this.title,
      required this.start,
      required this.end,
      required this.memberIds,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['start'] = Variable<DateTime>(start);
    map['end'] = Variable<DateTime>(end);
    {
      map['member_ids'] = Variable<String>(
          $TravelPlansTable.$convertermemberIds.toSql(memberIds));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TravelPlansCompanion toCompanion(bool nullToAbsent) {
    return TravelPlansCompanion(
      id: Value(id),
      title: Value(title),
      start: Value(start),
      end: Value(end),
      memberIds: Value(memberIds),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TravelPlan.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TravelPlan(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      start: serializer.fromJson<DateTime>(json['start']),
      end: serializer.fromJson<DateTime>(json['end']),
      memberIds: serializer.fromJson<List<String>>(json['memberIds']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'start': serializer.toJson<DateTime>(start),
      'end': serializer.toJson<DateTime>(end),
      'memberIds': serializer.toJson<List<String>>(memberIds),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TravelPlan copyWith(
          {String? id,
          String? title,
          DateTime? start,
          DateTime? end,
          List<String>? memberIds,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TravelPlan(
        id: id ?? this.id,
        title: title ?? this.title,
        start: start ?? this.start,
        end: end ?? this.end,
        memberIds: memberIds ?? this.memberIds,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  TravelPlan copyWithCompanion(TravelPlansCompanion data) {
    return TravelPlan(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      start: data.start.present ? data.start.value : this.start,
      end: data.end.present ? data.end.value : this.end,
      memberIds: data.memberIds.present ? data.memberIds.value : this.memberIds,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TravelPlan(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('memberIds: $memberIds, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, start, end, memberIds, createdAt,
      updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TravelPlan &&
          other.id == this.id &&
          other.title == this.title &&
          other.start == this.start &&
          other.end == this.end &&
          other.memberIds == this.memberIds &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class TravelPlansCompanion extends UpdateCompanion<TravelPlan> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> start;
  final Value<DateTime> end;
  final Value<List<String>> memberIds;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const TravelPlansCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
    this.memberIds = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TravelPlansCompanion.insert({
    required String id,
    required String title,
    required DateTime start,
    required DateTime end,
    required List<String> memberIds,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        start = Value(start),
        end = Value(end),
        memberIds = Value(memberIds),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TravelPlan> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<DateTime>? start,
    Expression<DateTime>? end,
    Expression<String>? memberIds,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
      if (memberIds != null) 'member_ids': memberIds,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TravelPlansCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<DateTime>? start,
      Value<DateTime>? end,
      Value<List<String>>? memberIds,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return TravelPlansCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      start: start ?? this.start,
      end: end ?? this.end,
      memberIds: memberIds ?? this.memberIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<DateTime>(end.value);
    }
    if (memberIds.present) {
      map['member_ids'] = Variable<String>(
          $TravelPlansTable.$convertermemberIds.toSql(memberIds.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TravelPlansCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('memberIds: $memberIds, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TravelDaysTable extends TravelDays
    with TableInfo<$TravelDaysTable, TravelDay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TravelDaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
      'plan_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dayIndexMeta =
      const VerificationMeta('dayIndex');
  @override
  late final GeneratedColumn<int> dayIndex = GeneratedColumn<int>(
      'day_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _agendaMeta = const VerificationMeta('agenda');
  @override
  late final GeneratedColumn<String> agenda = GeneratedColumn<String>(
      'agenda', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        planId,
        dayIndex,
        date,
        agenda,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'travel_days';
  @override
  VerificationContext validateIntegrity(Insertable<TravelDay> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('plan_id')) {
      context.handle(_planIdMeta,
          planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta));
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('day_index')) {
      context.handle(_dayIndexMeta,
          dayIndex.isAcceptableOrUnknown(data['day_index']!, _dayIndexMeta));
    } else if (isInserting) {
      context.missing(_dayIndexMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('agenda')) {
      context.handle(_agendaMeta,
          agenda.isAcceptableOrUnknown(data['agenda']!, _agendaMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TravelDay map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TravelDay(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      planId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_id'])!,
      dayIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_index'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      agenda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}agenda'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TravelDaysTable createAlias(String alias) {
    return $TravelDaysTable(attachedDatabase, alias);
  }
}

class TravelDay extends DataClass implements Insertable<TravelDay> {
  final String id;
  final String planId;
  final int dayIndex;
  final DateTime date;
  final String agenda;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const TravelDay(
      {required this.id,
      required this.planId,
      required this.dayIndex,
      required this.date,
      required this.agenda,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['plan_id'] = Variable<String>(planId);
    map['day_index'] = Variable<int>(dayIndex);
    map['date'] = Variable<DateTime>(date);
    map['agenda'] = Variable<String>(agenda);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TravelDaysCompanion toCompanion(bool nullToAbsent) {
    return TravelDaysCompanion(
      id: Value(id),
      planId: Value(planId),
      dayIndex: Value(dayIndex),
      date: Value(date),
      agenda: Value(agenda),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TravelDay.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TravelDay(
      id: serializer.fromJson<String>(json['id']),
      planId: serializer.fromJson<String>(json['planId']),
      dayIndex: serializer.fromJson<int>(json['dayIndex']),
      date: serializer.fromJson<DateTime>(json['date']),
      agenda: serializer.fromJson<String>(json['agenda']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'planId': serializer.toJson<String>(planId),
      'dayIndex': serializer.toJson<int>(dayIndex),
      'date': serializer.toJson<DateTime>(date),
      'agenda': serializer.toJson<String>(agenda),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TravelDay copyWith(
          {String? id,
          String? planId,
          int? dayIndex,
          DateTime? date,
          String? agenda,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TravelDay(
        id: id ?? this.id,
        planId: planId ?? this.planId,
        dayIndex: dayIndex ?? this.dayIndex,
        date: date ?? this.date,
        agenda: agenda ?? this.agenda,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  TravelDay copyWithCompanion(TravelDaysCompanion data) {
    return TravelDay(
      id: data.id.present ? data.id.value : this.id,
      planId: data.planId.present ? data.planId.value : this.planId,
      dayIndex: data.dayIndex.present ? data.dayIndex.value : this.dayIndex,
      date: data.date.present ? data.date.value : this.date,
      agenda: data.agenda.present ? data.agenda.value : this.agenda,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TravelDay(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('dayIndex: $dayIndex, ')
          ..write('date: $date, ')
          ..write('agenda: $agenda, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, planId, dayIndex, date, agenda, createdAt,
      updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TravelDay &&
          other.id == this.id &&
          other.planId == this.planId &&
          other.dayIndex == this.dayIndex &&
          other.date == this.date &&
          other.agenda == this.agenda &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class TravelDaysCompanion extends UpdateCompanion<TravelDay> {
  final Value<String> id;
  final Value<String> planId;
  final Value<int> dayIndex;
  final Value<DateTime> date;
  final Value<String> agenda;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const TravelDaysCompanion({
    this.id = const Value.absent(),
    this.planId = const Value.absent(),
    this.dayIndex = const Value.absent(),
    this.date = const Value.absent(),
    this.agenda = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TravelDaysCompanion.insert({
    required String id,
    required String planId,
    required int dayIndex,
    required DateTime date,
    this.agenda = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        planId = Value(planId),
        dayIndex = Value(dayIndex),
        date = Value(date),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TravelDay> custom({
    Expression<String>? id,
    Expression<String>? planId,
    Expression<int>? dayIndex,
    Expression<DateTime>? date,
    Expression<String>? agenda,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (planId != null) 'plan_id': planId,
      if (dayIndex != null) 'day_index': dayIndex,
      if (date != null) 'date': date,
      if (agenda != null) 'agenda': agenda,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TravelDaysCompanion copyWith(
      {Value<String>? id,
      Value<String>? planId,
      Value<int>? dayIndex,
      Value<DateTime>? date,
      Value<String>? agenda,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return TravelDaysCompanion(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      dayIndex: dayIndex ?? this.dayIndex,
      date: date ?? this.date,
      agenda: agenda ?? this.agenda,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (dayIndex.present) {
      map['day_index'] = Variable<int>(dayIndex.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (agenda.present) {
      map['agenda'] = Variable<String>(agenda.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TravelDaysCompanion(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('dayIndex: $dayIndex, ')
          ..write('date: $date, ')
          ..write('agenda: $agenda, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TravelItemsTable extends TravelItems
    with TableInfo<$TravelItemsTable, TravelItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TravelItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
      'plan_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<TravelItemType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TravelItemType>($TravelItemsTable.$convertertype);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<double> qty = GeneratedColumn<double>(
      'qty', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
      'done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("done" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _assignedToMeta =
      const VerificationMeta('assignedTo');
  @override
  late final GeneratedColumn<String> assignedTo = GeneratedColumn<String>(
      'assigned_to', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        planId,
        type,
        name,
        qty,
        amount,
        done,
        assignedTo,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'travel_items';
  @override
  VerificationContext validateIntegrity(Insertable<TravelItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('plan_id')) {
      context.handle(_planIdMeta,
          planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta));
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    }
    if (data.containsKey('assigned_to')) {
      context.handle(
          _assignedToMeta,
          assignedTo.isAcceptableOrUnknown(
              data['assigned_to']!, _assignedToMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TravelItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TravelItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      planId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_id'])!,
      type: $TravelItemsTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      qty: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}qty']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount']),
      done: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}done'])!,
      assignedTo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assigned_to']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TravelItemsTable createAlias(String alias) {
    return $TravelItemsTable(attachedDatabase, alias);
  }

  static TypeConverter<TravelItemType, String> $convertertype =
      const EnumConverter<TravelItemType>(TravelItemType.values);
}

class TravelItem extends DataClass implements Insertable<TravelItem> {
  final String id;
  final String planId;
  final TravelItemType type;
  final String name;
  final double? qty;
  final double? amount;
  final bool done;
  final String? assignedTo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const TravelItem(
      {required this.id,
      required this.planId,
      required this.type,
      required this.name,
      this.qty,
      this.amount,
      required this.done,
      this.assignedTo,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['plan_id'] = Variable<String>(planId);
    {
      map['type'] =
          Variable<String>($TravelItemsTable.$convertertype.toSql(type));
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || qty != null) {
      map['qty'] = Variable<double>(qty);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    map['done'] = Variable<bool>(done);
    if (!nullToAbsent || assignedTo != null) {
      map['assigned_to'] = Variable<String>(assignedTo);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TravelItemsCompanion toCompanion(bool nullToAbsent) {
    return TravelItemsCompanion(
      id: Value(id),
      planId: Value(planId),
      type: Value(type),
      name: Value(name),
      qty: qty == null && nullToAbsent ? const Value.absent() : Value(qty),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      done: Value(done),
      assignedTo: assignedTo == null && nullToAbsent
          ? const Value.absent()
          : Value(assignedTo),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TravelItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TravelItem(
      id: serializer.fromJson<String>(json['id']),
      planId: serializer.fromJson<String>(json['planId']),
      type: serializer.fromJson<TravelItemType>(json['type']),
      name: serializer.fromJson<String>(json['name']),
      qty: serializer.fromJson<double?>(json['qty']),
      amount: serializer.fromJson<double?>(json['amount']),
      done: serializer.fromJson<bool>(json['done']),
      assignedTo: serializer.fromJson<String?>(json['assignedTo']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'planId': serializer.toJson<String>(planId),
      'type': serializer.toJson<TravelItemType>(type),
      'name': serializer.toJson<String>(name),
      'qty': serializer.toJson<double?>(qty),
      'amount': serializer.toJson<double?>(amount),
      'done': serializer.toJson<bool>(done),
      'assignedTo': serializer.toJson<String?>(assignedTo),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TravelItem copyWith(
          {String? id,
          String? planId,
          TravelItemType? type,
          String? name,
          Value<double?> qty = const Value.absent(),
          Value<double?> amount = const Value.absent(),
          bool? done,
          Value<String?> assignedTo = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TravelItem(
        id: id ?? this.id,
        planId: planId ?? this.planId,
        type: type ?? this.type,
        name: name ?? this.name,
        qty: qty.present ? qty.value : this.qty,
        amount: amount.present ? amount.value : this.amount,
        done: done ?? this.done,
        assignedTo: assignedTo.present ? assignedTo.value : this.assignedTo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  TravelItem copyWithCompanion(TravelItemsCompanion data) {
    return TravelItem(
      id: data.id.present ? data.id.value : this.id,
      planId: data.planId.present ? data.planId.value : this.planId,
      type: data.type.present ? data.type.value : this.type,
      name: data.name.present ? data.name.value : this.name,
      qty: data.qty.present ? data.qty.value : this.qty,
      amount: data.amount.present ? data.amount.value : this.amount,
      done: data.done.present ? data.done.value : this.done,
      assignedTo:
          data.assignedTo.present ? data.assignedTo.value : this.assignedTo,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TravelItem(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('qty: $qty, ')
          ..write('amount: $amount, ')
          ..write('done: $done, ')
          ..write('assignedTo: $assignedTo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, planId, type, name, qty, amount, done,
      assignedTo, createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TravelItem &&
          other.id == this.id &&
          other.planId == this.planId &&
          other.type == this.type &&
          other.name == this.name &&
          other.qty == this.qty &&
          other.amount == this.amount &&
          other.done == this.done &&
          other.assignedTo == this.assignedTo &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class TravelItemsCompanion extends UpdateCompanion<TravelItem> {
  final Value<String> id;
  final Value<String> planId;
  final Value<TravelItemType> type;
  final Value<String> name;
  final Value<double?> qty;
  final Value<double?> amount;
  final Value<bool> done;
  final Value<String?> assignedTo;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const TravelItemsCompanion({
    this.id = const Value.absent(),
    this.planId = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.qty = const Value.absent(),
    this.amount = const Value.absent(),
    this.done = const Value.absent(),
    this.assignedTo = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TravelItemsCompanion.insert({
    required String id,
    required String planId,
    required TravelItemType type,
    required String name,
    this.qty = const Value.absent(),
    this.amount = const Value.absent(),
    this.done = const Value.absent(),
    this.assignedTo = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        planId = Value(planId),
        type = Value(type),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TravelItem> custom({
    Expression<String>? id,
    Expression<String>? planId,
    Expression<String>? type,
    Expression<String>? name,
    Expression<double>? qty,
    Expression<double>? amount,
    Expression<bool>? done,
    Expression<String>? assignedTo,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (planId != null) 'plan_id': planId,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (qty != null) 'qty': qty,
      if (amount != null) 'amount': amount,
      if (done != null) 'done': done,
      if (assignedTo != null) 'assigned_to': assignedTo,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TravelItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? planId,
      Value<TravelItemType>? type,
      Value<String>? name,
      Value<double?>? qty,
      Value<double?>? amount,
      Value<bool>? done,
      Value<String?>? assignedTo,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return TravelItemsCompanion(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      type: type ?? this.type,
      name: name ?? this.name,
      qty: qty ?? this.qty,
      amount: amount ?? this.amount,
      done: done ?? this.done,
      assignedTo: assignedTo ?? this.assignedTo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (type.present) {
      map['type'] =
          Variable<String>($TravelItemsTable.$convertertype.toSql(type.value));
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (qty.present) {
      map['qty'] = Variable<double>(qty.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    if (assignedTo.present) {
      map['assigned_to'] = Variable<String>(assignedTo.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TravelItemsCompanion(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('qty: $qty, ')
          ..write('amount: $amount, ')
          ..write('done: $done, ')
          ..write('assignedTo: $assignedTo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReminderRulesTable extends ReminderRules
    with TableInfo<$ReminderRulesTable, ReminderRule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReminderRulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<ReminderType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ReminderType>($ReminderRulesTable.$convertertype);
  static const VerificationMeta _sourceRefMeta =
      const VerificationMeta('sourceRef');
  @override
  late final GeneratedColumn<String> sourceRef = GeneratedColumn<String>(
      'source_ref', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<ChannelType, String> channel =
      GeneratedColumn<String>('channel', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ChannelType>($ReminderRulesTable.$converterchannel);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      config = GeneratedColumn<String>('config', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $ReminderRulesTable.$converterconfig);
  static const VerificationMeta _memberIdMeta =
      const VerificationMeta('memberId');
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
      'member_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _enabledMeta =
      const VerificationMeta('enabled');
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
      'enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("enabled" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        sourceRef,
        channel,
        config,
        memberId,
        enabled,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder_rules';
  @override
  VerificationContext validateIntegrity(Insertable<ReminderRule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('source_ref')) {
      context.handle(_sourceRefMeta,
          sourceRef.isAcceptableOrUnknown(data['source_ref']!, _sourceRefMeta));
    } else if (isInserting) {
      context.missing(_sourceRefMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta));
    }
    if (data.containsKey('enabled')) {
      context.handle(_enabledMeta,
          enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderRule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderRule(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: $ReminderRulesTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      sourceRef: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_ref'])!,
      channel: $ReminderRulesTable.$converterchannel.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}channel'])!),
      config: $ReminderRulesTable.$converterconfig.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}config'])!),
      memberId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_id']),
      enabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}enabled'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $ReminderRulesTable createAlias(String alias) {
    return $ReminderRulesTable(attachedDatabase, alias);
  }

  static TypeConverter<ReminderType, String> $convertertype =
      const EnumConverter<ReminderType>(ReminderType.values);
  static TypeConverter<ChannelType, String> $converterchannel =
      const EnumConverter<ChannelType>(ChannelType.values);
  static TypeConverter<Map<String, dynamic>, String> $converterconfig =
      const MapConverter();
}

class ReminderRule extends DataClass implements Insertable<ReminderRule> {
  final String id;
  final ReminderType type;
  final String sourceRef;
  final ChannelType channel;
  final Map<String, dynamic> config;
  final String? memberId;
  final bool enabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const ReminderRule(
      {required this.id,
      required this.type,
      required this.sourceRef,
      required this.channel,
      required this.config,
      this.memberId,
      required this.enabled,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['type'] =
          Variable<String>($ReminderRulesTable.$convertertype.toSql(type));
    }
    map['source_ref'] = Variable<String>(sourceRef);
    {
      map['channel'] = Variable<String>(
          $ReminderRulesTable.$converterchannel.toSql(channel));
    }
    {
      map['config'] =
          Variable<String>($ReminderRulesTable.$converterconfig.toSql(config));
    }
    if (!nullToAbsent || memberId != null) {
      map['member_id'] = Variable<String>(memberId);
    }
    map['enabled'] = Variable<bool>(enabled);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ReminderRulesCompanion toCompanion(bool nullToAbsent) {
    return ReminderRulesCompanion(
      id: Value(id),
      type: Value(type),
      sourceRef: Value(sourceRef),
      channel: Value(channel),
      config: Value(config),
      memberId: memberId == null && nullToAbsent
          ? const Value.absent()
          : Value(memberId),
      enabled: Value(enabled),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ReminderRule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderRule(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<ReminderType>(json['type']),
      sourceRef: serializer.fromJson<String>(json['sourceRef']),
      channel: serializer.fromJson<ChannelType>(json['channel']),
      config: serializer.fromJson<Map<String, dynamic>>(json['config']),
      memberId: serializer.fromJson<String?>(json['memberId']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<ReminderType>(type),
      'sourceRef': serializer.toJson<String>(sourceRef),
      'channel': serializer.toJson<ChannelType>(channel),
      'config': serializer.toJson<Map<String, dynamic>>(config),
      'memberId': serializer.toJson<String?>(memberId),
      'enabled': serializer.toJson<bool>(enabled),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ReminderRule copyWith(
          {String? id,
          ReminderType? type,
          String? sourceRef,
          ChannelType? channel,
          Map<String, dynamic>? config,
          Value<String?> memberId = const Value.absent(),
          bool? enabled,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ReminderRule(
        id: id ?? this.id,
        type: type ?? this.type,
        sourceRef: sourceRef ?? this.sourceRef,
        channel: channel ?? this.channel,
        config: config ?? this.config,
        memberId: memberId.present ? memberId.value : this.memberId,
        enabled: enabled ?? this.enabled,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  ReminderRule copyWithCompanion(ReminderRulesCompanion data) {
    return ReminderRule(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      sourceRef: data.sourceRef.present ? data.sourceRef.value : this.sourceRef,
      channel: data.channel.present ? data.channel.value : this.channel,
      config: data.config.present ? data.config.value : this.config,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderRule(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('sourceRef: $sourceRef, ')
          ..write('channel: $channel, ')
          ..write('config: $config, ')
          ..write('memberId: $memberId, ')
          ..write('enabled: $enabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, sourceRef, channel, config,
      memberId, enabled, createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderRule &&
          other.id == this.id &&
          other.type == this.type &&
          other.sourceRef == this.sourceRef &&
          other.channel == this.channel &&
          other.config == this.config &&
          other.memberId == this.memberId &&
          other.enabled == this.enabled &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class ReminderRulesCompanion extends UpdateCompanion<ReminderRule> {
  final Value<String> id;
  final Value<ReminderType> type;
  final Value<String> sourceRef;
  final Value<ChannelType> channel;
  final Value<Map<String, dynamic>> config;
  final Value<String?> memberId;
  final Value<bool> enabled;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ReminderRulesCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.sourceRef = const Value.absent(),
    this.channel = const Value.absent(),
    this.config = const Value.absent(),
    this.memberId = const Value.absent(),
    this.enabled = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReminderRulesCompanion.insert({
    required String id,
    required ReminderType type,
    required String sourceRef,
    required ChannelType channel,
    required Map<String, dynamic> config,
    this.memberId = const Value.absent(),
    this.enabled = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        sourceRef = Value(sourceRef),
        channel = Value(channel),
        config = Value(config),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ReminderRule> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? sourceRef,
    Expression<String>? channel,
    Expression<String>? config,
    Expression<String>? memberId,
    Expression<bool>? enabled,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (sourceRef != null) 'source_ref': sourceRef,
      if (channel != null) 'channel': channel,
      if (config != null) 'config': config,
      if (memberId != null) 'member_id': memberId,
      if (enabled != null) 'enabled': enabled,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReminderRulesCompanion copyWith(
      {Value<String>? id,
      Value<ReminderType>? type,
      Value<String>? sourceRef,
      Value<ChannelType>? channel,
      Value<Map<String, dynamic>>? config,
      Value<String?>? memberId,
      Value<bool>? enabled,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return ReminderRulesCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      sourceRef: sourceRef ?? this.sourceRef,
      channel: channel ?? this.channel,
      config: config ?? this.config,
      memberId: memberId ?? this.memberId,
      enabled: enabled ?? this.enabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $ReminderRulesTable.$convertertype.toSql(type.value));
    }
    if (sourceRef.present) {
      map['source_ref'] = Variable<String>(sourceRef.value);
    }
    if (channel.present) {
      map['channel'] = Variable<String>(
          $ReminderRulesTable.$converterchannel.toSql(channel.value));
    }
    if (config.present) {
      map['config'] = Variable<String>(
          $ReminderRulesTable.$converterconfig.toSql(config.value));
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderRulesCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('sourceRef: $sourceRef, ')
          ..write('channel: $channel, ')
          ..write('config: $config, ')
          ..write('memberId: $memberId, ')
          ..write('enabled: $enabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReminderLogsTable extends ReminderLogs
    with TableInfo<$ReminderLogsTable, ReminderLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReminderLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ruleIdMeta = const VerificationMeta('ruleId');
  @override
  late final GeneratedColumn<String> ruleId = GeneratedColumn<String>(
      'rule_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firedAtMeta =
      const VerificationMeta('firedAt');
  @override
  late final GeneratedColumn<DateTime> firedAt = GeneratedColumn<DateTime>(
      'fired_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<ChannelType, String> channel =
      GeneratedColumn<String>('channel', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ChannelType>($ReminderLogsTable.$converterchannel);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        ruleId,
        firedAt,
        channel,
        status,
        payload,
        createdAt,
        updatedAt,
        version,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder_logs';
  @override
  VerificationContext validateIntegrity(Insertable<ReminderLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('rule_id')) {
      context.handle(_ruleIdMeta,
          ruleId.isAcceptableOrUnknown(data['rule_id']!, _ruleIdMeta));
    } else if (isInserting) {
      context.missing(_ruleIdMeta);
    }
    if (data.containsKey('fired_at')) {
      context.handle(_firedAtMeta,
          firedAt.isAcceptableOrUnknown(data['fired_at']!, _firedAtMeta));
    } else if (isInserting) {
      context.missing(_firedAtMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      ruleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rule_id'])!,
      firedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fired_at'])!,
      channel: $ReminderLogsTable.$converterchannel.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}channel'])!),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $ReminderLogsTable createAlias(String alias) {
    return $ReminderLogsTable(attachedDatabase, alias);
  }

  static TypeConverter<ChannelType, String> $converterchannel =
      const EnumConverter<ChannelType>(ChannelType.values);
}

class ReminderLog extends DataClass implements Insertable<ReminderLog> {
  final String id;
  final String ruleId;
  final DateTime firedAt;
  final ChannelType channel;
  final String status;
  final String? payload;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final DateTime? deletedAt;
  const ReminderLog(
      {required this.id,
      required this.ruleId,
      required this.firedAt,
      required this.channel,
      required this.status,
      this.payload,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['rule_id'] = Variable<String>(ruleId);
    map['fired_at'] = Variable<DateTime>(firedAt);
    {
      map['channel'] =
          Variable<String>($ReminderLogsTable.$converterchannel.toSql(channel));
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || payload != null) {
      map['payload'] = Variable<String>(payload);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ReminderLogsCompanion toCompanion(bool nullToAbsent) {
    return ReminderLogsCompanion(
      id: Value(id),
      ruleId: Value(ruleId),
      firedAt: Value(firedAt),
      channel: Value(channel),
      status: Value(status),
      payload: payload == null && nullToAbsent
          ? const Value.absent()
          : Value(payload),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ReminderLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderLog(
      id: serializer.fromJson<String>(json['id']),
      ruleId: serializer.fromJson<String>(json['ruleId']),
      firedAt: serializer.fromJson<DateTime>(json['firedAt']),
      channel: serializer.fromJson<ChannelType>(json['channel']),
      status: serializer.fromJson<String>(json['status']),
      payload: serializer.fromJson<String?>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ruleId': serializer.toJson<String>(ruleId),
      'firedAt': serializer.toJson<DateTime>(firedAt),
      'channel': serializer.toJson<ChannelType>(channel),
      'status': serializer.toJson<String>(status),
      'payload': serializer.toJson<String?>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ReminderLog copyWith(
          {String? id,
          String? ruleId,
          DateTime? firedAt,
          ChannelType? channel,
          String? status,
          Value<String?> payload = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          int? version,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ReminderLog(
        id: id ?? this.id,
        ruleId: ruleId ?? this.ruleId,
        firedAt: firedAt ?? this.firedAt,
        channel: channel ?? this.channel,
        status: status ?? this.status,
        payload: payload.present ? payload.value : this.payload,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  ReminderLog copyWithCompanion(ReminderLogsCompanion data) {
    return ReminderLog(
      id: data.id.present ? data.id.value : this.id,
      ruleId: data.ruleId.present ? data.ruleId.value : this.ruleId,
      firedAt: data.firedAt.present ? data.firedAt.value : this.firedAt,
      channel: data.channel.present ? data.channel.value : this.channel,
      status: data.status.present ? data.status.value : this.status,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderLog(')
          ..write('id: $id, ')
          ..write('ruleId: $ruleId, ')
          ..write('firedAt: $firedAt, ')
          ..write('channel: $channel, ')
          ..write('status: $status, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ruleId, firedAt, channel, status, payload,
      createdAt, updatedAt, version, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderLog &&
          other.id == this.id &&
          other.ruleId == this.ruleId &&
          other.firedAt == this.firedAt &&
          other.channel == this.channel &&
          other.status == this.status &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.deletedAt == this.deletedAt);
}

class ReminderLogsCompanion extends UpdateCompanion<ReminderLog> {
  final Value<String> id;
  final Value<String> ruleId;
  final Value<DateTime> firedAt;
  final Value<ChannelType> channel;
  final Value<String> status;
  final Value<String?> payload;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ReminderLogsCompanion({
    this.id = const Value.absent(),
    this.ruleId = const Value.absent(),
    this.firedAt = const Value.absent(),
    this.channel = const Value.absent(),
    this.status = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReminderLogsCompanion.insert({
    required String id,
    required String ruleId,
    required DateTime firedAt,
    required ChannelType channel,
    this.status = const Value.absent(),
    this.payload = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.version = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        ruleId = Value(ruleId),
        firedAt = Value(firedAt),
        channel = Value(channel),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ReminderLog> custom({
    Expression<String>? id,
    Expression<String>? ruleId,
    Expression<DateTime>? firedAt,
    Expression<String>? channel,
    Expression<String>? status,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ruleId != null) 'rule_id': ruleId,
      if (firedAt != null) 'fired_at': firedAt,
      if (channel != null) 'channel': channel,
      if (status != null) 'status': status,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReminderLogsCompanion copyWith(
      {Value<String>? id,
      Value<String>? ruleId,
      Value<DateTime>? firedAt,
      Value<ChannelType>? channel,
      Value<String>? status,
      Value<String?>? payload,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? version,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return ReminderLogsCompanion(
      id: id ?? this.id,
      ruleId: ruleId ?? this.ruleId,
      firedAt: firedAt ?? this.firedAt,
      channel: channel ?? this.channel,
      status: status ?? this.status,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ruleId.present) {
      map['rule_id'] = Variable<String>(ruleId.value);
    }
    if (firedAt.present) {
      map['fired_at'] = Variable<DateTime>(firedAt.value);
    }
    if (channel.present) {
      map['channel'] = Variable<String>(
          $ReminderLogsTable.$converterchannel.toSql(channel.value));
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderLogsCompanion(')
          ..write('id: $id, ')
          ..write('ruleId: $ruleId, ')
          ..write('firedAt: $firedAt, ')
          ..write('channel: $channel, ')
          ..write('status: $status, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MembersTable members = $MembersTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $StockBatchesTable stockBatches = $StockBatchesTable(this);
  late final $InboundOrdersTable inboundOrders = $InboundOrdersTable(this);
  late final $OutboundOrdersTable outboundOrders = $OutboundOrdersTable(this);
  late final $MedicationsTable medications = $MedicationsTable(this);
  late final $DoseSchedulesTable doseSchedules = $DoseSchedulesTable(this);
  late final $DoseLogsTable doseLogs = $DoseLogsTable(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $RecipeIngredientsTable recipeIngredients =
      $RecipeIngredientsTable(this);
  late final $RecipeCookableBysTable recipeCookableBys =
      $RecipeCookableBysTable(this);
  late final $DailyMealsTable dailyMeals = $DailyMealsTable(this);
  late final $MemosTable memos = $MemosTable(this);
  late final $TravelPlansTable travelPlans = $TravelPlansTable(this);
  late final $TravelDaysTable travelDays = $TravelDaysTable(this);
  late final $TravelItemsTable travelItems = $TravelItemsTable(this);
  late final $ReminderRulesTable reminderRules = $ReminderRulesTable(this);
  late final $ReminderLogsTable reminderLogs = $ReminderLogsTable(this);
  late final MemberDao memberDao = MemberDao(this as AppDatabase);
  late final InventoryDao inventoryDao = InventoryDao(this as AppDatabase);
  late final MedicationDao medicationDao = MedicationDao(this as AppDatabase);
  late final RecipeDao recipeDao = RecipeDao(this as AppDatabase);
  late final MemoDao memoDao = MemoDao(this as AppDatabase);
  late final TravelDao travelDao = TravelDao(this as AppDatabase);
  late final ReminderDao reminderDao = ReminderDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        members,
        categories,
        products,
        stockBatches,
        inboundOrders,
        outboundOrders,
        medications,
        doseSchedules,
        doseLogs,
        recipes,
        recipeIngredients,
        recipeCookableBys,
        dailyMeals,
        memos,
        travelPlans,
        travelDays,
        travelItems,
        reminderRules,
        reminderLogs
      ];
}

typedef $$MembersTableCreateCompanionBuilder = MembersCompanion Function({
  required String id,
  required String name,
  Value<String?> avatar,
  required MemberRole role,
  Value<String?> wxUid,
  required int color,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$MembersTableUpdateCompanionBuilder = MembersCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> avatar,
  Value<MemberRole> role,
  Value<String?> wxUid,
  Value<int> color,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$MembersTableFilterComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get avatar => $composableBuilder(
      column: $table.avatar, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MemberRole, MemberRole, String> get role =>
      $composableBuilder(
          column: $table.role,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get wxUid => $composableBuilder(
      column: $table.wxUid, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$MembersTableOrderingComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get avatar => $composableBuilder(
      column: $table.avatar, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wxUid => $composableBuilder(
      column: $table.wxUid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$MembersTableAnnotationComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MemberRole, String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get wxUid =>
      $composableBuilder(column: $table.wxUid, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$MembersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MembersTable,
    Member,
    $$MembersTableFilterComposer,
    $$MembersTableOrderingComposer,
    $$MembersTableAnnotationComposer,
    $$MembersTableCreateCompanionBuilder,
    $$MembersTableUpdateCompanionBuilder,
    (Member, BaseReferences<_$AppDatabase, $MembersTable, Member>),
    Member,
    PrefetchHooks Function()> {
  $$MembersTableTableManager(_$AppDatabase db, $MembersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MembersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> avatar = const Value.absent(),
            Value<MemberRole> role = const Value.absent(),
            Value<String?> wxUid = const Value.absent(),
            Value<int> color = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MembersCompanion(
            id: id,
            name: name,
            avatar: avatar,
            role: role,
            wxUid: wxUid,
            color: color,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> avatar = const Value.absent(),
            required MemberRole role,
            Value<String?> wxUid = const Value.absent(),
            required int color,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MembersCompanion.insert(
            id: id,
            name: name,
            avatar: avatar,
            role: role,
            wxUid: wxUid,
            color: color,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MembersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MembersTable,
    Member,
    $$MembersTableFilterComposer,
    $$MembersTableOrderingComposer,
    $$MembersTableAnnotationComposer,
    $$MembersTableCreateCompanionBuilder,
    $$MembersTableUpdateCompanionBuilder,
    (Member, BaseReferences<_$AppDatabase, $MembersTable, Member>),
    Member,
    PrefetchHooks Function()>;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  required String id,
  required String name,
  required CategoryKind kind,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<CategoryKind> kind,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<CategoryKind, CategoryKind, String> get kind =>
      $composableBuilder(
          column: $table.kind,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CategoryKind, String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<CategoryKind> kind = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            name: name,
            kind: kind,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required CategoryKind kind,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            name: name,
            kind: kind,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()>;
typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  required String id,
  required String name,
  required String categoryId,
  required String unit,
  Value<String?> barcode,
  Value<String?> location,
  Value<int> lowStockThreshold,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> categoryId,
  Value<String> unit,
  Value<String?> barcode,
  Value<String?> location,
  Value<int> lowStockThreshold,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lowStockThreshold => $composableBuilder(
      column: $table.lowStockThreshold,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lowStockThreshold => $composableBuilder(
      column: $table.lowStockThreshold,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<int> get lowStockThreshold => $composableBuilder(
      column: $table.lowStockThreshold, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$ProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
    Product,
    PrefetchHooks Function()> {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<int> lowStockThreshold = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsCompanion(
            id: id,
            name: name,
            categoryId: categoryId,
            unit: unit,
            barcode: barcode,
            location: location,
            lowStockThreshold: lowStockThreshold,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String categoryId,
            required String unit,
            Value<String?> barcode = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<int> lowStockThreshold = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsCompanion.insert(
            id: id,
            name: name,
            categoryId: categoryId,
            unit: unit,
            barcode: barcode,
            location: location,
            lowStockThreshold: lowStockThreshold,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
    Product,
    PrefetchHooks Function()>;
typedef $$StockBatchesTableCreateCompanionBuilder = StockBatchesCompanion
    Function({
  required String id,
  required String productId,
  required double quantity,
  Value<DateTime?> expireDate,
  Value<String?> batchNo,
  required DateTime inboundAt,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$StockBatchesTableUpdateCompanionBuilder = StockBatchesCompanion
    Function({
  Value<String> id,
  Value<String> productId,
  Value<double> quantity,
  Value<DateTime?> expireDate,
  Value<String?> batchNo,
  Value<DateTime> inboundAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$StockBatchesTableFilterComposer
    extends Composer<_$AppDatabase, $StockBatchesTable> {
  $$StockBatchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expireDate => $composableBuilder(
      column: $table.expireDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get batchNo => $composableBuilder(
      column: $table.batchNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get inboundAt => $composableBuilder(
      column: $table.inboundAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$StockBatchesTableOrderingComposer
    extends Composer<_$AppDatabase, $StockBatchesTable> {
  $$StockBatchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expireDate => $composableBuilder(
      column: $table.expireDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get batchNo => $composableBuilder(
      column: $table.batchNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get inboundAt => $composableBuilder(
      column: $table.inboundAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$StockBatchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StockBatchesTable> {
  $$StockBatchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<DateTime> get expireDate => $composableBuilder(
      column: $table.expireDate, builder: (column) => column);

  GeneratedColumn<String> get batchNo =>
      $composableBuilder(column: $table.batchNo, builder: (column) => column);

  GeneratedColumn<DateTime> get inboundAt =>
      $composableBuilder(column: $table.inboundAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$StockBatchesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StockBatchesTable,
    StockBatche,
    $$StockBatchesTableFilterComposer,
    $$StockBatchesTableOrderingComposer,
    $$StockBatchesTableAnnotationComposer,
    $$StockBatchesTableCreateCompanionBuilder,
    $$StockBatchesTableUpdateCompanionBuilder,
    (
      StockBatche,
      BaseReferences<_$AppDatabase, $StockBatchesTable, StockBatche>
    ),
    StockBatche,
    PrefetchHooks Function()> {
  $$StockBatchesTableTableManager(_$AppDatabase db, $StockBatchesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockBatchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockBatchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockBatchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<DateTime?> expireDate = const Value.absent(),
            Value<String?> batchNo = const Value.absent(),
            Value<DateTime> inboundAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StockBatchesCompanion(
            id: id,
            productId: productId,
            quantity: quantity,
            expireDate: expireDate,
            batchNo: batchNo,
            inboundAt: inboundAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String productId,
            required double quantity,
            Value<DateTime?> expireDate = const Value.absent(),
            Value<String?> batchNo = const Value.absent(),
            required DateTime inboundAt,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StockBatchesCompanion.insert(
            id: id,
            productId: productId,
            quantity: quantity,
            expireDate: expireDate,
            batchNo: batchNo,
            inboundAt: inboundAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StockBatchesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StockBatchesTable,
    StockBatche,
    $$StockBatchesTableFilterComposer,
    $$StockBatchesTableOrderingComposer,
    $$StockBatchesTableAnnotationComposer,
    $$StockBatchesTableCreateCompanionBuilder,
    $$StockBatchesTableUpdateCompanionBuilder,
    (
      StockBatche,
      BaseReferences<_$AppDatabase, $StockBatchesTable, StockBatche>
    ),
    StockBatche,
    PrefetchHooks Function()>;
typedef $$InboundOrdersTableCreateCompanionBuilder = InboundOrdersCompanion
    Function({
  required String id,
  required String productId,
  required double qty,
  required String operatorId,
  required DateTime at,
  Value<String?> note,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$InboundOrdersTableUpdateCompanionBuilder = InboundOrdersCompanion
    Function({
  Value<String> id,
  Value<String> productId,
  Value<double> qty,
  Value<String> operatorId,
  Value<DateTime> at,
  Value<String?> note,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$InboundOrdersTableFilterComposer
    extends Composer<_$AppDatabase, $InboundOrdersTable> {
  $$InboundOrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operatorId => $composableBuilder(
      column: $table.operatorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get at => $composableBuilder(
      column: $table.at, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$InboundOrdersTableOrderingComposer
    extends Composer<_$AppDatabase, $InboundOrdersTable> {
  $$InboundOrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operatorId => $composableBuilder(
      column: $table.operatorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get at => $composableBuilder(
      column: $table.at, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$InboundOrdersTableAnnotationComposer
    extends Composer<_$AppDatabase, $InboundOrdersTable> {
  $$InboundOrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<double> get qty =>
      $composableBuilder(column: $table.qty, builder: (column) => column);

  GeneratedColumn<String> get operatorId => $composableBuilder(
      column: $table.operatorId, builder: (column) => column);

  GeneratedColumn<DateTime> get at =>
      $composableBuilder(column: $table.at, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$InboundOrdersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InboundOrdersTable,
    InboundOrder,
    $$InboundOrdersTableFilterComposer,
    $$InboundOrdersTableOrderingComposer,
    $$InboundOrdersTableAnnotationComposer,
    $$InboundOrdersTableCreateCompanionBuilder,
    $$InboundOrdersTableUpdateCompanionBuilder,
    (
      InboundOrder,
      BaseReferences<_$AppDatabase, $InboundOrdersTable, InboundOrder>
    ),
    InboundOrder,
    PrefetchHooks Function()> {
  $$InboundOrdersTableTableManager(_$AppDatabase db, $InboundOrdersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InboundOrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InboundOrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InboundOrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<double> qty = const Value.absent(),
            Value<String> operatorId = const Value.absent(),
            Value<DateTime> at = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InboundOrdersCompanion(
            id: id,
            productId: productId,
            qty: qty,
            operatorId: operatorId,
            at: at,
            note: note,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String productId,
            required double qty,
            required String operatorId,
            required DateTime at,
            Value<String?> note = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InboundOrdersCompanion.insert(
            id: id,
            productId: productId,
            qty: qty,
            operatorId: operatorId,
            at: at,
            note: note,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InboundOrdersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $InboundOrdersTable,
    InboundOrder,
    $$InboundOrdersTableFilterComposer,
    $$InboundOrdersTableOrderingComposer,
    $$InboundOrdersTableAnnotationComposer,
    $$InboundOrdersTableCreateCompanionBuilder,
    $$InboundOrdersTableUpdateCompanionBuilder,
    (
      InboundOrder,
      BaseReferences<_$AppDatabase, $InboundOrdersTable, InboundOrder>
    ),
    InboundOrder,
    PrefetchHooks Function()>;
typedef $$OutboundOrdersTableCreateCompanionBuilder = OutboundOrdersCompanion
    Function({
  required String id,
  required String productId,
  required double qty,
  required OutboundReason reason,
  required String operatorId,
  required DateTime at,
  Value<String?> note,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$OutboundOrdersTableUpdateCompanionBuilder = OutboundOrdersCompanion
    Function({
  Value<String> id,
  Value<String> productId,
  Value<double> qty,
  Value<OutboundReason> reason,
  Value<String> operatorId,
  Value<DateTime> at,
  Value<String?> note,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$OutboundOrdersTableFilterComposer
    extends Composer<_$AppDatabase, $OutboundOrdersTable> {
  $$OutboundOrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<OutboundReason, OutboundReason, String>
      get reason => $composableBuilder(
          column: $table.reason,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get operatorId => $composableBuilder(
      column: $table.operatorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get at => $composableBuilder(
      column: $table.at, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$OutboundOrdersTableOrderingComposer
    extends Composer<_$AppDatabase, $OutboundOrdersTable> {
  $$OutboundOrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operatorId => $composableBuilder(
      column: $table.operatorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get at => $composableBuilder(
      column: $table.at, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$OutboundOrdersTableAnnotationComposer
    extends Composer<_$AppDatabase, $OutboundOrdersTable> {
  $$OutboundOrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<double> get qty =>
      $composableBuilder(column: $table.qty, builder: (column) => column);

  GeneratedColumnWithTypeConverter<OutboundReason, String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get operatorId => $composableBuilder(
      column: $table.operatorId, builder: (column) => column);

  GeneratedColumn<DateTime> get at =>
      $composableBuilder(column: $table.at, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$OutboundOrdersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OutboundOrdersTable,
    OutboundOrder,
    $$OutboundOrdersTableFilterComposer,
    $$OutboundOrdersTableOrderingComposer,
    $$OutboundOrdersTableAnnotationComposer,
    $$OutboundOrdersTableCreateCompanionBuilder,
    $$OutboundOrdersTableUpdateCompanionBuilder,
    (
      OutboundOrder,
      BaseReferences<_$AppDatabase, $OutboundOrdersTable, OutboundOrder>
    ),
    OutboundOrder,
    PrefetchHooks Function()> {
  $$OutboundOrdersTableTableManager(
      _$AppDatabase db, $OutboundOrdersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutboundOrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OutboundOrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OutboundOrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<double> qty = const Value.absent(),
            Value<OutboundReason> reason = const Value.absent(),
            Value<String> operatorId = const Value.absent(),
            Value<DateTime> at = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OutboundOrdersCompanion(
            id: id,
            productId: productId,
            qty: qty,
            reason: reason,
            operatorId: operatorId,
            at: at,
            note: note,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String productId,
            required double qty,
            required OutboundReason reason,
            required String operatorId,
            required DateTime at,
            Value<String?> note = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OutboundOrdersCompanion.insert(
            id: id,
            productId: productId,
            qty: qty,
            reason: reason,
            operatorId: operatorId,
            at: at,
            note: note,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OutboundOrdersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OutboundOrdersTable,
    OutboundOrder,
    $$OutboundOrdersTableFilterComposer,
    $$OutboundOrdersTableOrderingComposer,
    $$OutboundOrdersTableAnnotationComposer,
    $$OutboundOrdersTableCreateCompanionBuilder,
    $$OutboundOrdersTableUpdateCompanionBuilder,
    (
      OutboundOrder,
      BaseReferences<_$AppDatabase, $OutboundOrdersTable, OutboundOrder>
    ),
    OutboundOrder,
    PrefetchHooks Function()>;
typedef $$MedicationsTableCreateCompanionBuilder = MedicationsCompanion
    Function({
  required String id,
  required String memberId,
  required String name,
  required MedicationType type,
  required String dosage,
  required Frequency frequency,
  required List<TimeOfDay> times,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<bool> active,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$MedicationsTableUpdateCompanionBuilder = MedicationsCompanion
    Function({
  Value<String> id,
  Value<String> memberId,
  Value<String> name,
  Value<MedicationType> type,
  Value<String> dosage,
  Value<Frequency> frequency,
  Value<List<TimeOfDay>> times,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<bool> active,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$MedicationsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MedicationType, MedicationType, String>
      get type => $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get dosage => $composableBuilder(
      column: $table.dosage, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Frequency, Frequency, String> get frequency =>
      $composableBuilder(
          column: $table.frequency,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<TimeOfDay>, List<TimeOfDay>, String>
      get times => $composableBuilder(
          column: $table.times,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$MedicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dosage => $composableBuilder(
      column: $table.dosage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get times => $composableBuilder(
      column: $table.times, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$MedicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get memberId =>
      $composableBuilder(column: $table.memberId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MedicationType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get dosage =>
      $composableBuilder(column: $table.dosage, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Frequency, String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<TimeOfDay>, String> get times =>
      $composableBuilder(column: $table.times, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$MedicationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MedicationsTable,
    Medication,
    $$MedicationsTableFilterComposer,
    $$MedicationsTableOrderingComposer,
    $$MedicationsTableAnnotationComposer,
    $$MedicationsTableCreateCompanionBuilder,
    $$MedicationsTableUpdateCompanionBuilder,
    (Medication, BaseReferences<_$AppDatabase, $MedicationsTable, Medication>),
    Medication,
    PrefetchHooks Function()> {
  $$MedicationsTableTableManager(_$AppDatabase db, $MedicationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> memberId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<MedicationType> type = const Value.absent(),
            Value<String> dosage = const Value.absent(),
            Value<Frequency> frequency = const Value.absent(),
            Value<List<TimeOfDay>> times = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MedicationsCompanion(
            id: id,
            memberId: memberId,
            name: name,
            type: type,
            dosage: dosage,
            frequency: frequency,
            times: times,
            startDate: startDate,
            endDate: endDate,
            active: active,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String memberId,
            required String name,
            required MedicationType type,
            required String dosage,
            required Frequency frequency,
            required List<TimeOfDay> times,
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<bool> active = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MedicationsCompanion.insert(
            id: id,
            memberId: memberId,
            name: name,
            type: type,
            dosage: dosage,
            frequency: frequency,
            times: times,
            startDate: startDate,
            endDate: endDate,
            active: active,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MedicationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MedicationsTable,
    Medication,
    $$MedicationsTableFilterComposer,
    $$MedicationsTableOrderingComposer,
    $$MedicationsTableAnnotationComposer,
    $$MedicationsTableCreateCompanionBuilder,
    $$MedicationsTableUpdateCompanionBuilder,
    (Medication, BaseReferences<_$AppDatabase, $MedicationsTable, Medication>),
    Medication,
    PrefetchHooks Function()>;
typedef $$DoseSchedulesTableCreateCompanionBuilder = DoseSchedulesCompanion
    Function({
  required String id,
  required String medicationId,
  required String memberId,
  required DateTime scheduledTime,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$DoseSchedulesTableUpdateCompanionBuilder = DoseSchedulesCompanion
    Function({
  Value<String> id,
  Value<String> medicationId,
  Value<String> memberId,
  Value<DateTime> scheduledTime,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$DoseSchedulesTableFilterComposer
    extends Composer<_$AppDatabase, $DoseSchedulesTable> {
  $$DoseSchedulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get medicationId => $composableBuilder(
      column: $table.medicationId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$DoseSchedulesTableOrderingComposer
    extends Composer<_$AppDatabase, $DoseSchedulesTable> {
  $$DoseSchedulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get medicationId => $composableBuilder(
      column: $table.medicationId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$DoseSchedulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DoseSchedulesTable> {
  $$DoseSchedulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get medicationId => $composableBuilder(
      column: $table.medicationId, builder: (column) => column);

  GeneratedColumn<String> get memberId =>
      $composableBuilder(column: $table.memberId, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$DoseSchedulesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DoseSchedulesTable,
    DoseSchedule,
    $$DoseSchedulesTableFilterComposer,
    $$DoseSchedulesTableOrderingComposer,
    $$DoseSchedulesTableAnnotationComposer,
    $$DoseSchedulesTableCreateCompanionBuilder,
    $$DoseSchedulesTableUpdateCompanionBuilder,
    (
      DoseSchedule,
      BaseReferences<_$AppDatabase, $DoseSchedulesTable, DoseSchedule>
    ),
    DoseSchedule,
    PrefetchHooks Function()> {
  $$DoseSchedulesTableTableManager(_$AppDatabase db, $DoseSchedulesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DoseSchedulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DoseSchedulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DoseSchedulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> medicationId = const Value.absent(),
            Value<String> memberId = const Value.absent(),
            Value<DateTime> scheduledTime = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DoseSchedulesCompanion(
            id: id,
            medicationId: medicationId,
            memberId: memberId,
            scheduledTime: scheduledTime,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String medicationId,
            required String memberId,
            required DateTime scheduledTime,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DoseSchedulesCompanion.insert(
            id: id,
            medicationId: medicationId,
            memberId: memberId,
            scheduledTime: scheduledTime,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DoseSchedulesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DoseSchedulesTable,
    DoseSchedule,
    $$DoseSchedulesTableFilterComposer,
    $$DoseSchedulesTableOrderingComposer,
    $$DoseSchedulesTableAnnotationComposer,
    $$DoseSchedulesTableCreateCompanionBuilder,
    $$DoseSchedulesTableUpdateCompanionBuilder,
    (
      DoseSchedule,
      BaseReferences<_$AppDatabase, $DoseSchedulesTable, DoseSchedule>
    ),
    DoseSchedule,
    PrefetchHooks Function()>;
typedef $$DoseLogsTableCreateCompanionBuilder = DoseLogsCompanion Function({
  required String id,
  required String medicationId,
  required String memberId,
  required DateTime scheduledTime,
  required DoseStatus status,
  Value<DateTime?> takenAt,
  Value<String?> note,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$DoseLogsTableUpdateCompanionBuilder = DoseLogsCompanion Function({
  Value<String> id,
  Value<String> medicationId,
  Value<String> memberId,
  Value<DateTime> scheduledTime,
  Value<DoseStatus> status,
  Value<DateTime?> takenAt,
  Value<String?> note,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$DoseLogsTableFilterComposer
    extends Composer<_$AppDatabase, $DoseLogsTable> {
  $$DoseLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get medicationId => $composableBuilder(
      column: $table.medicationId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<DoseStatus, DoseStatus, String> get status =>
      $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get takenAt => $composableBuilder(
      column: $table.takenAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$DoseLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $DoseLogsTable> {
  $$DoseLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get medicationId => $composableBuilder(
      column: $table.medicationId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get takenAt => $composableBuilder(
      column: $table.takenAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$DoseLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DoseLogsTable> {
  $$DoseLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get medicationId => $composableBuilder(
      column: $table.medicationId, builder: (column) => column);

  GeneratedColumn<String> get memberId =>
      $composableBuilder(column: $table.memberId, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DoseStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get takenAt =>
      $composableBuilder(column: $table.takenAt, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$DoseLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DoseLogsTable,
    DoseLog,
    $$DoseLogsTableFilterComposer,
    $$DoseLogsTableOrderingComposer,
    $$DoseLogsTableAnnotationComposer,
    $$DoseLogsTableCreateCompanionBuilder,
    $$DoseLogsTableUpdateCompanionBuilder,
    (DoseLog, BaseReferences<_$AppDatabase, $DoseLogsTable, DoseLog>),
    DoseLog,
    PrefetchHooks Function()> {
  $$DoseLogsTableTableManager(_$AppDatabase db, $DoseLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DoseLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DoseLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DoseLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> medicationId = const Value.absent(),
            Value<String> memberId = const Value.absent(),
            Value<DateTime> scheduledTime = const Value.absent(),
            Value<DoseStatus> status = const Value.absent(),
            Value<DateTime?> takenAt = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DoseLogsCompanion(
            id: id,
            medicationId: medicationId,
            memberId: memberId,
            scheduledTime: scheduledTime,
            status: status,
            takenAt: takenAt,
            note: note,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String medicationId,
            required String memberId,
            required DateTime scheduledTime,
            required DoseStatus status,
            Value<DateTime?> takenAt = const Value.absent(),
            Value<String?> note = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DoseLogsCompanion.insert(
            id: id,
            medicationId: medicationId,
            memberId: memberId,
            scheduledTime: scheduledTime,
            status: status,
            takenAt: takenAt,
            note: note,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DoseLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DoseLogsTable,
    DoseLog,
    $$DoseLogsTableFilterComposer,
    $$DoseLogsTableOrderingComposer,
    $$DoseLogsTableAnnotationComposer,
    $$DoseLogsTableCreateCompanionBuilder,
    $$DoseLogsTableUpdateCompanionBuilder,
    (DoseLog, BaseReferences<_$AppDatabase, $DoseLogsTable, DoseLog>),
    DoseLog,
    PrefetchHooks Function()>;
typedef $$RecipesTableCreateCompanionBuilder = RecipesCompanion Function({
  required String id,
  required String name,
  required String steps,
  Value<int> servings,
  required List<String> tags,
  required String authorId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$RecipesTableUpdateCompanionBuilder = RecipesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> steps,
  Value<int> servings,
  Value<List<String>> tags,
  Value<String> authorId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$RecipesTableFilterComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get steps => $composableBuilder(
      column: $table.steps, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get servings => $composableBuilder(
      column: $table.servings, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
          column: $table.tags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get authorId => $composableBuilder(
      column: $table.authorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$RecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get steps => $composableBuilder(
      column: $table.steps, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get servings => $composableBuilder(
      column: $table.servings, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get authorId => $composableBuilder(
      column: $table.authorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$RecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get steps =>
      $composableBuilder(column: $table.steps, builder: (column) => column);

  GeneratedColumn<int> get servings =>
      $composableBuilder(column: $table.servings, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get authorId =>
      $composableBuilder(column: $table.authorId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$RecipesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecipesTable,
    Recipe,
    $$RecipesTableFilterComposer,
    $$RecipesTableOrderingComposer,
    $$RecipesTableAnnotationComposer,
    $$RecipesTableCreateCompanionBuilder,
    $$RecipesTableUpdateCompanionBuilder,
    (Recipe, BaseReferences<_$AppDatabase, $RecipesTable, Recipe>),
    Recipe,
    PrefetchHooks Function()> {
  $$RecipesTableTableManager(_$AppDatabase db, $RecipesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> steps = const Value.absent(),
            Value<int> servings = const Value.absent(),
            Value<List<String>> tags = const Value.absent(),
            Value<String> authorId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipesCompanion(
            id: id,
            name: name,
            steps: steps,
            servings: servings,
            tags: tags,
            authorId: authorId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String steps,
            Value<int> servings = const Value.absent(),
            required List<String> tags,
            required String authorId,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipesCompanion.insert(
            id: id,
            name: name,
            steps: steps,
            servings: servings,
            tags: tags,
            authorId: authorId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecipesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecipesTable,
    Recipe,
    $$RecipesTableFilterComposer,
    $$RecipesTableOrderingComposer,
    $$RecipesTableAnnotationComposer,
    $$RecipesTableCreateCompanionBuilder,
    $$RecipesTableUpdateCompanionBuilder,
    (Recipe, BaseReferences<_$AppDatabase, $RecipesTable, Recipe>),
    Recipe,
    PrefetchHooks Function()>;
typedef $$RecipeIngredientsTableCreateCompanionBuilder
    = RecipeIngredientsCompanion Function({
  required String recipeId,
  required String productId,
  required double amount,
  Value<String?> unit,
  Value<int> rowid,
});
typedef $$RecipeIngredientsTableUpdateCompanionBuilder
    = RecipeIngredientsCompanion Function({
  Value<String> recipeId,
  Value<String> productId,
  Value<double> amount,
  Value<String?> unit,
  Value<int> rowid,
});

class $$RecipeIngredientsTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTable> {
  $$RecipeIngredientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));
}

class $$RecipeIngredientsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTable> {
  $$RecipeIngredientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));
}

class $$RecipeIngredientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTable> {
  $$RecipeIngredientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get recipeId =>
      $composableBuilder(column: $table.recipeId, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);
}

class $$RecipeIngredientsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecipeIngredientsTable,
    RecipeIngredient,
    $$RecipeIngredientsTableFilterComposer,
    $$RecipeIngredientsTableOrderingComposer,
    $$RecipeIngredientsTableAnnotationComposer,
    $$RecipeIngredientsTableCreateCompanionBuilder,
    $$RecipeIngredientsTableUpdateCompanionBuilder,
    (
      RecipeIngredient,
      BaseReferences<_$AppDatabase, $RecipeIngredientsTable, RecipeIngredient>
    ),
    RecipeIngredient,
    PrefetchHooks Function()> {
  $$RecipeIngredientsTableTableManager(
      _$AppDatabase db, $RecipeIngredientsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeIngredientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeIngredientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeIngredientsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> recipeId = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String?> unit = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipeIngredientsCompanion(
            recipeId: recipeId,
            productId: productId,
            amount: amount,
            unit: unit,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String recipeId,
            required String productId,
            required double amount,
            Value<String?> unit = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipeIngredientsCompanion.insert(
            recipeId: recipeId,
            productId: productId,
            amount: amount,
            unit: unit,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecipeIngredientsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecipeIngredientsTable,
    RecipeIngredient,
    $$RecipeIngredientsTableFilterComposer,
    $$RecipeIngredientsTableOrderingComposer,
    $$RecipeIngredientsTableAnnotationComposer,
    $$RecipeIngredientsTableCreateCompanionBuilder,
    $$RecipeIngredientsTableUpdateCompanionBuilder,
    (
      RecipeIngredient,
      BaseReferences<_$AppDatabase, $RecipeIngredientsTable, RecipeIngredient>
    ),
    RecipeIngredient,
    PrefetchHooks Function()>;
typedef $$RecipeCookableBysTableCreateCompanionBuilder
    = RecipeCookableBysCompanion Function({
  required String recipeId,
  required String memberId,
  Value<int> rowid,
});
typedef $$RecipeCookableBysTableUpdateCompanionBuilder
    = RecipeCookableBysCompanion Function({
  Value<String> recipeId,
  Value<String> memberId,
  Value<int> rowid,
});

class $$RecipeCookableBysTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeCookableBysTable> {
  $$RecipeCookableBysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnFilters(column));
}

class $$RecipeCookableBysTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeCookableBysTable> {
  $$RecipeCookableBysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnOrderings(column));
}

class $$RecipeCookableBysTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeCookableBysTable> {
  $$RecipeCookableBysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get recipeId =>
      $composableBuilder(column: $table.recipeId, builder: (column) => column);

  GeneratedColumn<String> get memberId =>
      $composableBuilder(column: $table.memberId, builder: (column) => column);
}

class $$RecipeCookableBysTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecipeCookableBysTable,
    RecipeCookableBy,
    $$RecipeCookableBysTableFilterComposer,
    $$RecipeCookableBysTableOrderingComposer,
    $$RecipeCookableBysTableAnnotationComposer,
    $$RecipeCookableBysTableCreateCompanionBuilder,
    $$RecipeCookableBysTableUpdateCompanionBuilder,
    (
      RecipeCookableBy,
      BaseReferences<_$AppDatabase, $RecipeCookableBysTable, RecipeCookableBy>
    ),
    RecipeCookableBy,
    PrefetchHooks Function()> {
  $$RecipeCookableBysTableTableManager(
      _$AppDatabase db, $RecipeCookableBysTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeCookableBysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeCookableBysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeCookableBysTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> recipeId = const Value.absent(),
            Value<String> memberId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipeCookableBysCompanion(
            recipeId: recipeId,
            memberId: memberId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String recipeId,
            required String memberId,
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipeCookableBysCompanion.insert(
            recipeId: recipeId,
            memberId: memberId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecipeCookableBysTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecipeCookableBysTable,
    RecipeCookableBy,
    $$RecipeCookableBysTableFilterComposer,
    $$RecipeCookableBysTableOrderingComposer,
    $$RecipeCookableBysTableAnnotationComposer,
    $$RecipeCookableBysTableCreateCompanionBuilder,
    $$RecipeCookableBysTableUpdateCompanionBuilder,
    (
      RecipeCookableBy,
      BaseReferences<_$AppDatabase, $RecipeCookableBysTable, RecipeCookableBy>
    ),
    RecipeCookableBy,
    PrefetchHooks Function()>;
typedef $$DailyMealsTableCreateCompanionBuilder = DailyMealsCompanion Function({
  required String id,
  required DateTime date,
  required MealType mealType,
  required String recipeId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$DailyMealsTableUpdateCompanionBuilder = DailyMealsCompanion Function({
  Value<String> id,
  Value<DateTime> date,
  Value<MealType> mealType,
  Value<String> recipeId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$DailyMealsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyMealsTable> {
  $$DailyMealsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MealType, MealType, String> get mealType =>
      $composableBuilder(
          column: $table.mealType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$DailyMealsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyMealsTable> {
  $$DailyMealsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mealType => $composableBuilder(
      column: $table.mealType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$DailyMealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyMealsTable> {
  $$DailyMealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MealType, String> get mealType =>
      $composableBuilder(column: $table.mealType, builder: (column) => column);

  GeneratedColumn<String> get recipeId =>
      $composableBuilder(column: $table.recipeId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$DailyMealsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DailyMealsTable,
    DailyMeal,
    $$DailyMealsTableFilterComposer,
    $$DailyMealsTableOrderingComposer,
    $$DailyMealsTableAnnotationComposer,
    $$DailyMealsTableCreateCompanionBuilder,
    $$DailyMealsTableUpdateCompanionBuilder,
    (DailyMeal, BaseReferences<_$AppDatabase, $DailyMealsTable, DailyMeal>),
    DailyMeal,
    PrefetchHooks Function()> {
  $$DailyMealsTableTableManager(_$AppDatabase db, $DailyMealsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyMealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyMealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyMealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<MealType> mealType = const Value.absent(),
            Value<String> recipeId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyMealsCompanion(
            id: id,
            date: date,
            mealType: mealType,
            recipeId: recipeId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime date,
            required MealType mealType,
            required String recipeId,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyMealsCompanion.insert(
            id: id,
            date: date,
            mealType: mealType,
            recipeId: recipeId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DailyMealsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DailyMealsTable,
    DailyMeal,
    $$DailyMealsTableFilterComposer,
    $$DailyMealsTableOrderingComposer,
    $$DailyMealsTableAnnotationComposer,
    $$DailyMealsTableCreateCompanionBuilder,
    $$DailyMealsTableUpdateCompanionBuilder,
    (DailyMeal, BaseReferences<_$AppDatabase, $DailyMealsTable, DailyMeal>),
    DailyMeal,
    PrefetchHooks Function()>;
typedef $$MemosTableCreateCompanionBuilder = MemosCompanion Function({
  required String id,
  required String title,
  Value<String> body,
  required String authorId,
  Value<bool> pinned,
  Value<bool> done,
  Value<DateTime?> dueAt,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$MemosTableUpdateCompanionBuilder = MemosCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> body,
  Value<String> authorId,
  Value<bool> pinned,
  Value<bool> done,
  Value<DateTime?> dueAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$MemosTableFilterComposer extends Composer<_$AppDatabase, $MemosTable> {
  $$MemosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get authorId => $composableBuilder(
      column: $table.authorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get pinned => $composableBuilder(
      column: $table.pinned, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get done => $composableBuilder(
      column: $table.done, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueAt => $composableBuilder(
      column: $table.dueAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$MemosTableOrderingComposer
    extends Composer<_$AppDatabase, $MemosTable> {
  $$MemosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get authorId => $composableBuilder(
      column: $table.authorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get pinned => $composableBuilder(
      column: $table.pinned, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get done => $composableBuilder(
      column: $table.done, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueAt => $composableBuilder(
      column: $table.dueAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$MemosTableAnnotationComposer
    extends Composer<_$AppDatabase, $MemosTable> {
  $$MemosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get authorId =>
      $composableBuilder(column: $table.authorId, builder: (column) => column);

  GeneratedColumn<bool> get pinned =>
      $composableBuilder(column: $table.pinned, builder: (column) => column);

  GeneratedColumn<bool> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);

  GeneratedColumn<DateTime> get dueAt =>
      $composableBuilder(column: $table.dueAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$MemosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MemosTable,
    Memo,
    $$MemosTableFilterComposer,
    $$MemosTableOrderingComposer,
    $$MemosTableAnnotationComposer,
    $$MemosTableCreateCompanionBuilder,
    $$MemosTableUpdateCompanionBuilder,
    (Memo, BaseReferences<_$AppDatabase, $MemosTable, Memo>),
    Memo,
    PrefetchHooks Function()> {
  $$MemosTableTableManager(_$AppDatabase db, $MemosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MemosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> body = const Value.absent(),
            Value<String> authorId = const Value.absent(),
            Value<bool> pinned = const Value.absent(),
            Value<bool> done = const Value.absent(),
            Value<DateTime?> dueAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MemosCompanion(
            id: id,
            title: title,
            body: body,
            authorId: authorId,
            pinned: pinned,
            done: done,
            dueAt: dueAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<String> body = const Value.absent(),
            required String authorId,
            Value<bool> pinned = const Value.absent(),
            Value<bool> done = const Value.absent(),
            Value<DateTime?> dueAt = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MemosCompanion.insert(
            id: id,
            title: title,
            body: body,
            authorId: authorId,
            pinned: pinned,
            done: done,
            dueAt: dueAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MemosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MemosTable,
    Memo,
    $$MemosTableFilterComposer,
    $$MemosTableOrderingComposer,
    $$MemosTableAnnotationComposer,
    $$MemosTableCreateCompanionBuilder,
    $$MemosTableUpdateCompanionBuilder,
    (Memo, BaseReferences<_$AppDatabase, $MemosTable, Memo>),
    Memo,
    PrefetchHooks Function()>;
typedef $$TravelPlansTableCreateCompanionBuilder = TravelPlansCompanion
    Function({
  required String id,
  required String title,
  required DateTime start,
  required DateTime end,
  required List<String> memberIds,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$TravelPlansTableUpdateCompanionBuilder = TravelPlansCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<DateTime> start,
  Value<DateTime> end,
  Value<List<String>> memberIds,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$TravelPlansTableFilterComposer
    extends Composer<_$AppDatabase, $TravelPlansTable> {
  $$TravelPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get start => $composableBuilder(
      column: $table.start, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get end => $composableBuilder(
      column: $table.end, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get memberIds => $composableBuilder(
          column: $table.memberIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$TravelPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $TravelPlansTable> {
  $$TravelPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get start => $composableBuilder(
      column: $table.start, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get end => $composableBuilder(
      column: $table.end, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberIds => $composableBuilder(
      column: $table.memberIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$TravelPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $TravelPlansTable> {
  $$TravelPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get start =>
      $composableBuilder(column: $table.start, builder: (column) => column);

  GeneratedColumn<DateTime> get end =>
      $composableBuilder(column: $table.end, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get memberIds =>
      $composableBuilder(column: $table.memberIds, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$TravelPlansTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TravelPlansTable,
    TravelPlan,
    $$TravelPlansTableFilterComposer,
    $$TravelPlansTableOrderingComposer,
    $$TravelPlansTableAnnotationComposer,
    $$TravelPlansTableCreateCompanionBuilder,
    $$TravelPlansTableUpdateCompanionBuilder,
    (TravelPlan, BaseReferences<_$AppDatabase, $TravelPlansTable, TravelPlan>),
    TravelPlan,
    PrefetchHooks Function()> {
  $$TravelPlansTableTableManager(_$AppDatabase db, $TravelPlansTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TravelPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TravelPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TravelPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<DateTime> start = const Value.absent(),
            Value<DateTime> end = const Value.absent(),
            Value<List<String>> memberIds = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TravelPlansCompanion(
            id: id,
            title: title,
            start: start,
            end: end,
            memberIds: memberIds,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required DateTime start,
            required DateTime end,
            required List<String> memberIds,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TravelPlansCompanion.insert(
            id: id,
            title: title,
            start: start,
            end: end,
            memberIds: memberIds,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TravelPlansTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TravelPlansTable,
    TravelPlan,
    $$TravelPlansTableFilterComposer,
    $$TravelPlansTableOrderingComposer,
    $$TravelPlansTableAnnotationComposer,
    $$TravelPlansTableCreateCompanionBuilder,
    $$TravelPlansTableUpdateCompanionBuilder,
    (TravelPlan, BaseReferences<_$AppDatabase, $TravelPlansTable, TravelPlan>),
    TravelPlan,
    PrefetchHooks Function()>;
typedef $$TravelDaysTableCreateCompanionBuilder = TravelDaysCompanion Function({
  required String id,
  required String planId,
  required int dayIndex,
  required DateTime date,
  Value<String> agenda,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$TravelDaysTableUpdateCompanionBuilder = TravelDaysCompanion Function({
  Value<String> id,
  Value<String> planId,
  Value<int> dayIndex,
  Value<DateTime> date,
  Value<String> agenda,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$TravelDaysTableFilterComposer
    extends Composer<_$AppDatabase, $TravelDaysTable> {
  $$TravelDaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get planId => $composableBuilder(
      column: $table.planId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dayIndex => $composableBuilder(
      column: $table.dayIndex, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get agenda => $composableBuilder(
      column: $table.agenda, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$TravelDaysTableOrderingComposer
    extends Composer<_$AppDatabase, $TravelDaysTable> {
  $$TravelDaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get planId => $composableBuilder(
      column: $table.planId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dayIndex => $composableBuilder(
      column: $table.dayIndex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get agenda => $composableBuilder(
      column: $table.agenda, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$TravelDaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $TravelDaysTable> {
  $$TravelDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get planId =>
      $composableBuilder(column: $table.planId, builder: (column) => column);

  GeneratedColumn<int> get dayIndex =>
      $composableBuilder(column: $table.dayIndex, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get agenda =>
      $composableBuilder(column: $table.agenda, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$TravelDaysTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TravelDaysTable,
    TravelDay,
    $$TravelDaysTableFilterComposer,
    $$TravelDaysTableOrderingComposer,
    $$TravelDaysTableAnnotationComposer,
    $$TravelDaysTableCreateCompanionBuilder,
    $$TravelDaysTableUpdateCompanionBuilder,
    (TravelDay, BaseReferences<_$AppDatabase, $TravelDaysTable, TravelDay>),
    TravelDay,
    PrefetchHooks Function()> {
  $$TravelDaysTableTableManager(_$AppDatabase db, $TravelDaysTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TravelDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TravelDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TravelDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> planId = const Value.absent(),
            Value<int> dayIndex = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> agenda = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TravelDaysCompanion(
            id: id,
            planId: planId,
            dayIndex: dayIndex,
            date: date,
            agenda: agenda,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String planId,
            required int dayIndex,
            required DateTime date,
            Value<String> agenda = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TravelDaysCompanion.insert(
            id: id,
            planId: planId,
            dayIndex: dayIndex,
            date: date,
            agenda: agenda,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TravelDaysTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TravelDaysTable,
    TravelDay,
    $$TravelDaysTableFilterComposer,
    $$TravelDaysTableOrderingComposer,
    $$TravelDaysTableAnnotationComposer,
    $$TravelDaysTableCreateCompanionBuilder,
    $$TravelDaysTableUpdateCompanionBuilder,
    (TravelDay, BaseReferences<_$AppDatabase, $TravelDaysTable, TravelDay>),
    TravelDay,
    PrefetchHooks Function()>;
typedef $$TravelItemsTableCreateCompanionBuilder = TravelItemsCompanion
    Function({
  required String id,
  required String planId,
  required TravelItemType type,
  required String name,
  Value<double?> qty,
  Value<double?> amount,
  Value<bool> done,
  Value<String?> assignedTo,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$TravelItemsTableUpdateCompanionBuilder = TravelItemsCompanion
    Function({
  Value<String> id,
  Value<String> planId,
  Value<TravelItemType> type,
  Value<String> name,
  Value<double?> qty,
  Value<double?> amount,
  Value<bool> done,
  Value<String?> assignedTo,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$TravelItemsTableFilterComposer
    extends Composer<_$AppDatabase, $TravelItemsTable> {
  $$TravelItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get planId => $composableBuilder(
      column: $table.planId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<TravelItemType, TravelItemType, String>
      get type => $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get done => $composableBuilder(
      column: $table.done, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assignedTo => $composableBuilder(
      column: $table.assignedTo, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$TravelItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $TravelItemsTable> {
  $$TravelItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get planId => $composableBuilder(
      column: $table.planId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get done => $composableBuilder(
      column: $table.done, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assignedTo => $composableBuilder(
      column: $table.assignedTo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$TravelItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TravelItemsTable> {
  $$TravelItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get planId =>
      $composableBuilder(column: $table.planId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TravelItemType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get qty =>
      $composableBuilder(column: $table.qty, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<bool> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);

  GeneratedColumn<String> get assignedTo => $composableBuilder(
      column: $table.assignedTo, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$TravelItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TravelItemsTable,
    TravelItem,
    $$TravelItemsTableFilterComposer,
    $$TravelItemsTableOrderingComposer,
    $$TravelItemsTableAnnotationComposer,
    $$TravelItemsTableCreateCompanionBuilder,
    $$TravelItemsTableUpdateCompanionBuilder,
    (TravelItem, BaseReferences<_$AppDatabase, $TravelItemsTable, TravelItem>),
    TravelItem,
    PrefetchHooks Function()> {
  $$TravelItemsTableTableManager(_$AppDatabase db, $TravelItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TravelItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TravelItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TravelItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> planId = const Value.absent(),
            Value<TravelItemType> type = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double?> qty = const Value.absent(),
            Value<double?> amount = const Value.absent(),
            Value<bool> done = const Value.absent(),
            Value<String?> assignedTo = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TravelItemsCompanion(
            id: id,
            planId: planId,
            type: type,
            name: name,
            qty: qty,
            amount: amount,
            done: done,
            assignedTo: assignedTo,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String planId,
            required TravelItemType type,
            required String name,
            Value<double?> qty = const Value.absent(),
            Value<double?> amount = const Value.absent(),
            Value<bool> done = const Value.absent(),
            Value<String?> assignedTo = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TravelItemsCompanion.insert(
            id: id,
            planId: planId,
            type: type,
            name: name,
            qty: qty,
            amount: amount,
            done: done,
            assignedTo: assignedTo,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TravelItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TravelItemsTable,
    TravelItem,
    $$TravelItemsTableFilterComposer,
    $$TravelItemsTableOrderingComposer,
    $$TravelItemsTableAnnotationComposer,
    $$TravelItemsTableCreateCompanionBuilder,
    $$TravelItemsTableUpdateCompanionBuilder,
    (TravelItem, BaseReferences<_$AppDatabase, $TravelItemsTable, TravelItem>),
    TravelItem,
    PrefetchHooks Function()>;
typedef $$ReminderRulesTableCreateCompanionBuilder = ReminderRulesCompanion
    Function({
  required String id,
  required ReminderType type,
  required String sourceRef,
  required ChannelType channel,
  required Map<String, dynamic> config,
  Value<String?> memberId,
  Value<bool> enabled,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$ReminderRulesTableUpdateCompanionBuilder = ReminderRulesCompanion
    Function({
  Value<String> id,
  Value<ReminderType> type,
  Value<String> sourceRef,
  Value<ChannelType> channel,
  Value<Map<String, dynamic>> config,
  Value<String?> memberId,
  Value<bool> enabled,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$ReminderRulesTableFilterComposer
    extends Composer<_$AppDatabase, $ReminderRulesTable> {
  $$ReminderRulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ReminderType, ReminderType, String> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get sourceRef => $composableBuilder(
      column: $table.sourceRef, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ChannelType, ChannelType, String>
      get channel => $composableBuilder(
          column: $table.channel,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get config => $composableBuilder(
          column: $table.config,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get enabled => $composableBuilder(
      column: $table.enabled, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$ReminderRulesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReminderRulesTable> {
  $$ReminderRulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceRef => $composableBuilder(
      column: $table.sourceRef, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get channel => $composableBuilder(
      column: $table.channel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get config => $composableBuilder(
      column: $table.config, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberId => $composableBuilder(
      column: $table.memberId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get enabled => $composableBuilder(
      column: $table.enabled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$ReminderRulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReminderRulesTable> {
  $$ReminderRulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ReminderType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get sourceRef =>
      $composableBuilder(column: $table.sourceRef, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ChannelType, String> get channel =>
      $composableBuilder(column: $table.channel, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get config =>
      $composableBuilder(column: $table.config, builder: (column) => column);

  GeneratedColumn<String> get memberId =>
      $composableBuilder(column: $table.memberId, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$ReminderRulesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReminderRulesTable,
    ReminderRule,
    $$ReminderRulesTableFilterComposer,
    $$ReminderRulesTableOrderingComposer,
    $$ReminderRulesTableAnnotationComposer,
    $$ReminderRulesTableCreateCompanionBuilder,
    $$ReminderRulesTableUpdateCompanionBuilder,
    (
      ReminderRule,
      BaseReferences<_$AppDatabase, $ReminderRulesTable, ReminderRule>
    ),
    ReminderRule,
    PrefetchHooks Function()> {
  $$ReminderRulesTableTableManager(_$AppDatabase db, $ReminderRulesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReminderRulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReminderRulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReminderRulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<ReminderType> type = const Value.absent(),
            Value<String> sourceRef = const Value.absent(),
            Value<ChannelType> channel = const Value.absent(),
            Value<Map<String, dynamic>> config = const Value.absent(),
            Value<String?> memberId = const Value.absent(),
            Value<bool> enabled = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReminderRulesCompanion(
            id: id,
            type: type,
            sourceRef: sourceRef,
            channel: channel,
            config: config,
            memberId: memberId,
            enabled: enabled,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required ReminderType type,
            required String sourceRef,
            required ChannelType channel,
            required Map<String, dynamic> config,
            Value<String?> memberId = const Value.absent(),
            Value<bool> enabled = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReminderRulesCompanion.insert(
            id: id,
            type: type,
            sourceRef: sourceRef,
            channel: channel,
            config: config,
            memberId: memberId,
            enabled: enabled,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReminderRulesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReminderRulesTable,
    ReminderRule,
    $$ReminderRulesTableFilterComposer,
    $$ReminderRulesTableOrderingComposer,
    $$ReminderRulesTableAnnotationComposer,
    $$ReminderRulesTableCreateCompanionBuilder,
    $$ReminderRulesTableUpdateCompanionBuilder,
    (
      ReminderRule,
      BaseReferences<_$AppDatabase, $ReminderRulesTable, ReminderRule>
    ),
    ReminderRule,
    PrefetchHooks Function()>;
typedef $$ReminderLogsTableCreateCompanionBuilder = ReminderLogsCompanion
    Function({
  required String id,
  required String ruleId,
  required DateTime firedAt,
  required ChannelType channel,
  Value<String> status,
  Value<String?> payload,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$ReminderLogsTableUpdateCompanionBuilder = ReminderLogsCompanion
    Function({
  Value<String> id,
  Value<String> ruleId,
  Value<DateTime> firedAt,
  Value<ChannelType> channel,
  Value<String> status,
  Value<String?> payload,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> version,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$ReminderLogsTableFilterComposer
    extends Composer<_$AppDatabase, $ReminderLogsTable> {
  $$ReminderLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ruleId => $composableBuilder(
      column: $table.ruleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get firedAt => $composableBuilder(
      column: $table.firedAt, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ChannelType, ChannelType, String>
      get channel => $composableBuilder(
          column: $table.channel,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$ReminderLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReminderLogsTable> {
  $$ReminderLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ruleId => $composableBuilder(
      column: $table.ruleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get firedAt => $composableBuilder(
      column: $table.firedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get channel => $composableBuilder(
      column: $table.channel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$ReminderLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReminderLogsTable> {
  $$ReminderLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ruleId =>
      $composableBuilder(column: $table.ruleId, builder: (column) => column);

  GeneratedColumn<DateTime> get firedAt =>
      $composableBuilder(column: $table.firedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ChannelType, String> get channel =>
      $composableBuilder(column: $table.channel, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$ReminderLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReminderLogsTable,
    ReminderLog,
    $$ReminderLogsTableFilterComposer,
    $$ReminderLogsTableOrderingComposer,
    $$ReminderLogsTableAnnotationComposer,
    $$ReminderLogsTableCreateCompanionBuilder,
    $$ReminderLogsTableUpdateCompanionBuilder,
    (
      ReminderLog,
      BaseReferences<_$AppDatabase, $ReminderLogsTable, ReminderLog>
    ),
    ReminderLog,
    PrefetchHooks Function()> {
  $$ReminderLogsTableTableManager(_$AppDatabase db, $ReminderLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReminderLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReminderLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReminderLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> ruleId = const Value.absent(),
            Value<DateTime> firedAt = const Value.absent(),
            Value<ChannelType> channel = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> payload = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReminderLogsCompanion(
            id: id,
            ruleId: ruleId,
            firedAt: firedAt,
            channel: channel,
            status: status,
            payload: payload,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String ruleId,
            required DateTime firedAt,
            required ChannelType channel,
            Value<String> status = const Value.absent(),
            Value<String?> payload = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReminderLogsCompanion.insert(
            id: id,
            ruleId: ruleId,
            firedAt: firedAt,
            channel: channel,
            status: status,
            payload: payload,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReminderLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReminderLogsTable,
    ReminderLog,
    $$ReminderLogsTableFilterComposer,
    $$ReminderLogsTableOrderingComposer,
    $$ReminderLogsTableAnnotationComposer,
    $$ReminderLogsTableCreateCompanionBuilder,
    $$ReminderLogsTableUpdateCompanionBuilder,
    (
      ReminderLog,
      BaseReferences<_$AppDatabase, $ReminderLogsTable, ReminderLog>
    ),
    ReminderLog,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MembersTableTableManager get members =>
      $$MembersTableTableManager(_db, _db.members);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$StockBatchesTableTableManager get stockBatches =>
      $$StockBatchesTableTableManager(_db, _db.stockBatches);
  $$InboundOrdersTableTableManager get inboundOrders =>
      $$InboundOrdersTableTableManager(_db, _db.inboundOrders);
  $$OutboundOrdersTableTableManager get outboundOrders =>
      $$OutboundOrdersTableTableManager(_db, _db.outboundOrders);
  $$MedicationsTableTableManager get medications =>
      $$MedicationsTableTableManager(_db, _db.medications);
  $$DoseSchedulesTableTableManager get doseSchedules =>
      $$DoseSchedulesTableTableManager(_db, _db.doseSchedules);
  $$DoseLogsTableTableManager get doseLogs =>
      $$DoseLogsTableTableManager(_db, _db.doseLogs);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db, _db.recipes);
  $$RecipeIngredientsTableTableManager get recipeIngredients =>
      $$RecipeIngredientsTableTableManager(_db, _db.recipeIngredients);
  $$RecipeCookableBysTableTableManager get recipeCookableBys =>
      $$RecipeCookableBysTableTableManager(_db, _db.recipeCookableBys);
  $$DailyMealsTableTableManager get dailyMeals =>
      $$DailyMealsTableTableManager(_db, _db.dailyMeals);
  $$MemosTableTableManager get memos =>
      $$MemosTableTableManager(_db, _db.memos);
  $$TravelPlansTableTableManager get travelPlans =>
      $$TravelPlansTableTableManager(_db, _db.travelPlans);
  $$TravelDaysTableTableManager get travelDays =>
      $$TravelDaysTableTableManager(_db, _db.travelDays);
  $$TravelItemsTableTableManager get travelItems =>
      $$TravelItemsTableTableManager(_db, _db.travelItems);
  $$ReminderRulesTableTableManager get reminderRules =>
      $$ReminderRulesTableTableManager(_db, _db.reminderRules);
  $$ReminderLogsTableTableManager get reminderLogs =>
      $$ReminderLogsTableTableManager(_db, _db.reminderLogs);
}
