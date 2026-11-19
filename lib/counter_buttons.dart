import 'package:flutter/material.dart';

/// Widget yang menampilkan 3 tombol aksi counter.
/// Tidak ada logika counter di sini, hanya memanggil callback dari parent.
class CounterButtons extends StatelessWidget {
  // Callback yang dipanggil saat tombol ditekan (diterima dari parent)
  final VoidCallback onAdd;
  final VoidCallback onSubtract;
  final VoidCallback onReset;

  const CounterButtons({
    super.key,
    required this.onAdd,
    required this.onSubtract,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Tombol kurang — memanggil callback onSubtract dari parent
        ElevatedButton(
          onPressed: onSubtract,
          child: const Text('Kurang (-1)'),
        ),
        const SizedBox(width: 12),
        // Tombol reset — memanggil callback onReset dari parent
        ElevatedButton(
          onPressed: onReset,
          child: const Text('Reset'),
        ),
        const SizedBox(width: 12),
        // Tombol tambah — memanggil callback onAdd dari parent
        ElevatedButton(
          onPressed: onAdd,
          child: const Text('Tambah (+1)'),
        ),
      ],
    );
  }
}
