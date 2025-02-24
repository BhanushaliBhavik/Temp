// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ApiDataStruct extends FFFirebaseStruct {
  ApiDataStruct({
    List<TodosStruct>? todos,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _todos = todos,
        super(firestoreUtilData);

  // "todos" field.
  List<TodosStruct>? _todos;
  List<TodosStruct> get todos => _todos ?? const [];
  set todos(List<TodosStruct>? val) => _todos = val;

  void updateTodos(Function(List<TodosStruct>) updateFn) {
    updateFn(_todos ??= []);
  }

  bool hasTodos() => _todos != null;

  static ApiDataStruct fromMap(Map<String, dynamic> data) => ApiDataStruct(
        todos: getStructList(
          data['todos'],
          TodosStruct.fromMap,
        ),
      );

  static ApiDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? ApiDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'todos': _todos?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'todos': serializeParam(
          _todos,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ApiDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ApiDataStruct(
        todos: deserializeStructParam<TodosStruct>(
          data['todos'],
          ParamType.DataStruct,
          true,
          structBuilder: TodosStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ApiDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ApiDataStruct && listEquality.equals(todos, other.todos);
  }

  @override
  int get hashCode => const ListEquality().hash([todos]);
}

ApiDataStruct createApiDataStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ApiDataStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ApiDataStruct? updateApiDataStruct(
  ApiDataStruct? apiData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    apiData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addApiDataStructData(
  Map<String, dynamic> firestoreData,
  ApiDataStruct? apiData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (apiData == null) {
    return;
  }
  if (apiData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && apiData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final apiDataData = getApiDataFirestoreData(apiData, forFieldValue);
  final nestedData = apiDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = apiData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getApiDataFirestoreData(
  ApiDataStruct? apiData, [
  bool forFieldValue = false,
]) {
  if (apiData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(apiData.toMap());

  // Add any Firestore field values
  apiData.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getApiDataListFirestoreData(
  List<ApiDataStruct>? apiDatas,
) =>
    apiDatas?.map((e) => getApiDataFirestoreData(e, true)).toList() ?? [];
