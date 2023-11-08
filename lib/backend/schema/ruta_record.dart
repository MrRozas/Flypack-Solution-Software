import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RutaRecord extends FirestoreRecord {
  RutaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "Estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "Fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "Direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['ID']);
    _estado = snapshotData['Estado'] as String?;
    _fecha = snapshotData['Fecha'] as DateTime?;
    _direccion = snapshotData['Direccion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('RUTA');

  static Stream<RutaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RutaRecord.fromSnapshot(s));

  static Future<RutaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RutaRecord.fromSnapshot(s));

  static RutaRecord fromSnapshot(DocumentSnapshot snapshot) => RutaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RutaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RutaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RutaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RutaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRutaRecordData({
  int? id,
  String? estado,
  DateTime? fecha,
  String? direccion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID': id,
      'Estado': estado,
      'Fecha': fecha,
      'Direccion': direccion,
    }.withoutNulls,
  );

  return firestoreData;
}

class RutaRecordDocumentEquality implements Equality<RutaRecord> {
  const RutaRecordDocumentEquality();

  @override
  bool equals(RutaRecord? e1, RutaRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.estado == e2?.estado &&
        e1?.fecha == e2?.fecha &&
        e1?.direccion == e2?.direccion;
  }

  @override
  int hash(RutaRecord? e) =>
      const ListEquality().hash([e?.id, e?.estado, e?.fecha, e?.direccion]);

  @override
  bool isValidKey(Object? o) => o is RutaRecord;
}
