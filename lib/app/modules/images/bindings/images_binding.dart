import 'package:get/get.dart';
import 'package:wallpaper/app/data/providers/pixels_api_provider.dart';
import 'package:wallpaper/app/data/repositories/image_repositories.dart';
import 'package:wallpaper/app/modules/images/controllers/images_controller.dart';

class ImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PexelsApiProvider());
    Get.lazyPut(() => ImageRepository(Get.find<PexelsApiProvider>()));
    Get.lazyPut(() => ImagesController(Get.find<ImageRepository>()));
  }
}
