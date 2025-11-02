import 'package:flutter/material.dart';
import 'package:kisan_saathi/core/constants/app_colors.dart';
import 'package:kisan_saathi/core/localization/app_localizations.dart';
import 'package:kisan_saathi/features/home/presentation/screens/dashboard_screen.dart';
import 'package:kisan_saathi/features/alerts/presentation/screens/alerts_screen.dart';
import 'package:kisan_saathi/features/journal/presentation/screens/journal_screen.dart';
import 'package:kisan_saathi/features/settings/presentation/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const AlertsScreen(),
    const JournalScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard),
            label: context.tr('home.dashboard'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: context.tr('home.alerts'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: context.tr('home.journal'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: context.tr('home.settings'),
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton.extended(
              onPressed: () {
                // TODO: Navigate to add crop screen
              },
              icon: const Icon(Icons.add),
              label: Text(context.tr('crop.add_crop')),
            )
          : null,
    );
  }
}
