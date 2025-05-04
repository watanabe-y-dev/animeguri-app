import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/service/firestore_service.dart';

class FirestoreServiceImpl implements FirestoreService {
  FirestoreServiceImpl({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore firestore;

  @override
  Future<Map<String, dynamic>> getDocument({
    required String collection,
    required String id,
  }) async {
    final snapshot =
        await FirebaseFirestore.instance.collection(collection).get();
    return snapshot.docs.firstWhere((doc) => doc.id == id).data();
  }

  @override
  Future<List<Map<String, dynamic>>> getDocuments({
    required String collection,
  }) async {
    final snapshot =
        await FirebaseFirestore.instance.collection(collection).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
