import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quote_provider.dart';
import 'screens/quote_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuoteProvider(),
      child: MaterialApp(
        title: 'Günün Sözü',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
        ),
        themeMode: ThemeMode.system,
        home: const QuoteScreen(),
      ),
    );
  }
}
