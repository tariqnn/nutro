import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PlantypeRecord extends FirestoreRecord {
  PlantypeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "plan" field.
  String? _plan;
  String get plan => _plan ?? '';
  bool hasPlan() => _plan != null;

  void _initializeFields() {
    _plan = snapshotData['plan'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plantype');

  static Stream<PlantypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlantypeRecord.fromSnapshot(s));

  static Future<PlantypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlantypeRecord.fromSnapshot(s));

  static PlantypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlantypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlantypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlantypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlantypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlantypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlantypeRecordData({
  String? plan,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'plan': plan,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlantypeRecordDocumentEquality implements Equality<PlantypeRecord> {
  const PlantypeRecordDocumentEquality();

  @override
  bool equals(PlantypeRecord? e1, PlantypeRecord? e2) {
    return e1?.plan == e2?.plan;
  }

  @override
  int hash(PlantypeRecord? e) => const ListEquality().hash([e?.plan]);

  @override
  bool isValidKey(Object? o) => o is PlantypeRecord;
}
