import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/app/modules/images/controllers/images_controller.dart';
import 'package:wallpaper/app/modules/images/views/full_screen_image_view.dart';

class ImagesView extends GetView<ImagesController> {
  const ImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallpapers"),
        actions: [
          IconButton(
              onPressed: controller.signout,
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              onSubmitted: (query) {
                controller.fetchImages(query);
              },
              decoration: const InputDecoration(
                labelText: "Search Images",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                // suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.images.isEmpty) {
                return const Center(child: Text("No images found!"));
              }

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: controller.images.length,
                itemBuilder: (context, index) {
                  final image = controller.images[index];
                  final imageUrl = image['src']['original'];
                  return InkWell(
                    onTap: () =>
                        Get.to(() => FullScreenImageView(imageUrl: imageUrl)),
                    child: Image.network(
                      image['src']['medium'],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
