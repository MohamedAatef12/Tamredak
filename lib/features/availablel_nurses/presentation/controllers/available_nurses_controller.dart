import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableNursesController extends GetxController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController injuryController = TextEditingController();

  // List of All Tasks
  List<Map<String, dynamic>> allTasksList = <Map<String, dynamic>>[].obs;

  final availableNursesList = <Map<String, dynamic>>[].obs;

  // Fetch available nurses from Firestore
  final isLoading = false.obs;
  Future<void> fetchAvailableNurses() async {
    try {
      // Query the Nurses collection where 'availability' is true
      isLoading.value = true;
      QuerySnapshot snapshot = await fireStore
          .collection('Nurses')
          .where('availability', isEqualTo: true)
          .get();

      // Map the documents to a list of maps, including the document ID
      availableNursesList.value = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Add the document ID to the data map
        return data;
      }).toList();

      // Debug print to verify the data
      print('Fetched available nurses: ${availableNursesList.length}');
    } catch (e) {
      print('Failed to fetch available nurses: $e');
    } finally {
      // Set loading to false when fetching is complete
      isLoading.value = false;
    }
  }

  // Function to set the availability of a nurse to false
  Future<void> setNurseUnavailable(String nurseId) async {
    try {
      await fireStore.collection('Nurses').doc(nurseId).update({
        'availability': false,
      });
      availableNursesList.removeWhere((nurse) => nurse['id'] == nurseId);
      print('Nurse availability set to false for ID: $nurseId');
    } catch (e) {
      print('Failed to set nurse availability: $e');
    }
  }

  Future<void> sendNurseAvailable(String nurseId) async {
    try {
      // Task data to be added to both collections
      Map<String, dynamic> taskData = {
        'name': nameController.text,
        'phone': phoneController.text,
        'age': ageController.text,
        'area': areaController.text,
        'gender': genderController.text,
        'injury': injuryController.text,
        'date': DateTime.now().toString(),
        'nurseId':
            nurseId, // Store nurseId to track which nurse the task belongs to
      };

      // Add task to the specific nurse's Tasks collection
      await fireStore
          .collection('Nurses')
          .doc(nurseId)
          .collection('Tasks')
          .doc(nameController.text)
          .set(taskData);

      // Add task to the general Tasks collection
      await fireStore
          .collection('Tasks') // General Tasks collection
          .add(taskData);

      print('Task added to $nurseId and general Tasks collection');
    } catch (e) {
      print('Failed to set nurse availability: $e');
    }
  }
}
