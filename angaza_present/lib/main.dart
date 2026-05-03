import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SQLite FFI for desktop
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  
  // Window manager
  await windowManager.ensureInitialized();
  WindowOptions opts = const WindowOptions(
    size: Size(1440, 900), 
    minimumSize: Size(1024, 600),
    title: "Angaza", 
    backgroundColor: Color(0xFF121212),
  );
  windowManager.waitUntilReadyToShow(opts, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  
  runApp(const ProviderScope(child: AngazaApp()));
}

class AngazaApp extends StatelessWidget {
  const AngazaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angaza Present',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Angaza Present'),
        ),
      ),
    );
  }
}
