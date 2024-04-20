// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SleepScoreStruct extends FFFirebaseStruct {
  SleepScoreStruct({
    double? noOfHrsSlept,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _noOfHrsSlept = noOfHrsSlept,
        super(firestoreUtilData);

  // "No_Of_hrs_slept" field.
  double? _noOfHrsSlept;
  double get noOfHrsSlept => _noOfHrsSlept ?? 0.0;
  set noOfHrsSlept(double? val) => _noOfHrsSlept = val;
  void incrementNoOfHrsSlept(double amount) =>
      _noOfHrsSlept = noOfHrsSlept + amount;
  bool hasNoOfHrsSlept() => _noOfHrsSlept != null;

  static SleepScoreStruct fromMap(Map<String, dynamic> data) =>
      SleepScoreStruct(
        noOfHrsSlept: castToType<double>(data['No_Of_hrs_slept']),
      );

  static SleepScoreStruct? maybeFromMap(dynamic data) => data is Map
      ? SleepScoreStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'No_Of_hrs_slept': _noOfHrsSlept,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'No_Of_hrs_slept': serializeParam(
          _noOfHrsSlept,
          ParamType.double,
        ),
      }.withoutNulls;

  static SleepScoreStruct fromSerializableMap(Map<String, dynamic> data) =>
      SleepScoreStruct(
        noOfHrsSlept: deserializeParam(
          data['No_Of_hrs_slept'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SleepScoreStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SleepScoreStruct && noOfHrsSlept == other.noOfHrsSlept;
  }

  @override
  int get hashCode => const ListEquality().hash([noOfHrsSlept]);
}

SleepScoreStruct createSleepScoreStruct({
  double? noOfHrsSlept,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SleepScoreStruct(
      noOfHrsSlept: noOfHrsSlept,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SleepScoreStruct? updateSleepScoreStruct(
  SleepScoreStruct? sleepScore, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sleepScore
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSleepScoreStructData(
  Map<String, dynamic> firestoreData,
  SleepScoreStruct? sleepScore,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sleepScore == null) {
    return;
  }
  if (sleepScore.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sleepScore.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sleepScoreData = getSleepScoreFirestoreData(sleepScore, forFieldValue);
  final nestedData = sleepScoreData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sleepScore.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSleepScoreFirestoreData(
  SleepScoreStruct? sleepScore, [
  bool forFieldValue = false,
]) {
  if (sleepScore == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sleepScore.toMap());

  // Add any Firestore field values
  sleepScore.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSleepScoreListFirestoreData(
  List<SleepScoreStruct>? sleepScores,
) =>
    sleepScores?.map((e) => getSleepScoreFirestoreData(e, true)).toList() ?? [];
