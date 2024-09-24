import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AllNursesController extends GetxController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  final nursesList = <Map<String, dynamic>>[].obs;
  final searchQuery = ''.obs; // To keep track of the current search query

  @override
  void onInit() {
    super.onInit();
    fetchNurses();
  }

  Future<void> fetchNurses() async {
    try {
      QuerySnapshot snapshot = await fireStore.collection('Nurses').get();
      nursesList.value = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();
      filterNurses(searchQuery.value); // Initial filter (if needed)
    } catch (e) {
      print('Failed to fetch nurses: $e');
    }
  }

  Future<void> deleteNurse(String nurseId) async {
    try {
      await fireStore.collection('Nurses').doc(nurseId).delete();
      nursesList.removeWhere((nurse) => nurse['id'] == nurseId);
      print('Nurse deleted successfully');
    } catch (e) {
      print('Failed to delete nurse: $e');
    }
  }

  Future<void> updateNurse(
      String nurseId, Map<String, dynamic> updatedData) async {
    try {
      await fireStore.collection('Nurses').doc(nurseId).update(updatedData);
      int index = nursesList.indexWhere((nurse) => nurse['id'] == nurseId);
      if (index != -1) {
        nursesList[index] = updatedData;
      }
      Get.back();
    } catch (e) {
      print('Failed to update nurse: $e');
    }
  }

  void searchNurses(String query) {
    searchQuery.value = query;
    filterNurses(query);
  }

  void filterNurses(String query) {
    if (query.isEmpty) {
      // If the query is empty, show all nurses
      fetchNurses();
    } else {
      // Filter nurses based on the query
      final filtered = nursesList.where((nurse) {
        final name =
            (nurse['first name'] ?? '') + ' ' + (nurse['last name'] ?? '');
        final phone = nurse['phone number'] ?? '';
        final lowerCaseQuery = query.toLowerCase();
        return name.toLowerCase().contains(lowerCaseQuery) ||
            phone.toLowerCase().contains(lowerCaseQuery);
      }).toList();
      nursesList.value = filtered;
    }
  }
}
