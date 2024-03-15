import 'dart:convert';
import 'package:Dozer/data/network/network_api_service.dart';
import 'package:Dozer/presentation/booking/models/booking_form_model.dart';

class BookingRepository {
  final NetworkApiService _apiService = NetworkApiService();
 final String apiUrl = 'https://dozer-backend-tech-gem.onrender.com/api/v1/';

  Future<bool> confirmBooking(BookingModel booking) async {
    try {
      final dynamic response = await _apiService.postResponse('${apiUrl}bookings',booking.toJson());

      if (response == null) {
        throw Exception('Null response received.');
      }

      final dynamic responseBody = response is String ? jsonDecode(response) : response;

      if (responseBody == null) {
        throw Exception('Invalid JSON format.');
      }

      if (responseBody['status'] == 'success') {
        return true; // Assuming 'confirmBooking' returns a boolean indicating success
      } else {
        throw Exception('Failed to confirm booking. Status: ${responseBody['status']}');
      }
    } catch (error) {
      print('Error confirming booking: $error');
      throw Exception('Failed to confirm booking');
    }
  }
}

