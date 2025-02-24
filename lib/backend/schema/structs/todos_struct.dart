// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TodosStruct extends FFFirebaseStruct {
  TodosStruct({
    int? id,
    String? todo,
    bool? completed,
    int? userId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _todo = todo,
        _completed = completed,
        _userId = userId,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "todo" field.
  String? _todo;
  String get todo => _todo ?? '';
  set todo(String? val) => _todo = val;

  bool hasTodo() => _todo != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  set completed(bool? val) => _completed = val;

  bool hasCompleted() => _completed != null;

  // "userId" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  static TodosStruct fromMap(Map<String, dynamic> data) => TodosStruct(
        id: castToType<int>(data['id']),
        todo: data['todo'] as String?,
        completed: data['completed'] as bool?,
        userId: castToType<int>(data['userId']),
      );

  static TodosStruct? maybeFromMap(dynamic data) =>
      data is Map ? TodosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'todo': _todo,
        'completed': _completed,
        'userId': _userId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'todo': serializeParam(
          _todo,
          ParamType.String,
        ),
        'completed': serializeParam(
          _completed,
          ParamType.bool,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.int,
        ),
      }.withoutNulls;

  static TodosStruct fromSerializableMap(Map<String, dynamic> data) =>
      TodosStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        todo: deserializeParam(
          data['todo'],
          ParamType.String,
          false,
        ),
        completed: deserializeParam(
          data['completed'],
          ParamType.bool,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TodosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TodosStruct &&
        id == other.id &&
        todo == other.todo &&
        completed == other.completed &&
        userId == other.userId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, todo, completed, userId]);
}

TodosStruct createTodosStruct({
  int? id,
  String? todo,
  bool? completed,
  int? userId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TodosStruct(
      id: id,
      todo: todo,
      completed: completed,
      userId: userId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TodosStruct? updateTodosStruct(
  TodosStruct? todos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    todos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTodosStructData(
  Map<String, dynamic> firestoreData,
  TodosStruct? todos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (todos == null) {
    return;
  }
  if (todos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && todos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final todosData = getTodosFirestoreData(todos, forFieldValue);
  final nestedData = todosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = todos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTodosFirestoreData(
  TodosStruct? todos, [
  bool forFieldValue = false,
]) {
  if (todos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(todos.toMap());

  // Add any Firestore field values
  todos.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTodosListFirestoreData(
  List<TodosStruct>? todoss,
) =>
    todoss?.map((e) => getTodosFirestoreData(e, true)).toList() ?? [];
