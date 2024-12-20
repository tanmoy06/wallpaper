import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:wallpaper/app/data/repositories/image_repositories.dart';

class ImagesController extends GetxController {
  final ImageRepository _repository;

  ImagesController(this._repository);

  final images = <dynamic>[].obs;
  final isLoading = false.obs;

  void fetchImages(String query) async {
    isLoading.value = true;
    try {
      final fetchedImages = await _repository.getImages(query);
      images.assignAll(fetchedImages);
    } catch (e) {
      Get.snackbar("Error", "Failed to load images");
    } finally {
      isLoading.value = false;
    }
  }

  void signout() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed('/login');
  }
}
