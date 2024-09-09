import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class InTaskController extends GetxController{
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  // Define a list to store the available nurses data
  final unAvailableNursesList = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  // Fetch available nurses from Firestore
  Future<void> fetchUnAvailableNurses() async {
    try {
      // Query the Nurses collection where 'availability' is true
      isLoading.value = true;
      QuerySnapshot snapshot = await fireStore
          .collection('Nurses')
          .where('availability', isEqualTo: false)
          .get();

      // Map the documents to a list of maps, including the document ID
      unAvailableNursesList.value = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Add the document ID to the data map
        return data;
      }).toList();

      // Debug print to verify the data
      print('Fetched available nurses: ${unAvailableNursesList.length}');
    } catch (e) {
      print('Failed to fetch available nurses: $e');
    }
    finally {
      // Set loading to false when fetching is complete
      isLoading.value = false;
    }
  }

  // Function to set the availability of a nurse to false
  Future<void> setNurseAvailable(String nurseId) async {
    try {
      await fireStore.collection('Nurses').doc(nurseId).update({
        'availability': true,
      });
      unAvailableNursesList.removeWhere((nurse) => nurse['id'] == nurseId);
      print('Nurse availability set to false for ID: $nurseId');
    } catch (e) {
      print('Failed to set nurse availability: $e');
    }
  }
}