import 'package:flutter/material.dart';

class ImcCalcScreen extends StatefulWidget {
  @override
  _ImcCalcScreenState createState() => _ImcCalcScreenState();
}

class _ImcCalcScreenState extends State<ImcCalcScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double? _bmi;

  void _calculateBMI() {
    final double height = double.tryParse(_heightController.text) ?? 0;
    final double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      setState(() {
        _bmi = weight / (height * height);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Altura (metros)',
                hintText: 'Insira sua altura',
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Peso (quilos)',
                hintText: 'Insira seu peso',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16),
            Text(
              _bmi == null
                  ? 'Seu IMC será exibido aqui'
                  : 'Seu IMC é: ${_bmi!.toStringAsFixed(2)}',
            ),
          ],
        ),
      ),
    );
  }
}
