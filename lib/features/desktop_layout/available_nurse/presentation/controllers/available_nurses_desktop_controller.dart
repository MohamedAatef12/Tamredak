import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableNursesDesktopController extends GetxController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController injuryController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  // List of All Nurses
  final availableNursesList = <Map<String, dynamic>>[].obs;
  final filteredNursesList = <Map<String, dynamic>>[].obs;

  final isLoading = false.obs;

  // Fetch available nurses from Firestore
  Future<void> fetchAvailableNurses() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await fireStore
          .collection('Nurses')
          .where('status', isEqualTo: 'available')
          .get();

      availableNursesList.value = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();

      filteredNursesList.value = availableNursesList;
    } catch (e) {
      print('Failed to fetch available nurses: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Function to set the availability of a nurse to false
  Future<void> setNurseUnavailable(String nurseId) async {
    try {
      await fireStore.collection('Nurses').doc(nurseId).update({
        'status': 'unavailable',
      });
      availableNursesList.removeWhere((nurse) => nurse['id'] == nurseId);
      filteredNursesList.removeWhere((nurse) => nurse['id'] == nurseId);
      print('Nurse availability set to false for ID: $nurseId');
    } catch (e) {
      print('Failed to set nurse availability: $e');
    }
  }

  // Function to send nurse availability
  Future<void> sendNurseAvailable(String nurseId) async {
    try {
      Map<String, dynamic> taskData = {
        'name': nameController.text,
        'phone': phoneController.text,
        'age': ageController.text,
        'area': areaController.text,
        'gender': genderController.text,
        'injury': injuryController.text,
        'date': DateTime.now().toString(),
        'nurseId': nurseId,
      };

      await fireStore
          .collection('Nurses')
          .doc(nurseId)
          .collection('Tasks')
          .doc(nameController.text)
          .set(taskData);

      await fireStore
          .collection('Tasks')
          .doc(nameController.text)
          .set(taskData);

      print('Task added to $nurseId and general Tasks collection');
    } catch (e) {
      print('Failed to set nurse availability: $e');
    }
  }

  // Search function
  void searchNurses(String query) {
    if (query.isEmpty) {
      filteredNursesList.value = availableNursesList;
    } else {
      filteredNursesList.value = availableNursesList
          .where((nurse) =>
              (nurse['first name']
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
                  false) ||
              (nurse['last name']
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
                  false) ||
              (nurse['area']?.toLowerCase().contains(query.toLowerCase()) ??
                  false) ||
              (nurse['phone number']
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
                  false))
          .toList();
    }
  }
}
