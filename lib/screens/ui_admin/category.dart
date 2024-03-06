import 'package:flutter/material.dart';
import 'package:movies_app/models/genre.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/screens/ui_admin/navBar_admin.dart';

import 'package:movies_app/services/service_provider.dart';

class CategoryAdmin extends StatelessWidget {
  const CategoryAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          'Discover',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder<List<Genre>>(
        future: ServiceProvider.apiService.getGenreList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Không có dữ liệu.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Genre genre = snapshot.data![index];

                return Column(
                  children: [
                    ListTile(
                      onTap: () async {
                        List<Movie> moviesForGenre = await ServiceProvider
                            .apiService
                            .getMovieByGenre(genre.id ?? 1);

                        Navigator.pushNamed(
                          context,
                          'genrePage',
                          arguments: {
                            'genreName': genre.name,
                            'movies': moviesForGenre,
                          },
                        );
                      },
                      contentPadding: EdgeInsets.all(8),
                      tileColor: const Color(0xFF292B37),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(
                        genre.name ?? 'Unknown',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.green),
                            onPressed: () {
                              // Handle edit button click
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Handle delete button click
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: NavBarAdmin(),
    );
  }
}
