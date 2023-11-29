import 'package:flutter/material.dart';
import 'package:healthguard_pro/src/widgets/custom_drawer.dart';
import 'package:healthguard_pro/src/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double waterIntake = 1.5; // litros de água
  int heartRate = 80; // batimentos por minuto
  int steps = 3000; // passos dados
  int calories = 500; // calorias queimadas

  Future<double?> _showWaterIntakeDialog(BuildContext context) {
    final TextEditingController _waterController = TextEditingController();
    return showDialog<double>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adicionar Água Ingerida'),
          content: TextField(
            controller: _waterController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(hintText: "Litros"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Adicionar'),
              onPressed: () {
                final newIntake = double.tryParse(_waterController.text);
                if (newIntake != null) {
                  Navigator.pop(context, newIntake);
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _updateWaterIntake(double newIntake) {
    setState(() {
      waterIntake += newIntake;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appTitle),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: <Widget>[
          HealthInfoCard(
            title: 'Batimentos Cardíacos',
            value: '$heartRate bpm',
            icon: Icons.favorite,
          ),
          HealthInfoCard(
            title: 'Passos',
            value: '$steps passos',
            icon: Icons.directions_walk,
          ),
          HealthInfoCard(
            title: 'Água Ingerida',
            value: '${waterIntake.toStringAsFixed(1)} L',
            icon: Icons.local_drink,
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                final newIntake = await _showWaterIntakeDialog(context);
                if (newIntake != null) {
                  _updateWaterIntake(newIntake);
                }
              },
            ),
          ),
          HealthInfoCard(
            title: 'Calorias Queimadas',
            value: '$calories cal',
            icon: Icons.local_fire_department,
          ),
        ],
      ),
    );
  }
}

class HealthInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Widget? trailing;

  const HealthInfoCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(value),
        trailing: trailing,
      ),
    );
  }
}
