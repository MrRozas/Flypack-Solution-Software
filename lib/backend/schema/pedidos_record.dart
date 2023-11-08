import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosRecord extends FirestoreRecord {
  PedidosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_Ruta" field.
  int? _iDRuta;
  int get iDRuta => _iDRuta ?? 0;
  bool hasIDRuta() => _iDRuta != null;

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "Direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "Estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "Fecha_entrega" field.
  DateTime? _fechaEntrega;
  DateTime? get fechaEntrega => _fechaEntrega;
  bool hasFechaEntrega() => _fechaEntrega != null;

  // "NombrePropietario" field.
  String? _nombrePropietario;
  String get nombrePropietario => _nombrePropietario ?? '';
  bool hasNombrePropietario() => _nombrePropietario != null;

  // "ApellidoPropietario" field.
  String? _apellidoPropietario;
  String get apellidoPropietario => _apellidoPropietario ?? '';
  bool hasApellidoPropietario() => _apellidoPropietario != null;

  // "RutPropietario" field.
  String? _rutPropietario;
  String get rutPropietario => _rutPropietario ?? '';
  bool hasRutPropietario() => _rutPropietario != null;

  // "EntraInfo" field.
  String? _entraInfo;
  String get entraInfo => _entraInfo ?? '';
  bool hasEntraInfo() => _entraInfo != null;

  // "Foto_Pedido" field.
  String? _fotoPedido;
  String get fotoPedido => _fotoPedido ?? '';
  bool hasFotoPedido() => _fotoPedido != null;

  void _initializeFields() {
    _iDRuta = castToType<int>(snapshotData['ID_Ruta']);
    _id = castToType<int>(snapshotData['ID']);
    _direccion = snapshotData['Direccion'] as String?;
    _estado = snapshotData['Estado'] as String?;
    _fechaEntrega = snapshotData['Fecha_entrega'] as DateTime?;
    _nombrePropietario = snapshotData['NombrePropietario'] as String?;
    _apellidoPropietario = snapshotData['ApellidoPropietario'] as String?;
    _rutPropietario = snapshotData['RutPropietario'] as String?;
    _entraInfo = snapshotData['EntraInfo'] as String?;
    _fotoPedido = snapshotData['Foto_Pedido'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Pedidos');

  static Stream<PedidosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidosRecord.fromSnapshot(s));

  static Future<PedidosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidosRecord.fromSnapshot(s));

  static PedidosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PedidosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidosRecordData({
  int? iDRuta,
  int? id,
  String? direccion,
  String? estado,
  DateTime? fechaEntrega,
  String? nombrePropietario,
  String? apellidoPropietario,
  String? rutPropietario,
  String? entraInfo,
  String? fotoPedido,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_Ruta': iDRuta,
      'ID': id,
      'Direccion': direccion,
      'Estado': estado,
      'Fecha_entrega': fechaEntrega,
      'NombrePropietario': nombrePropietario,
      'ApellidoPropietario': apellidoPropietario,
      'RutPropietario': rutPropietario,
      'EntraInfo': entraInfo,
      'Foto_Pedido': fotoPedido,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidosRecordDocumentEquality implements Equality<PedidosRecord> {
  const PedidosRecordDocumentEquality();

  @override
  bool equals(PedidosRecord? e1, PedidosRecord? e2) {
    return e1?.iDRuta == e2?.iDRuta &&
        e1?.id == e2?.id &&
        e1?.direccion == e2?.direccion &&
        e1?.estado == e2?.estado &&
        e1?.fechaEntrega == e2?.fechaEntrega &&
        e1?.nombrePropietario == e2?.nombrePropietario &&
        e1?.apellidoPropietario == e2?.apellidoPropietario &&
        e1?.rutPropietario == e2?.rutPropietario &&
        e1?.entraInfo == e2?.entraInfo &&
        e1?.fotoPedido == e2?.fotoPedido;
  }

  @override
  int hash(PedidosRecord? e) => const ListEquality().hash([
        e?.iDRuta,
        e?.id,
        e?.direccion,
        e?.estado,
        e?.fechaEntrega,
        e?.nombrePropietario,
        e?.apellidoPropietario,
        e?.rutPropietario,
        e?.entraInfo,
        e?.fotoPedido
      ]);

  @override
  bool isValidKey(Object? o) => o is PedidosRecord;
}
