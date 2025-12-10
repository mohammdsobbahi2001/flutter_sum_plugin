import 'package:flutter/material.dart';
import 'package:flutter_sum_plugin/flutter_sum_plugin.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SumPage());
  }
}

class SumPage extends StatefulWidget {
  @override
  _SumPageState createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {
  final aController = TextEditingController(text: '3');
  final bController = TextEditingController(text: '4');
  String? resultText;

  Future<void> _doSum() async {
    final a = int.tryParse(aController.text) ?? 0;
    final b = int.tryParse(bController.text) ?? 0;
    try {
      final sum = await FlutterSumPlugin.sum(a, b);
      setState(() {
        resultText = 'Result: $sum';
      });
    } catch (e) {
      setState(() {
        resultText = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutter_sum_plugin example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: aController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'a'),
            ),
            TextField(
              controller: bController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'b'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _doSum, child: const Text('Sum')),
            const SizedBox(height: 12),
            if (resultText != null) Text(resultText!),
          ],
        ),
      ),
    );
  }
}
