

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// Define the GetX controller
class AddNewNurseController extends GetxController {
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
    String fName= firstName.text;
    String lName=lastName.text;
    String phone=phoneNumber.text;
    String area=workArea.text;
    String time=workTime.text;
    String age=nurseAge.text;
    String gender=nurseGender.text;
    bool available = true;
    Image? image;
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
        'availability':available,
        'image':image,
      });

      print('Nurse added successfully');
    } catch (e) {
      print('Failed to add nurse: $e');
    }
  }
}
