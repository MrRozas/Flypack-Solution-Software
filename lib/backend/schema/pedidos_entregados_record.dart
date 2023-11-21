import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosEntregadosRecord extends FirestoreRecord {
  PedidosEntregadosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "Estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  // "Fecha" field.
  String? _fecha;
  String get fecha => _fecha ?? '';
  bool hasFecha() => _fecha != null;

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _direccion = snapshotData['Direccion'] as String?;
    _estado = snapshotData['Estado'] as bool?;
    _fecha = snapshotData['Fecha'] as String?;
    _id = castToType<int>(snapshotData['ID']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PedidosEntregados');

  static Stream<PedidosEntregadosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidosEntregadosRecord.fromSnapshot(s));

  static Future<PedidosEntregadosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PedidosEntregadosRecord.fromSnapshot(s));

  static PedidosEntregadosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PedidosEntregadosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidosEntregadosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidosEntregadosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidosEntregadosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidosEntregadosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidosEntregadosRecordData({
  String? direccion,
  bool? estado,
  String? fecha,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Direccion': direccion,
      'Estado': estado,
      'Fecha': fecha,
      'ID': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidosEntregadosRecordDocumentEquality
    implements Equality<PedidosEntregadosRecord> {
  const PedidosEntregadosRecordDocumentEquality();

  @override
  bool equals(PedidosEntregadosRecord? e1, PedidosEntregadosRecord? e2) {
    return e1?.direccion == e2?.direccion &&
        e1?.estado == e2?.estado &&
        e1?.fecha == e2?.fecha &&
        e1?.id == e2?.id;
  }

  @override
  int hash(PedidosEntregadosRecord? e) =>
      const ListEquality().hash([e?.direccion, e?.estado, e?.fecha, e?.id]);

  @override
  bool isValidKey(Object? o) => o is PedidosEntregadosRecord;
}
