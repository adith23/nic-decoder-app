import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

/// A screen that displays the decoded NIC details.
///
/// It shows NIC type, date of birth, age, gender, and weekday name.
class ResultScreen extends StatelessWidget {
  /// Finds the NIC controller to get decoded data.
  final NICController controller = Get.find<NICController>();

  /// Constructor for [ResultScreen].
  ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "NIC Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoCard("NIC Type", controller.nicType.value),
                    _infoCard("Date of Birth", controller.dob.value),
                    _infoCard("Age", controller.age.value),
                    _infoCard("Gender", controller.gender.value),
                    _infoCard("Week Day Name", controller.weekday.value),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Center(
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                  child: const Text(
                    "Go Back",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Creates a card widget displaying a title and its corresponding value.
  ///
  /// Used to show NIC details.
  Widget _infoCard(String title, String value) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text("$title: $value", style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
