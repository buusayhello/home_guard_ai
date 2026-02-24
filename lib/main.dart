import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'logic/device_logic.dart';
import 'presentation/dashboard_screen.dart';
import 'core/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final deviceLogic = DeviceLogic();
  await deviceLogic.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: deviceLogic),
      ],
      child: const HomeGuardApp(),
    ),
  );
}

class HomeGuardApp extends StatelessWidget {
  const HomeGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeGuard AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.royalGold,
        scaffoldBackgroundColor: AppColors.deepBlack,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.royalGold,
          secondary: AppColors.royalGold,
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}
