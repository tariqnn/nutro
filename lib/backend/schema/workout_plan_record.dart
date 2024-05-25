import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutPlanRecord extends FirestoreRecord {
  WorkoutPlanRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ex_name" field.
  String? _exName;
  String get exName => _exName ?? '';
  bool hasExName() => _exName != null;

  // "ex_type" field.
  String? _exType;
  String get exType => _exType ?? '';
  bool hasExType() => _exType != null;

  // "ex_duration" field.
  double? _exDuration;
  double get exDuration => _exDuration ?? 0.0;
  bool hasExDuration() => _exDuration != null;

  // "ex_intensity" field.
  String? _exIntensity;
  String get exIntensity => _exIntensity ?? '';
  bool hasExIntensity() => _exIntensity != null;

  // "plan_type" field.
  String? _planType;
  String get planType => _planType ?? '';
  bool hasPlanType() => _planType != null;

  void _initializeFields() {
    _exName = snapshotData['ex_name'] as String?;
    _exType = snapshotData['ex_type'] as String?;
    _exDuration = castToType<double>(snapshotData['ex_duration']);
    _exIntensity = snapshotData['ex_intensity'] as String?;
    _planType = snapshotData['plan_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workout_plan');

  static Stream<WorkoutPlanRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkoutPlanRecord.fromSnapshot(s));

  static Future<WorkoutPlanRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkoutPlanRecord.fromSnapshot(s));

  static WorkoutPlanRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkoutPlanRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkoutPlanRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkoutPlanRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkoutPlanRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkoutPlanRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkoutPlanRecordData({
  String? exName,
  String? exType,
  double? exDuration,
  String? exIntensity,
  String? planType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ex_name': exName,
      'ex_type': exType,
      'ex_duration': exDuration,
      'ex_intensity': exIntensity,
      'plan_type': planType,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkoutPlanRecordDocumentEquality implements Equality<WorkoutPlanRecord> {
  const WorkoutPlanRecordDocumentEquality();

  @override
  bool equals(WorkoutPlanRecord? e1, WorkoutPlanRecord? e2) {
    return e1?.exName == e2?.exName &&
        e1?.exType == e2?.exType &&
        e1?.exDuration == e2?.exDuration &&
        e1?.exIntensity == e2?.exIntensity &&
        e1?.planType == e2?.planType;
  }

  @override
  int hash(WorkoutPlanRecord? e) => const ListEquality()
      .hash([e?.exName, e?.exType, e?.exDuration, e?.exIntensity, e?.planType]);

  @override
  bool isValidKey(Object? o) => o is WorkoutPlanRecord;
}
