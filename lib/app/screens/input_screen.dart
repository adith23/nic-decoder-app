import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import 'result_screen.dart';

class InputScreen extends StatelessWidget {
  final NICController controller = Get.put(NICController());
  final TextEditingController nicController = TextEditingController();

  InputScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            "NIC Decoder", 
            style: TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold
            ),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextField(
                controller: nicController,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  labelText: "Enter NIC Number",
                  labelStyle: const TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(179, 0, 0, 0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: ElevatedButton(
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
                ),
                child: const Text("Decode", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

