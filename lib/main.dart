import 'package:flutter/material.dart';
import 'package:healthguard_pro/src/views/IMC_calc/imc_calc.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' show jsonDecode;
import 'src/views/alerts/alerts_screen.dart';
import 'src/views/home/home_screen.dart';
import 'src/views/recommendations/recommendations_screen.dart';
import 'src/views/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr =
      await rootBundle.loadString('assets/themes/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(HealthGuardProApp(theme: theme));
}

class HealthGuardProApp extends StatelessWidget {
  final ThemeData theme;

  const HealthGuardProApp({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthGuard Pro',
      theme: theme,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/alerts': (context) => AlertsScreen(),
        '/recommendations': (context) => RecommendationsScreen(),
        '/imc-calculator': (context) => IMCCalculatorScreen(),
      },
    );
  }
}
