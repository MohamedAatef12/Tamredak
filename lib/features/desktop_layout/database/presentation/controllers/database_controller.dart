import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final tasksList = <Map<String, dynamic>>[].obs;
  final filteredTasks = <Map<String, dynamic>>[].obs;
  final isLoading = true.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs; // Default date value

  @override
  void onInit() {
    super.onInit();
    fetchAllTasks(); // Fetch all tasks initially
  }

  Future<void> fetchAllTasks() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await fireStore.collection('Tasks').get();
      tasksList.value = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();

      // Sort tasks by date from newest to oldest
      tasksList.sort((a, b) {
        DateTime dateA = DateTime.parse(a['date']);
        DateTime dateB = DateTime.parse(b['date']);
        return dateB.compareTo(dateA); // Newest to oldest
      });

      filterTasksByDate(null); // Show all tasks initially
    } catch (e) {
      print('Failed to fetch tasks: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    filterTasksByDate(date);
  }

  void resetDate() {
    filterTasksByDate(null); // Show all tasks
  }

  void filterTasksByDate(DateTime? date) {
    if (date == null) {
      filteredTasks.value =
          tasksList.toList(); // Show all tasks if no date is provided
    } else {
      filteredTasks.value = tasksList.where((task) {
        final taskDate = DateTime.parse(task['date']);
        return taskDate.year == date.year &&
            taskDate.month == date.month &&
            taskDate.day == date.day;
      }).toList();
    }

    // Sort filtered tasks by date from newest to oldest
    filteredTasks.sort((a, b) {
      DateTime dateA = DateTime.parse(a['date']);
      DateTime dateB = DateTime.parse(b['date']);
      return dateB.compareTo(dateA); // Newest to oldest
    });
  }

  void searchTasks(String query) {
    if (query.isEmpty) {
      filteredTasks.value = tasksList.toList();
      filteredTasks.sort((a, b) {
        DateTime dateA = DateTime.parse(a['date']);
        DateTime dateB = DateTime.parse(b['date']);
        return dateB.compareTo(dateA); // Newest to oldest
      });
    } else {
      filteredTasks.value = tasksList.where((task) {
        return task['name'].toLowerCase().contains(query.toLowerCase()) ||
            task['area'].toLowerCase().contains(query.toLowerCase()) ||
            task['injury'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
}
