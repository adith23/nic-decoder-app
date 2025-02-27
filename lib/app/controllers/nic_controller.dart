import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NICController extends GetxController {
  var nic = ''.obs;
  var dob = ''.obs;
  var age = ''.obs;
  var gender = ''.obs;
  var weekday = ''.obs;
  var nicType = ''.obs;

  void decodeNIC(String nicInput) {
    nic.value = nicInput.trim();
    if (nic.value.length == 10 &&
        (nic.value.endsWith('v') || nic.value.endsWith('x'))) {
      _decodeOldNIC(nic.value);
    } else if (nic.value.length == 12) {
      _decodeNewNIC(nic.value);
    } else {
      Get.snackbar("Error", "Invalid NIC format");
    }
  }

  void _decodeOldNIC(String oldNIC) {
    String year = "19${oldNIC.substring(0, 2)}";
    int dayOfYear = int.parse(oldNIC.substring(2, 5));
    String genderValue = (dayOfYear < 500) ? "Male" : "Female";
    if (dayOfYear > 500) dayOfYear -= 500;

    DateTime birthDate = _getDateFromDay(year, dayOfYear);
    String formattedDOB = DateFormat('yyyy-MM-dd').format(birthDate);
    int currentAge = DateTime.now().year - int.parse(year);
    String weekdayName = DateFormat('EEEE').format(birthDate);

    nicType.value = "Old NIC";
    dob.value = formattedDOB;
    age.value = "$currentAge years";
    gender.value = genderValue;
    weekday.value = weekdayName;
  }

  void _decodeNewNIC(String newNIC) {
    String year = newNIC.substring(0, 4);
    int dayOfYear = int.parse(newNIC.substring(4, 7));
    String genderValue = (dayOfYear < 500) ? "Male" : "Female";
    if (dayOfYear > 500) dayOfYear -= 500;

    DateTime birthDate = _getDateFromDay(year, dayOfYear);
    String formattedDOB = DateFormat('yyyy-MM-dd').format(birthDate);
    int currentAge = DateTime.now().year - int.parse(year);
    String weekdayName = DateFormat('EEEE').format(birthDate);

    nicType.value = "New NIC";
    dob.value = formattedDOB;
    age.value = "$currentAge years";
    gender.value = genderValue;
    weekday.value = weekdayName;
  }

  DateTime _getDateFromDay(String year, int dayOfYear) {
    int yearInt = int.parse(year);

    if (yearInt >= 1900 && yearInt <= 1999) {
      return DateTime(yearInt, 1, 0).add(Duration(days: dayOfYear - 1));
    } else {
      return DateTime(yearInt, 1, 1).add(Duration(days: dayOfYear - 1));
    }
  }
}
