import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class InTaskController extends GetxController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  final unAvailableNursesList = <Map<String, dynamic>>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUnAvailableNurses();
  }

  Future<void> fetchUnAvailableNurses() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await fireStore
          .collection('Nurses')
          .where('status', isEqualTo: 'unavailable')
          .get();
      unAvailableNursesList.value = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();
    } catch (e) {
      print('Failed to fetch nurses: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void searchNurses(String query) {
    if (query.isEmpty) {
      fetchUnAvailableNurses();
      return;
    }

    final searchQuery = query.toLowerCase();
    print('Search query: $searchQuery'); // Debugging line

    final filteredList = unAvailableNursesList.where((nurse) {
      final name = '${nurse['first name']} ${nurse['last name']}'.toLowerCase();
      final phone = nurse['phone number'].toLowerCase();
      final area = nurse['area'].toLowerCase();

      return name.contains(searchQuery) ||
          phone.contains(searchQuery) ||
          area.contains(searchQuery);
    }).toList();

    print('Filtered list: $filteredList'); // Debugging line

    unAvailableNursesList.value = filteredList;
  }

  Future<void> setNurseAvailable(String nurseId) async {
    try {
      await fireStore
          .collection('Nurses')
          .doc(nurseId)
          .update({'status': 'available'});
      fetchUnAvailableNurses();
    } catch (e) {
      print('Failed to update nurse status: $e');
    }
  }
}
