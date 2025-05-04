import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/foundation/collection.dart';
import 'package:data/service/firestore_service.dart';

class FirestoreServiceImpl implements FirestoreService {
  FirestoreServiceImpl({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore firestore;

  @override
  Future<Map<String, dynamic>> getDocument({
    required Collection collection,
    required String id,
  }) async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection(collection.name).get();
      return snapshot.docs.firstWhere((doc) => doc.id == id).data();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getDocuments({
    required Collection collection,
  }) async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection(collection.name).get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
