import 'package:Dozer/data/network/network_api_service.dart';
import 'package:Dozer/presentation/booking/models/booking_form_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signature/signature.dart';

class BookingController extends GetxController {
  final NetworkApiService _apiService = NetworkApiService();

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final SignatureController signBoardSignatureController = SignatureController();

  Future<void> getCurrentLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          locationController.text = placemarks[0].name ?? 'Location not available';
        } else {
          locationController.text = 'Location not available';
        }
      } catch (e) {
        print('Error getting location: $e');
        locationController.text = 'Location not available';
      }
    } else if (status.isDenied) {
      print('Location permission denied by the user.');
    } else if (status.isPermanentlyDenied) {
      print('Location permission permanently denied by the user.');
      await openAppSettings(); // Direct the user to app settings
    }
  }

  Future<void> showPredefinedLocationsDialog() async {
    List<String> predefinedLocations = ['Location A', 'Location B', 'Location C'];
    String? selectedLocation = await Get.dialog(
      AlertDialog(
        title: Text('Select Location'),
        content: DropdownButton<String>(
          items: predefinedLocations.map((String location) {
            return DropdownMenuItem<String>(
              value: location,
              child: Text(location),
            );
          }).toList(),
          onChanged: (String? value) {
            Get.back(result: value);
          },
        ),
      ),
    );

    if (selectedLocation != null) {
      locationController.text = selectedLocation;
    }
  }

  Future<void> confirmBooking() async {
    try {
      // Perform validations here if needed

      final BookingModel booking = BookingModel(
        equipmentId: "", // Replace with actual equipment ID
        name: "Chrisitina Solomon",
        email: "hayat1911@gmail.com",
        startDate: startDateController.text,
        endDate: endDateController.text,
        location: locationController.text,
        quantity: int.tryParse(quantityController.text) ?? 0,
        signature: " ",
        termsAndConditions: true, // You can modify this based on your logic
      );
      final String apiUrl = 'https://dozer-backend-tech-gem.onrender.com/api/v1/';

      final dynamic response = await _apiService.postResponse('${apiUrl}bookings', booking.toJson());

      if (response != null) {
        // Handle success, e.g., navigate to a success screen
        print('Booking confirmed successfully!');
      } else {
        // Handle failure, e.g., show an error message
        print('Failed to confirm booking');
      }
    } catch (error) {
      // Handle any unexpected errors
      print('Error confirming booking: $error');
    }
  }
}
