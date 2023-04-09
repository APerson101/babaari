// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adhocstaff.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAddHocStaffCollection on Isar {
  IsarCollection<AddHocStaff> get addHocStaffs => this.collection();
}

const AddHocStaffSchema = CollectionSchema(
  name: r'AddHocStaff',
  id: 5665395904090791295,
  properties: {
    r'accountName': PropertySchema(
      id: 0,
      name: r'accountName',
      type: IsarType.string,
    ),
    r'accountNumber': PropertySchema(
      id: 1,
      name: r'accountNumber',
      type: IsarType.string,
    ),
    r'bankName': PropertySchema(
      id: 2,
      name: r'bankName',
      type: IsarType.string,
    ),
    r'courseOfStudy': PropertySchema(
      id: 3,
      name: r'courseOfStudy',
      type: IsarType.string,
    ),
    r'department': PropertySchema(
      id: 4,
      name: r'department',
      type: IsarType.string,
    ),
    r'endDate': PropertySchema(
      id: 5,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'firstname': PropertySchema(
      id: 6,
      name: r'firstname',
      type: IsarType.string,
    ),
    r'houseAddress': PropertySchema(
      id: 7,
      name: r'houseAddress',
      type: IsarType.string,
    ),
    r'institutionName': PropertySchema(
      id: 8,
      name: r'institutionName',
      type: IsarType.string,
    ),
    r'lastname': PropertySchema(
      id: 9,
      name: r'lastname',
      type: IsarType.string,
    ),
    r'nokAddress': PropertySchema(
      id: 10,
      name: r'nokAddress',
      type: IsarType.string,
    ),
    r'nokName': PropertySchema(
      id: 11,
      name: r'nokName',
      type: IsarType.string,
    ),
    r'nokNumber': PropertySchema(
      id: 12,
      name: r'nokNumber',
      type: IsarType.string,
    ),
    r'phoneNumber': PropertySchema(
      id: 13,
      name: r'phoneNumber',
      type: IsarType.string,
    ),
    r'registeredDate': PropertySchema(
      id: 14,
      name: r'registeredDate',
      type: IsarType.dateTime,
    ),
    r'schoolID': PropertySchema(
      id: 15,
      name: r'schoolID',
      type: IsarType.string,
    ),
    r'staffID': PropertySchema(
      id: 16,
      name: r'staffID',
      type: IsarType.string,
    ),
    r'staffType': PropertySchema(
      id: 17,
      name: r'staffType',
      type: IsarType.string,
      enumMap: _AddHocStaffstaffTypeEnumValueMap,
    ),
    r'startDate': PropertySchema(
      id: 18,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'stateCode': PropertySchema(
      id: 19,
      name: r'stateCode',
      type: IsarType.string,
    ),
    r'unit': PropertySchema(
      id: 20,
      name: r'unit',
      type: IsarType.string,
    )
  },
  estimateSize: _addHocStaffEstimateSize,
  serialize: _addHocStaffSerialize,
  deserialize: _addHocStaffDeserialize,
  deserializeProp: _addHocStaffDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _addHocStaffGetId,
  getLinks: _addHocStaffGetLinks,
  attach: _addHocStaffAttach,
  version: '3.0.5',
);

int _addHocStaffEstimateSize(
  AddHocStaff object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accountName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.accountNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.bankName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.courseOfStudy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.department;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.firstname;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.houseAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.institutionName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastname;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nokAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nokName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nokNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phoneNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.schoolID;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.staffID;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.staffType.name.length * 3;
  {
    final value = object.stateCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _addHocStaffSerialize(
  AddHocStaff object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accountName);
  writer.writeString(offsets[1], object.accountNumber);
  writer.writeString(offsets[2], object.bankName);
  writer.writeString(offsets[3], object.courseOfStudy);
  writer.writeString(offsets[4], object.department);
  writer.writeDateTime(offsets[5], object.endDate);
  writer.writeString(offsets[6], object.firstname);
  writer.writeString(offsets[7], object.houseAddress);
  writer.writeString(offsets[8], object.institutionName);
  writer.writeString(offsets[9], object.lastname);
  writer.writeString(offsets[10], object.nokAddress);
  writer.writeString(offsets[11], object.nokName);
  writer.writeString(offsets[12], object.nokNumber);
  writer.writeString(offsets[13], object.phoneNumber);
  writer.writeDateTime(offsets[14], object.registeredDate);
  writer.writeString(offsets[15], object.schoolID);
  writer.writeString(offsets[16], object.staffID);
  writer.writeString(offsets[17], object.staffType.name);
  writer.writeDateTime(offsets[18], object.startDate);
  writer.writeString(offsets[19], object.stateCode);
  writer.writeString(offsets[20], object.unit);
}

AddHocStaff _addHocStaffDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AddHocStaff();
  object.accountName = reader.readStringOrNull(offsets[0]);
  object.accountNumber = reader.readStringOrNull(offsets[1]);
  object.bankName = reader.readStringOrNull(offsets[2]);
  object.courseOfStudy = reader.readStringOrNull(offsets[3]);
  object.department = reader.readStringOrNull(offsets[4]);
  object.endDate = reader.readDateTimeOrNull(offsets[5]);
  object.firstname = reader.readStringOrNull(offsets[6]);
  object.houseAddress = reader.readStringOrNull(offsets[7]);
  object.id = id;
  object.institutionName = reader.readStringOrNull(offsets[8]);
  object.lastname = reader.readStringOrNull(offsets[9]);
  object.nokAddress = reader.readStringOrNull(offsets[10]);
  object.nokName = reader.readStringOrNull(offsets[11]);
  object.nokNumber = reader.readStringOrNull(offsets[12]);
  object.phoneNumber = reader.readStringOrNull(offsets[13]);
  object.registeredDate = reader.readDateTimeOrNull(offsets[14]);
  object.schoolID = reader.readStringOrNull(offsets[15]);
  object.staffID = reader.readStringOrNull(offsets[16]);
  object.staffType =
      _AddHocStaffstaffTypeValueEnumMap[reader.readStringOrNull(offsets[17])] ??
          AddHocStaffType.siwes;
  object.startDate = reader.readDateTimeOrNull(offsets[18]);
  object.stateCode = reader.readStringOrNull(offsets[19]);
  object.unit = reader.readStringOrNull(offsets[20]);
  return object;
}

P _addHocStaffDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (_AddHocStaffstaffTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          AddHocStaffType.siwes) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AddHocStaffstaffTypeEnumValueMap = {
  r'siwes': r'siwes',
  r'corper': r'corper',
};
const _AddHocStaffstaffTypeValueEnumMap = {
  r'siwes': AddHocStaffType.siwes,
  r'corper': AddHocStaffType.corper,
};

Id _addHocStaffGetId(AddHocStaff object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _addHocStaffGetLinks(AddHocStaff object) {
  return [];
}

void _addHocStaffAttach(
    IsarCollection<dynamic> col, Id id, AddHocStaff object) {
  object.id = id;
}

extension AddHocStaffQueryWhereSort
    on QueryBuilder<AddHocStaff, AddHocStaff, QWhere> {
  QueryBuilder<AddHocStaff, AddHocStaff, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AddHocStaffQueryWhere
    on QueryBuilder<AddHocStaff, AddHocStaff, QWhereClause> {
  QueryBuilder<AddHocStaff, AddHocStaff, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AddHocStaffQueryFilter
    on QueryBuilder<AddHocStaff, AddHocStaff, QFilterCondition> {
  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accountName',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accountName',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountName',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountName',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accountNumber',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accountNumber',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      accountNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      bankNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bankName',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      bankNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bankName',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> bankNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      bankNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      bankNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> bankNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      bankNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      bankNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      bankNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> bankNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bankName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      bankNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      bankNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      courseOfStudyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'courseOfStudy',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      courseOfStudyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'courseOfStudy',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      courseOfStudyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseOfStudy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      courseOfStudyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'courseOfStudy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      courseOfStudyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'courseOfStudy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      courseOfStudyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'courseOfStudy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      courseOfStudyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'courseOfStudy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      courseOfStudyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'courseOfStudy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      courseOfStudyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'courseOfStudy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      courseOfStudyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'courseOfStudy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      courseOfStudyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseOfStudy',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      courseOfStudyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'courseOfStudy',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      departmentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'department',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      departmentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'department',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      departmentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      departmentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      departmentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      departmentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'department',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      departmentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      departmentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      departmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      departmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'department',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> endDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      endDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> endDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> endDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      firstnameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstname',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      firstnameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstname',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      firstnameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      firstnameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      firstnameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      firstnameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstname',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      firstnameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firstname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      firstnameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firstname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      firstnameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firstname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      firstnameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firstname',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      firstnameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstname',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      firstnameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firstname',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      houseAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'houseAddress',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      houseAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'houseAddress',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      houseAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'houseAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      houseAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'houseAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      houseAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'houseAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      houseAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'houseAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      houseAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'houseAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      houseAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'houseAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      houseAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'houseAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      houseAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'houseAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      houseAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'houseAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      houseAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'houseAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      institutionNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'institutionName',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      institutionNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'institutionName',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      institutionNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'institutionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      institutionNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'institutionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      institutionNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'institutionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      institutionNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'institutionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      institutionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'institutionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      institutionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'institutionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      institutionNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'institutionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      institutionNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'institutionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      institutionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'institutionName',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      institutionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'institutionName',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      lastnameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastname',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      lastnameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastname',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> lastnameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      lastnameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      lastnameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> lastnameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastname',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      lastnameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      lastnameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      lastnameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> lastnameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastname',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      lastnameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastname',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      lastnameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastname',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nokAddress',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nokAddress',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nokAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nokAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nokAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nokAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nokAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nokAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nokAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nokAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nokName',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nokName',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> nokNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nokName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> nokNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nokName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> nokNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nokName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nokName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> nokNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nokName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> nokNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nokName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> nokNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nokName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokName',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nokName',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nokNumber',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nokNumber',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nokNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nokNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nokNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nokNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nokNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nokNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nokNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      nokNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nokNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      phoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      phoneNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      phoneNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      phoneNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      phoneNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      phoneNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      phoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      phoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      phoneNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      phoneNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      registeredDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'registeredDate',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      registeredDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'registeredDate',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      registeredDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registeredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      registeredDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'registeredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      registeredDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'registeredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      registeredDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'registeredDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      schoolIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'schoolID',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      schoolIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'schoolID',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> schoolIDEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'schoolID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      schoolIDGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'schoolID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      schoolIDLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'schoolID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> schoolIDBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'schoolID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      schoolIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'schoolID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      schoolIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'schoolID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      schoolIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'schoolID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> schoolIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'schoolID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      schoolIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'schoolID',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      schoolIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'schoolID',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'staffID',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'staffID',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> staffIDEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'staffID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffIDGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'staffID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> staffIDLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'staffID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> staffIDBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'staffID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'staffID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> staffIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'staffID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> staffIDContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'staffID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> staffIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'staffID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'staffID',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'staffID',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffTypeEqualTo(
    AddHocStaffType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'staffType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffTypeGreaterThan(
    AddHocStaffType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'staffType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffTypeLessThan(
    AddHocStaffType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'staffType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffTypeBetween(
    AddHocStaffType lower,
    AddHocStaffType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'staffType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'staffType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'staffType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'staffType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'staffType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'staffType',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      staffTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'staffType',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      startDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      stateCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stateCode',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      stateCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stateCode',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      stateCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stateCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      stateCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stateCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      stateCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stateCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      stateCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stateCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      stateCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stateCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      stateCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stateCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      stateCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stateCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      stateCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stateCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      stateCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stateCode',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      stateCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stateCode',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> unitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      unitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> unitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> unitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> unitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> unitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> unitContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> unitMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition> unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }
}

extension AddHocStaffQueryObject
    on QueryBuilder<AddHocStaff, AddHocStaff, QFilterCondition> {}

extension AddHocStaffQueryLinks
    on QueryBuilder<AddHocStaff, AddHocStaff, QFilterCondition> {}

extension AddHocStaffQuerySortBy
    on QueryBuilder<AddHocStaff, AddHocStaff, QSortBy> {
  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy>
      sortByAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByCourseOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseOfStudy', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy>
      sortByCourseOfStudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseOfStudy', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByFirstname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstname', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByFirstnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstname', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByHouseAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'houseAddress', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy>
      sortByHouseAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'houseAddress', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByInstitutionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'institutionName', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy>
      sortByInstitutionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'institutionName', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByLastname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastname', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByLastnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastname', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByNokAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokAddress', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByNokAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokAddress', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByNokName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokName', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByNokNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokName', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByNokNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokNumber', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByNokNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokNumber', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByRegisteredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registeredDate', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy>
      sortByRegisteredDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registeredDate', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortBySchoolID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schoolID', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortBySchoolIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schoolID', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByStaffID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'staffID', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByStaffIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'staffID', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByStaffType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'staffType', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByStaffTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'staffType', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByStateCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stateCode', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByStateCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stateCode', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension AddHocStaffQuerySortThenBy
    on QueryBuilder<AddHocStaff, AddHocStaff, QSortThenBy> {
  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy>
      thenByAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByCourseOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseOfStudy', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy>
      thenByCourseOfStudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseOfStudy', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByFirstname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstname', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByFirstnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstname', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByHouseAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'houseAddress', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy>
      thenByHouseAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'houseAddress', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByInstitutionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'institutionName', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy>
      thenByInstitutionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'institutionName', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByLastname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastname', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByLastnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastname', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByNokAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokAddress', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByNokAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokAddress', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByNokName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokName', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByNokNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokName', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByNokNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokNumber', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByNokNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokNumber', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByRegisteredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registeredDate', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy>
      thenByRegisteredDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registeredDate', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenBySchoolID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schoolID', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenBySchoolIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schoolID', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByStaffID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'staffID', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByStaffIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'staffID', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByStaffType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'staffType', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByStaffTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'staffType', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByStateCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stateCode', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByStateCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stateCode', Sort.desc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QAfterSortBy> thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension AddHocStaffQueryWhereDistinct
    on QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> {
  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByAccountName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByAccountNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByBankName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByCourseOfStudy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'courseOfStudy',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByDepartment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByFirstname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstname', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByHouseAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'houseAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByInstitutionName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'institutionName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByLastname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastname', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByNokAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nokAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByNokName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nokName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByNokNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nokNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByPhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByRegisteredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registeredDate');
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctBySchoolID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'schoolID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByStaffID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'staffID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByStaffType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'staffType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByStateCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stateCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaff, QDistinct> distinctByUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }
}

extension AddHocStaffQueryProperty
    on QueryBuilder<AddHocStaff, AddHocStaff, QQueryProperty> {
  QueryBuilder<AddHocStaff, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> accountNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountName');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> accountNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountNumber');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> bankNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankName');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> courseOfStudyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'courseOfStudy');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<AddHocStaff, DateTime?, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> firstnameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstname');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> houseAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'houseAddress');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations>
      institutionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'institutionName');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> lastnameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastname');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> nokAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nokAddress');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> nokNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nokName');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> nokNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nokNumber');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
    });
  }

  QueryBuilder<AddHocStaff, DateTime?, QQueryOperations>
      registeredDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registeredDate');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> schoolIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'schoolID');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> staffIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'staffID');
    });
  }

  QueryBuilder<AddHocStaff, AddHocStaffType, QQueryOperations>
      staffTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'staffType');
    });
  }

  QueryBuilder<AddHocStaff, DateTime?, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> stateCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stateCode');
    });
  }

  QueryBuilder<AddHocStaff, String?, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }
}
