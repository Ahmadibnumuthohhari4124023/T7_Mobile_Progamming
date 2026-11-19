import 'package:flutter/material.dart';
import 'counter_display.dart';
import 'counter_buttons.dart';

void main() {
  runApp(const MyApp());
}

/// Widget utama aplikasi (StatelessWidget).
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}

/// Halaman counter (StatefulWidget) yang menyimpan state _counter.
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // Variabel state untuk menyimpan nilai counter
  int _counter = 0;

  // initState dipanggil saat widget pertama kali dibuat
  @override
  void initState() {
    super.initState();
    debugPrint('Counter dimulai'); // Log saat app dibuka
  }

  // dispose dipanggil saat widget dihapus dari tree
  @override
  void dispose() {
    debugPrint('Counter ditutup'); // Log saat app ditutup
    super.dispose();
  }

  /// Menambah counter sebanyak 1 menggunakan setState
  void _tambah() {
    // setState memberi tahu framework bahwa state berubah dan perlu rebuild
    setState(() {
      _counter = _counter + 1;
    });
  }

  /// Mengurangi counter sebanyak 1, hanya jika _counter > 0 (tidak boleh minus)
  void _kurang() {
    if (_counter > 0) {
      // setState hanya dipanggil jika counter masih di atas 0
      setState(() {
        _counter = _counter - 1;
      });
    }
  }

  /// Mengembalikan counter ke 0
  void _reset() {
    // setState untuk mereset tampilan ke nilai awal
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Passing data _counter ke child widget lewat constructor
            CounterDisplay(value: _counter),
            const SizedBox(height: 24),
            // Passing callback ke child widget lewat constructor
            CounterButtons(
              onAdd: _tambah,
              onSubtract: _kurang,
              onReset: _reset,
            ),
          ],
        ),
      ),
    );
  }
}
