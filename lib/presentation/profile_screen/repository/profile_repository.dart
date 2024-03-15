import 'dart:convert';

import 'package:Dozer/data/network/network_api_service.dart';
import 'package:Dozer/presentation/profile_screen/models/profile_model.dart';

class ProfileRepository {
  final String apiUrl = 'https://dozer-backend-tech-gem.onrender.com/api/v1/';
  final NetworkApiService _apiService = NetworkApiService();

  Future<Profile> getProfile(String id) async {
    try {
      final dynamic response = await _apiService.getResponse('$apiUrl/userProfile/$id');

      if (response == null) {
        throw Exception('Null response received.');
      }

      final dynamic responseBody = response is String ? jsonDecode(response) : response;

      if (responseBody == null) {
        throw Exception('Invalid JSON format.');
      }

      if (responseBody['status'] == 'success') {
        final Map<String, dynamic> json = responseBody;
        return Profile.fromJson(json);
      } else {
        throw Exception('Failed to load profile. Status: ${responseBody['status']}');
      }
    } catch (error) {
      print('Error fetching profile: $error');
      throw Exception('Failed to load profile');
    }
  }
}
