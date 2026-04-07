import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;


class CameraService {
  final ImagePicker _picker = ImagePicker();

  /// Ambil gambar dari kamera, kembalikan path sebagai string

Future<String?> takePicture() async {
  try {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (pickedFile == null) return null;

    // Get the app's documents directory
    final Directory appDir = await getApplicationDocumentsDirectory();

    // Create a folder called "images" inside the app directory
    final Directory imagesDir = Directory(path.join(appDir.path, 'images'));
    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }

    // Generate a unique file name
    final String fileName = path.basename(pickedFile.path);

    // Copy the file to the new directory
    final File savedImage = await File(pickedFile.path).copy(path.join(imagesDir.path, fileName));

    return savedImage.path;
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