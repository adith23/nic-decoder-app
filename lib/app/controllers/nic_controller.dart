import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// Controller for decoding NIC numbers and extracting user details.
class NICController extends GetxController {
  /// Observables to store NIC details.
  var nic = ''.obs;       
  var dob = ''.obs;     
  var age = ''.obs;     
  var gender = ''.obs;  
  var weekday = ''.obs;  
  var nicType = ''.obs;   

  /// Decodes the NIC number and determines its type.
  ///
  /// Supports both old NICs (10 characters ending with 'v' or 'x')
  /// and new NICs (12 characters).
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

  /// Decodes old NIC numbers (10 characters).
  ///
  /// The year is derived from the first two digits, prefixed with "19".
  /// The day of the year is extracted from the next three digits.
  /// Gender is determined by checking if the day count exceeds 500.
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

  /// Decodes new NIC numbers (12 characters).
  ///
  /// The year is derived from the first four digits.
  /// The day of the year is extracted from the next three digits.
  /// Gender is determined by checking if the day count exceeds 500.
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

  /// Calculates the exact date from the given year and day of the year.
  ///
  /// Handles both 1900-1999 and post-2000 years.
  /// Returns a [DateTime] object representing the birth date.
  DateTime _getDateFromDay(String year, int dayOfYear) {
    int yearInt = int.parse(year);

    if (yearInt >= 1900 && yearInt <= 1999) {
      return DateTime(yearInt, 1, 0).add(Duration(days: dayOfYear - 1));
    } else {
      return DateTime(yearInt, 1, 1).add(Duration(days: dayOfYear - 1));
    }
  }
}
