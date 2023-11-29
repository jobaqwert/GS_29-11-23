import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  // Dados fictícios para exemplo.
  final List<String> alerts = [
    'Alerta de pressão alta',
    'Lembrete de medicamento'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertas de Saúde'),
      ),
      body: ListView.builder(
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.warning),
            title: Text(alerts[index]),
          );
        },
      ),
    );
  }
}
