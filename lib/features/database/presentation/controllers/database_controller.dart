import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final tasksList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNurses(); // Fetch nurses when the controller is initialized
  }

  Future<void> fetchNurses() async {
    try {
      // Get the snapshot of the Nurses collection
      QuerySnapshot snapshot = await fireStore.collection('Tasks').get();
      // Map the documents to a list of maps, including the document ID
      tasksList.value = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Add the document ID to the map
        return data;
      }).toList();
    } catch (e) {
      print('Failed to fetch nurses: $e');
    }
  }
}
