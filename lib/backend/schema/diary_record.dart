import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiaryRecord extends FirestoreRecord {
  DiaryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "diary_data" field.
  String? _diaryData;
  String get diaryData => _diaryData ?? '';
  bool hasDiaryData() => _diaryData != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "month" field.
  String? _month;
  String get month => _month ?? '';
  bool hasMonth() => _month != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _diaryData = snapshotData['diary_data'] as String?;
    _uid = snapshotData['uid'] as String?;
    _month = snapshotData['month'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('diary');

  static Stream<DiaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiaryRecord.fromSnapshot(s));

  static Future<DiaryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiaryRecord.fromSnapshot(s));

  static DiaryRecord fromSnapshot(DocumentSnapshot snapshot) => DiaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiaryRecordData({
  String? title,
  DateTime? date,
  String? diaryData,
  String? uid,
  String? month,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'date': date,
      'diary_data': diaryData,
      'uid': uid,
      'month': month,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiaryRecordDocumentEquality implements Equality<DiaryRecord> {
  const DiaryRecordDocumentEquality();

  @override
  bool equals(DiaryRecord? e1, DiaryRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.date == e2?.date &&
        e1?.diaryData == e2?.diaryData &&
        e1?.uid == e2?.uid &&
        e1?.month == e2?.month;
  }

  @override
  int hash(DiaryRecord? e) => const ListEquality()
      .hash([e?.title, e?.date, e?.diaryData, e?.uid, e?.month]);

  @override
  bool isValidKey(Object? o) => o is DiaryRecord;
}
