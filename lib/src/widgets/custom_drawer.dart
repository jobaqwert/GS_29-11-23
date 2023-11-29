import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Calculadora de IMC'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/imc-calculator');
            },
          ),
          ListTile(
            title: Text('Alertas'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/alerts');
            },
          ),
          ListTile(
            title: Text('Recomendações'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/recommendations');
            },
          ),
        ],
      ),
    );
  }
}
