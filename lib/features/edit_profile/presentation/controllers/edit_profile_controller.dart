import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  // Text Editing Controllers for form fields
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController workTime = TextEditingController();
  final TextEditingController workArea = TextEditingController();
  final TextEditingController nurseAge = TextEditingController();
  final TextEditingController nurseGender = TextEditingController();

  // Function to load nurse data from Firestore
  Future<void> loadNurseData(String nurseId) async {
    try {
      // Fetch the nurse's current data from Firestore
      DocumentSnapshot nurseSnapshot =
      await fireStore.collection('Nurses').doc(nurseId).get();

      // Check if the document exists and cast the data safely
      if (nurseSnapshot.exists) {
        Map<String, dynamic> nurseData =
        nurseSnapshot.data() as Map<String, dynamic>;

        // Set the current data to the text controllers
        firstName.text = nurseData['first name'] ?? '';
        lastName.text = nurseData['last name'] ?? '';
        phoneNumber.text = nurseData['phone number'] ?? '';
        workArea.text = nurseData['area'] ?? '';
        workTime.text = nurseData['time'] ?? '';
        nurseAge.text = nurseData['age'] ?? '';
        nurseGender.text = nurseData['gender'] ?? '';
      } else {
        Get.snackbar('Error', 'Nurse data not found',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      }
    } catch (e) {
      // Error handling
      print('Failed to load nurse data: $e');
      Get.snackbar('Error', 'Failed to load profile data',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  // Function to update nurse profile data in Firestore
  Future<void> editProfileData(String nurseId) async {
    // Collect data from text controllers
    String fName = firstName.text.trim();
    String lName = lastName.text.trim();
    String phone = phoneNumber.text.trim();
    String area = workArea.text.trim();
    String time = workTime.text.trim();
    String age = nurseAge.text.trim();
    String gender = nurseGender.text.trim();

    // Check for empty fields if needed
    if (fName.isEmpty || lName.isEmpty || phone.isEmpty) {
      Get.snackbar('Error', 'Please fill all required fields',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      return;
    }

    try {
      // Update the nurse document in Firestore with the new data
      await fireStore.collection('Nurses').doc(nurseId).update({
        'first name': fName,
        'last name': lName,
        'phone number': phone,
        'area': area,
        'time': time,
        'age': age,
        'gender': gender,
        // Add 'image': imageUrl if handling image separately
      });

      // Optionally show a success message
      Get.snackbar('Success', 'Profile updated successfully',);
    } catch (e) {
      // Handle errors and display a message
      print('Failed to update profile: $e');
      Get.snackbar('Error', 'Failed to update profile',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  // Dispose of controllers when not in use to avoid memory leaks
  // @override
  // void onClose() {
  //   firstName.dispose();
  //   lastName.dispose();
  //   phoneNumber.dispose();
  //   workTime.dispose();
  //   workArea.dispose();
  //   nurseAge.dispose();
  //   nurseGender.dispose();
  //   super.onClose();
  // }
}
