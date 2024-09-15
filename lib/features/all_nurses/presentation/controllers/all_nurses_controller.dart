import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AllNursesController extends GetxController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  // Define a list to store the nurses' data
  final nursesList = <Map<String, dynamic>>[].obs;

  // Fetch nurses from Firestore
  Future<void> fetchNurses() async {
    try {
      // Get the snapshot of the Nurses collection
      QuerySnapshot snapshot = await fireStore.collection('Nurses').get();
      // Map the documents to a list of maps, including the document ID
      nursesList.value = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Add the document ID to the map
        return data;
      }).toList();
    } catch (e) {
      print('Failed to fetch nurses: $e');
    }
  }

  // Delete a nurse based on their id
  Future<void> deleteNurse(String nurseId) async {
    try {
      // Reference the document by nurseId and delete it
      await fireStore.collection('Nurses').doc(nurseId).delete();
      // Optionally, remove the nurse from the nursesList locally
      nursesList.removeWhere((nurse) => nurse['id'] == nurseId);
      print('Nurse deleted successfully');
    } catch (e) {
      print('Failed to delete nurse: $e');
    }
  }
}
