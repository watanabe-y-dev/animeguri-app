abstract interface class FirestoreService {
  Future<Map<String, dynamic>> getDocument({
    required String collection,
    required String id,
  });
  Future<List<Map<String, dynamic>>> getDocuments({
    required String collection,
  });
}
