import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'models/app_state.dart';
import 'services/audio_service.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
  await Hive.openBox('flower_joy');
  await AudioService.initialize();
  
  runApp(const FlowerJoyApp());
}

class FlowerJoyApp extends StatelessWidget {
  const FlowerJoyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'Цветочек Радости',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
            brightness: Brightness.light,
          ),
          scaffoldBackgroundColor: const Color(0xFFF8F4EC),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.teal.withOpacity(0.8),
            elevation: 0,
            centerTitle: true,
            titleTextStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
