import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _celsiusController = TextEditingController();
  final _fahrenheitController = TextEditingController();

  void _convertCelsiusToFahrenheit() {
    if (_celsiusController.text.isNotEmpty) {
      double celsius = double.parse(_celsiusController.text);
      double fahrenheit = (celsius * 9 / 5) + 32;
      setState(() {
        _fahrenheitController.text = fahrenheit.toStringAsFixed(2);
      });
    }
  }

  void _convertFahrenheitToCelsius() {
    if (_fahrenheitController.text.isNotEmpty) {
      double fahrenheit = double.parse(_fahrenheitController.text);
      double celsius = (fahrenheit - 32) * 5 / 9;
      setState(() {
        _celsiusController.text = celsius.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _celsiusController,
              decoration: const InputDecoration(
                labelText: 'Celsius',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertCelsiusToFahrenheit,
              child: const Text('Convert to Fahrenheit'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _fahrenheitController,
              decoration: const InputDecoration(
                labelText: 'Fahrenheit',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertFahrenheitToCelsius,
              child: const Text('Convert to Celsius'),
            ),
          ],
        ),
      ),
    );
  }
}
