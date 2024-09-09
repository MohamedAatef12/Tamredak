import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AllNursesController extends GetxController{
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  // Define a list to store the nurses data
  final nursesList = <Map<String, dynamic>>[].obs;

  // Fetch nurses from Firestore
  Future<void> fetchNurses() async {
    try {
      // Get the snapshot of the Nurses collection
      QuerySnapshot snapshot = await fireStore.collection('Nurses').get();
      // Map the documents to a list of maps
      nursesList.value = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Failed to fetch nurses: $e');
    }
  }
}