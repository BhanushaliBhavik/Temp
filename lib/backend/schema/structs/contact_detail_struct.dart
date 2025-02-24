// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ContactDetailStruct extends FFFirebaseStruct {
  ContactDetailStruct({
    String? name,
    String? phoneNumber,
    String? email,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _phoneNumber = phoneNumber,
        _email = email,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  static ContactDetailStruct fromMap(Map<String, dynamic> data) =>
      ContactDetailStruct(
        name: data['name'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        email: data['email'] as String?,
      );

  static ContactDetailStruct? maybeFromMap(dynamic data) => data is Map
      ? ContactDetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'phoneNumber': _phoneNumber,
        'email': _email,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContactDetailStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContactDetailStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContactDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContactDetailStruct &&
        name == other.name &&
        phoneNumber == other.phoneNumber &&
        email == other.email;
  }

  @override
  int get hashCode => const ListEquality().hash([name, phoneNumber, email]);
}

ContactDetailStruct createContactDetailStruct({
  String? name,
  String? phoneNumber,
  String? email,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContactDetailStruct(
      name: name,
      phoneNumber: phoneNumber,
      email: email,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContactDetailStruct? updateContactDetailStruct(
  ContactDetailStruct? contactDetail, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contactDetail
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContactDetailStructData(
  Map<String, dynamic> firestoreData,
  ContactDetailStruct? contactDetail,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contactDetail == null) {
    return;
  }
  if (contactDetail.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contactDetail.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contactDetailData =
      getContactDetailFirestoreData(contactDetail, forFieldValue);
  final nestedData =
      contactDetailData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contactDetail.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContactDetailFirestoreData(
  ContactDetailStruct? contactDetail, [
  bool forFieldValue = false,
]) {
  if (contactDetail == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contactDetail.toMap());

  // Add any Firestore field values
  contactDetail.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContactDetailListFirestoreData(
  List<ContactDetailStruct>? contactDetails,
) =>
    contactDetails
        ?.map((e) => getContactDetailFirestoreData(e, true))
        .toList() ??
    [];
