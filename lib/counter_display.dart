import 'package:flutter/material.dart';

/// Widget untuk menampilkan nilai counter.
/// Menerima data [value] dari parent lewat constructor (passing data via constructor).
class CounterDisplay extends StatelessWidget {
  // Menerima nilai counter dari parent widget melalui constructor
  final int value;

  const CounterDisplay({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label teks di atas angka counter
        const Text(
          'Nilai Counter',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 8),
        // Menampilkan angka counter dengan ukuran font besar
        Text(
          '$value',
          style: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
