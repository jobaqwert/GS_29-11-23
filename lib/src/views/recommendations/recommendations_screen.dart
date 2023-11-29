import 'package:flutter/material.dart';

class RecommendationsScreen extends StatelessWidget {
  // Dados fictícios para exemplo.
  final List<String> recommendations = [
    '30 minutos de caminhada',
    'Beber mais água'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recomendações'),
      ),
      body: ListView.builder(
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.thumb_up),
            title: Text(recommendations[index]),
          );
        },
      ),
    );
  }
}
