import 'package:flutter/material.dart';
import 'package:myapp/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A6FEE),
          primary: const Color(0xFF1A6FEE),
          secondary: const Color(0xFF4CAF50),
          background: const Color(0xFFF8F9FD),
          surface: Colors.white,
          error: const Color(0xFFE53935),
        ),
        fontFamily: 'Inter',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardTheme: CardTheme(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          shadowColor: Colors.blueGrey.withOpacity(0.1),
          color: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(0xFFF1F5FE),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          labelStyle: const TextStyle(
            color: Color(0xFF7B8BB2),
          ),
          floatingLabelStyle: const TextStyle(
            color: Color(0xFF1A6FEE),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1A6FEE),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5),
            padding: const EdgeInsets.symmetric(vertical: 18),
            minimumSize: const Size(double.infinity, 60),
          ),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Color(0xFF2D3748),
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Color(0xFF718096),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
