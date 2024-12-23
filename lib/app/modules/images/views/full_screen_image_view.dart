import 'package:flutter/material.dart';

class FullScreenImageView extends StatelessWidget {
  final String imageUrl;

  const FullScreenImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Close fullscreen on tap
            },
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          ElevatedButton(onPressed: null, child: Text('Set Wallpaper'))
        ],
      ),
    );
  }
}
