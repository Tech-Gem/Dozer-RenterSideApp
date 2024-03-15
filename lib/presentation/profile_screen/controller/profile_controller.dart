// profile_controller.dart

import 'package:Dozer/presentation/profile_screen/models/profile_model.dart';
import 'package:Dozer/presentation/profile_screen/repository/profile_repository.dart';
import 'package:get/get.dart';



enum Status { loading, success, error }

class ProfileController extends GetxController {
  final ProfileRepository _repository = ProfileRepository();
  Rx<Profile?> profile = Rx<Profile?>(null);
  Rx<Status> status = Status.loading.obs;
  final String id = "575d5151-bf3f-4b22-8c97-0bc446e7955d";

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  void fetchProfile() async {
    try {
      status(Status.loading);
      final result = await _repository.getProfile(id);
      profile(result);
      print("#############${result.email}");
      status(Status.success);
    } catch (error) {
      print('Error fetching profile: $error');
      status(Status.error);
    }
  }
}
