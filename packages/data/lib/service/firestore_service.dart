import 'package:data/foundation/collection.dart';

abstract interface class FirestoreService {
  Future<Map<String, dynamic>> getDocument({
    required Collection collection,
    required String id,
  });
  Future<List<Map<String, dynamic>>> getDocuments({
    required Collection collection,
  });
}
