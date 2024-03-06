import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movies_app/models/movie.dart';

class AddMovieForm extends StatefulWidget {
  @override
  _AddMovieFormState createState() => _AddMovieFormState();
}

class _AddMovieFormState extends State<AddMovieForm> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();

  File? _selectedImage;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController overviewController = TextEditingController();
  final TextEditingController releaseDateController = TextEditingController();
  final TextEditingController voteAverageController = TextEditingController();
  final TextEditingController voteCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: _selectedImage == null
                    ? Container(
                        width: double.infinity,
                        height: 150,
                        color: Colors.grey,
                        child: Icon(
                          Icons.add_a_photo,
                          size: 50,
                          color: Colors.white,
                        ),
                      )
                    : Image.file(
                        _selectedImage!,
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: overviewController,
                maxLines: 3,
                decoration: InputDecoration(labelText: 'Overview'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the overview';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: releaseDateController,
                decoration: InputDecoration(labelText: 'Release Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the release date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: voteAverageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Vote Average'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the vote average';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: voteCountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Vote Count'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the vote count';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 45,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, bottom: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button click
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      }
    });
  }

  void _addMovie() {
    if (_formKey.currentState!.validate() && _selectedImage != null) {
      Movie newMovie = Movie(
        backdropPath: '',
        id: 0,
        originalLanguage: '',
        originalTitle: '',
        overview: overviewController.text,
        popularity: 0.0,
        posterPath: _selectedImage!.path, // Lưu đường dẫn của ảnh được chọn
        releaseDate: releaseDateController.text,
        title: titleController.text,
        video: false,
        voteCount: int.parse(voteCountController.text),
        voteAverage: double.parse(voteAverageController.text),
      );

      // TODO: Lưu thông tin của bộ phim và đường dẫn của ảnh vào cơ sở dữ liệu hoặc nguồn dữ liệu của bạn

      Navigator.pop(context);
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: AddMovieForm(),
  ));
}
