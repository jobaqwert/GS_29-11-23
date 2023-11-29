import 'package:flutter/material.dart';

class IMCCalculatorScreen extends StatefulWidget {
  @override
  _IMCCalculatorScreenState createState() => _IMCCalculatorScreenState();
}

class _IMCCalculatorScreenState extends State<IMCCalculatorScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double? _IMC;
  String _classification = '';

  void _calculateIMC() {
    final double height = double.tryParse(_heightController.text) ?? 0;
    final double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      setState(() {
        _IMC = weight / (height * height);
        _classification = getClassificacaoIMC(_IMC!);
      });
    }
  }

  String getClassificacaoIMC(double imc) {
    if (imc < 18.5) {
      return 'Abaixo do Peso - Baixo risco de comorbidades';
    } else if (imc >= 18.5 && imc < 25) {
      return 'Eutrófico - Médio risco de comorbidades';
    } else if (imc >= 25 && imc < 30) {
      return 'Sobrepeso - Pouco elevado risco de comorbidades';
    } else if (imc >= 30 && imc < 35) {
      return 'Obesidade grau I - Elevado risco de comorbidades';
    } else if (imc >= 35 && imc < 40) {
      return 'Obesidade grau II - Muito elevado risco de comorbidades';
    } else {
      return 'Obesidade grau III - Muitíssimo elevado risco de comorbidades';
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
              onPressed: _calculateIMC,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16),
            if (_IMC != null) Text('Seu IMC é: ${_IMC!.toStringAsFixed(2)}'),
            if (_classification.isNotEmpty) Text(_classification),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: IMCCalculatorScreen()));
