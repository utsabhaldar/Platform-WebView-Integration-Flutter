import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youtube_clone/Screens/home_screen.dart';
import 'package:youtube_clone/Screens/login_screen.dart';
import 'package:youtube_clone/Screens/profile_screen.dart';
import 'package:youtube_clone/Screens/vid_play_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(
    url: 'https://hljtrbxyqgoabyapdcxv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhsanRyYnh5cWdvYWJ5YXBkY3h2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk0ODkwNjAsImV4cCI6MjAzNTA2NTA2MH0.eC1gTSzGW9YbjH3AlLDue9hlvrDhP7t-ujoRtoSbNUc',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/video': (context) => VideoScreen(
            videoUrl: ModalRoute.of(context)!.settings.arguments as String),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
