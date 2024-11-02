import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: FutureBuilder(
        future: Supabase.instance.client.from('videos').select().execute(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final videos = snapshot.data.data as List;
          return ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              return ListTile(
                title: Text(video['title']),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/video',
                    arguments: video['id'],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
