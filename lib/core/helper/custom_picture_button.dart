import 'package:flutter/material.dart';
import 'package:camera_service/camera_service.dart';

typedef OnPictureTaken = void Function(String path);

class CustomPictureButton extends StatelessWidget {
  final String text;
  final OnPictureTaken onPictureTaken;
  final bool fromGallery;

  const CustomPictureButton({
    super.key,
    required this.text,
    required this.onPictureTaken,
    this.fromGallery = false,
  });

  @override
  Widget build(BuildContext context) {
    final CameraService _cameraService = CameraService();

    return ElevatedButton(
      onPressed: () async {
        String? path;
        if (fromGallery) {
          path = await _cameraService.pickFromGallery();
        } else {
          path = await _cameraService.takePicture();
        }

        if (path != null) {
          onPictureTaken(path);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Gambar berhasil diambil")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Gagal mengambil gambar")),
          );
        }
      },
      child: Text(text),
    );
  }
}