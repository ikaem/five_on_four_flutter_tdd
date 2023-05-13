import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreWrapper {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  FirebaseFirestore get db => _db;

  // TODO this might be enough temporarily - let data soruces handle the rest
}
