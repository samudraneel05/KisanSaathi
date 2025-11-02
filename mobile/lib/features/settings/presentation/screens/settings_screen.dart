import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisan_saathi/core/constants/app_colors.dart';
import 'package:kisan_saathi/core/localization/app_localizations.dart';
import 'package:kisan_saathi/features/auth/presentation/providers/auth_provider.dart';
import 'package:kisan_saathi/features/auth/presentation/screens/phone_auth_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('settings.settings')),
      ),
      body: ListView(
        children: [
          // Profile section
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryLight],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 32,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Farmer Name',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '+91 XXXXXXXXXX',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withOpacity(0.9),
                            ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                    // TODO: Edit profile
                  },
                ),
              ],
            ),
          ),
          
          // Settings sections
          _buildSettingsSection(
            context,
            title: 'General',
            items: [
              _SettingsItem(
                icon: Icons.language,
                title: context.tr('settings.language'),
                subtitle: 'English',
                onTap: () {
                  // TODO: Language selection
                },
              ),
              _SettingsItem(
                icon: Icons.notifications,
                title: context.tr('settings.notifications'),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {
                    // TODO: Toggle notifications
                  },
                ),
                onTap: null,
              ),
              _SettingsItem(
                icon: Icons.cloud_sync,
                title: context.tr('settings.sync'),
                subtitle: 'Last synced: Just now',
                onTap: () {
                  // TODO: Sync data
                },
              ),
            ],
          ),
          
          _buildSettingsSection(
            context,
            title: 'Support',
            items: [
              _SettingsItem(
                icon: Icons.help_outline,
                title: context.tr('settings.help'),
                onTap: () {
                  // TODO: Help screen
                },
              ),
              _SettingsItem(
                icon: Icons.info_outline,
                title: context.tr('settings.about'),
                onTap: () {
                  // TODO: About screen
                },
              ),
            ],
          ),
          
          _buildSettingsSection(
            context,
            title: 'Account',
            items: [
              _SettingsItem(
                icon: Icons.logout,
                title: context.tr('auth.logout'),
                textColor: AppColors.error,
                onTap: () async {
                  final shouldLogout = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(context.tr('auth.logout')),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(context.tr('common.cancel')),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text(
                            context.tr('auth.logout'),
                            style: const TextStyle(color: AppColors.error),
                          ),
                        ),
                      ],
                    ),
                  );
                  
                  if (shouldLogout == true) {
                    await ref.read(authControllerProvider).signOut();
                    if (context.mounted) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhoneAuthScreen(),
                        ),
                        (route) => false,
                      );
                    }
                  }
                },
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          Center(
            child: Text(
              'KisanSaathi v1.0.0',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(
    BuildContext context, {
    required String title,
    required List<_SettingsItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: items.map((item) {
              final isLast = items.last == item;
              return Column(
                children: [
                  ListTile(
                    leading: Icon(item.icon, color: item.textColor),
                    title: Text(
                      item.title,
                      style: TextStyle(color: item.textColor),
                    ),
                    subtitle: item.subtitle != null
                        ? Text(item.subtitle!)
                        : null,
                    trailing: item.trailing ??
                        (item.onTap != null
                            ? const Icon(Icons.chevron_right)
                            : null),
                    onTap: item.onTap,
                  ),
                  if (!isLast) const Divider(height: 1, indent: 56),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _SettingsItem {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? textColor;

  _SettingsItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.textColor,
  });
}
