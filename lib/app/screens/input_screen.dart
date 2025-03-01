import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import 'result_screen.dart';

/// A screen that allows users to input their NIC number for decoding.
///
/// It contains a text field for NIC input and a button to trigger decoding.
class InputScreen extends StatelessWidget {
  /// Controller for NIC decoding logic.
  final NICController controller = Get.put(NICController());

  /// Controller for handling NIC number text input.
  final TextEditingController nicController = TextEditingController();

  /// Creates an instance of [InputScreen].
  InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            "NIC Decoder",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextField(
                controller: nicController,
                decoration: InputDecoration(
                  labelText: "Enter NIC Number",
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color.fromARGB(179, 0, 0, 0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            ElevatedButton(
              onPressed: () {
                String nic = nicController.text.trim();
                if (nic.isNotEmpty) {
                  controller.decodeNIC(nic);
                  Get.to(() => ResultScreen());
                } else {
                  Get.snackbar("Error", "Please enter a valid NIC number",
                      backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: const Text("Decode", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
