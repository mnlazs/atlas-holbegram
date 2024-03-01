import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPicture extends StatefulWidget {
  final String email;
  final String password;
  final String username;

  const AddPicture({
    super.key, // Uso correcto de super parámetros para 'key'
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  _AddPictureState createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  Uint8List? _image;

  Future<void> selectImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _image = Uint8List.fromList(bytes);
      });
    }
  }

  Future<void> selectImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _image = Uint8List.fromList(bytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Picture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Muestra la imagen seleccionada o un ícono de usuario por defecto
            _image != null
                ? Image.memory(_image!, width: 200, height: 200)
                : const Icon(Icons.account_circle, size: 200),
            const SizedBox(height: 20), // Espacio entre imagen y botones
            // Botones para seleccionar imagen de galería o cámara
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: selectImageFromGallery,
                  tooltip: 'Select from Gallery',
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: selectImageFromCamera,
                  tooltip: 'Take a Picture',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
