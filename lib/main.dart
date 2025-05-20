import 'package:flutter/material.dart';
import 'package:movie_app/features/home/view/screens/splash_screen.dart';
import 'package:movie_app/features/home/viewmodel/movie_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MovieViewmodel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
