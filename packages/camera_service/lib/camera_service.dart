import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraService {
  final ImagePicker _picker = ImagePicker();

  /// Ambil gambar dari kamera, kembalikan path sebagai string
  Future<String?> takePicture() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      return pickedFile?.path;
    } catch (e) {
      print("Error mengambil gambar: $e");
      return null;
    }
  }

  /// Ambil gambar dari gallery, kembalikan path sebagai string
  Future<String?> pickFromGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      return pickedFile?.path;
    } catch (e) {
      print("Error pilih gambar dari gallery: $e");
      return null;
    }
  }
}