import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  /// Counter value
  var counter = 0.obs;

  /// All countries
  var countries = <String>[].obs;

  /// Filtered countries list
  var filteredCountries = <String>[].obs;

  /// Search text controller
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    // Generate dummy country list
    countries.value = List.generate(50, (index) => "Country ${index + 1}");
    filteredCountries.assignAll(countries);
  }

  /// Increment counter
  void increment() {
    counter.value++;
  }

  /// Decrement counter with validation
  void decrement(BuildContext context) {
    if (counter.value > 0) {
      counter.value--;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cannot go below 0"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  /// Filter countries based on search query
  void filterCountries(String query) {
    if (query.isEmpty) {
      filteredCountries.assignAll(countries);
    } else {
      filteredCountries.assignAll(
        countries.where(
              (country) => country.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }
}
