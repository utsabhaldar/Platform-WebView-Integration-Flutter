import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),
            _imageFile != null
                ? Image.file(File(_imageFile!.path))
                : const Placeholder(fallbackHeight: 100, fallbackWidth: 100),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  _imageFile = pickedFile;
                });
              },
              child: const Text('Pick Profile Photo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_imageFile != null) {
                  final response = await Supabase.instance.client.storage
                      .from('avatars')
                      .upload(
                          'public/${Supabase.instance.client.auth.user()!.id}.png',
                          File(_imageFile!.path));
                  if (response.error == null) {
                    final imageUrl = Supabase.instance.client.storage
                        .from('avatars')
                        .getPublicUrl(response.data['Key']);
                    await Supabase.instance.client
                        .from('profiles')
                        .update({
                          'name': nameController.text,
                          'avatar_url': imageUrl
                        })
                        .eq('id', Supabase.instance.client.auth.user()!.id)
                        .execute();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response.error.message)),
                    );
                  }
                }
              },
              child: const Text('Save Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
