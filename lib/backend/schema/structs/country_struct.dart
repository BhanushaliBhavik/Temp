// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CountryStruct extends FFFirebaseStruct {
  CountryStruct({
    String? name,
    String? flag,
    String? code,
    String? dialCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _flag = flag,
        _code = code,
        _dialCode = dialCode,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "flag" field.
  String? _flag;
  String get flag => _flag ?? '';
  set flag(String? val) => _flag = val;

  bool hasFlag() => _flag != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "dial_code" field.
  String? _dialCode;
  String get dialCode => _dialCode ?? '';
  set dialCode(String? val) => _dialCode = val;

  bool hasDialCode() => _dialCode != null;

  static CountryStruct fromMap(Map<String, dynamic> data) => CountryStruct(
        name: data['name'] as String?,
        flag: data['flag'] as String?,
        code: data['code'] as String?,
        dialCode: data['dial_code'] as String?,
      );

  static CountryStruct? maybeFromMap(dynamic data) =>
      data is Map ? CountryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'flag': _flag,
        'code': _code,
        'dial_code': _dialCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'flag': serializeParam(
          _flag,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'dial_code': serializeParam(
          _dialCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static CountryStruct fromSerializableMap(Map<String, dynamic> data) =>
      CountryStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        flag: deserializeParam(
          data['flag'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        dialCode: deserializeParam(
          data['dial_code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CountryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CountryStruct &&
        name == other.name &&
        flag == other.flag &&
        code == other.code &&
        dialCode == other.dialCode;
  }

  @override
  int get hashCode => const ListEquality().hash([name, flag, code, dialCode]);
}

CountryStruct createCountryStruct({
  String? name,
  String? flag,
  String? code,
  String? dialCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CountryStruct(
      name: name,
      flag: flag,
      code: code,
      dialCode: dialCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CountryStruct? updateCountryStruct(
  CountryStruct? country, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    country
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCountryStructData(
  Map<String, dynamic> firestoreData,
  CountryStruct? country,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (country == null) {
    return;
  }
  if (country.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && country.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final countryData = getCountryFirestoreData(country, forFieldValue);
  final nestedData = countryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = country.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCountryFirestoreData(
  CountryStruct? country, [
  bool forFieldValue = false,
]) {
  if (country == null) {
    return {};
  }
  final firestoreData = mapToFirestore(country.toMap());

  // Add any Firestore field values
  country.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCountryListFirestoreData(
  List<CountryStruct>? countrys,
) =>
    countrys?.map((e) => getCountryFirestoreData(e, true)).toList() ?? [];
