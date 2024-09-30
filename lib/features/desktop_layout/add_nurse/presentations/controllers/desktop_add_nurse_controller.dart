

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// Define the GetX controller
class DesktopAddNurseController extends GetxController {
  // Reference to the Firestore instance
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController workTime = TextEditingController();
  TextEditingController workArea = TextEditingController();
  TextEditingController nurseAge = TextEditingController();
  TextEditingController nurseGender = TextEditingController();
  Future<void> addNurse() async {
    // Get values from text controllers and trim any extra spaces
    String fName = firstName.text.trim();
    String lName = lastName.text.trim();
    String phone = phoneNumber.text.trim();
    String area = workArea.text.trim();
    String time = workTime.text.trim();
    String age = nurseAge.text.trim();
    String gender = nurseGender.text.trim();
    String status = 'available';
    Image? image;

    // Check if any field is empty after trimming
    if (fName.isEmpty || lName.isEmpty || phone.isEmpty || area.isEmpty || time.isEmpty || age.isEmpty || gender.isEmpty) {
      // Show snackbar and return early if any field is empty
      Get.snackbar(
        'Error',
        'Please fill in all fields before submitting.',
      );
      return; // Stop further execution if validation fails
    }

    try {
      // Reference to the "Nurses" collection
      CollectionReference nurses = FirebaseFirestore.instance.collection('Nurses');

      // Add a new document with the specified fields
      await nurses.add({
        'first name': fName,
        'last name': lName,
        'phone number': phone,
        'area': area,
        'time': time,
        'age': age,
        'gender': gender,
        'status': status,
        'image': image, // If you want to handle image uploading later, you can pass null for now
      });

      // Show success snackbar
      Get.snackbar(
        'Success',
        'Nurse added successfully.',

      );
    } catch (e) {
      // Show error snackbar if Firebase operation fails
      Get.snackbar(
        'Error',
        'Failed to add nurse: $e',

      );
    }
  }

}
