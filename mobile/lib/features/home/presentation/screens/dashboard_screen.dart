import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisan_saathi/core/constants/app_colors.dart';
import 'package:kisan_saathi/core/localization/app_localizations.dart';
import 'package:kisan_saathi/features/fields/presentation/providers/field_provider.dart';
import 'package:kisan_saathi/features/crops/presentation/providers/crop_provider.dart';
import 'package:kisan_saathi/features/fields/presentation/screens/fields_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fieldsAsyncValue = ref.watch(fieldsStreamProvider);
    final cropsAsyncValue = ref.watch(cropsStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('home.dashboard')),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: Implement refresh
          await Future.delayed(const Duration(seconds: 1));
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Welcome card
            _buildWelcomeCard(context),
            const SizedBox(height: 16),
            
            // Statistics row
            _buildStatisticsRow(
              context,
              fieldsCount: fieldsAsyncValue.value?.length ?? 0,
              cropsCount: cropsAsyncValue.value?.length ?? 0,
            ),
            const SizedBox(height: 24),
            
            // Active crops section
            _buildSectionHeader(
              context,
              context.tr('home.active_crops'),
              onViewAll: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FieldsScreen()),
                );
              },
            ),
            const SizedBox(height: 12),
            cropsAsyncValue.when(
              data: (crops) {
                if (crops.isEmpty) {
                  return _buildEmptyState(context);
                }
                return _buildCropsList(context, crops);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) => _buildEmptyState(context),
            ),
            const SizedBox(height: 24),
            
            // Upcoming alerts section
            _buildSectionHeader(
              context,
              context.tr('home.upcoming_alerts'),
              onViewAll: () {
                // TODO: Navigate to alerts screen
              },
            ),
            const SizedBox(height: 12),
            _buildUpcomingAlerts(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.wb_sunny,
                color: Colors.white,
                size: 32,
              ),
              const SizedBox(width: 12),
              Text(
                'Good Morning!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Manage your crops and stay updated with timely alerts',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsRow(
    BuildContext context, {
    required int fieldsCount,
    required int cropsCount,
  }) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.grass,
            value: '$cropsCount',
            label: 'Active Crops',
            color: AppColors.success,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.notifications_active,
            value: '0',
            label: 'Alerts Today',
            color: AppColors.warning,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.landscape,
            value: '$fieldsCount',
            label: 'Fields',
            color: AppColors.info,
          ),
        ),
      ],
    );
  }

  Widget _buildCropsList(BuildContext context, List crops) {
    return Column(
      children: crops.take(3).map((crop) {
        final daysSinceSowing = DateTime.now().difference(crop.sowingDate).inDays;
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.eco, color: AppColors.success),
            ),
            title: Text(crop.cropType),
            subtitle: Text('${crop.seedVariety} • $daysSinceSowing days'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to crop detail
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title, {
    VoidCallback? onViewAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        if (onViewAll != null)
          TextButton(
            onPressed: onViewAll,
            child: const Text('View All'),
          ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(
            Icons.agriculture,
            size: 64,
            color: AppColors.textHint,
          ),
          const SizedBox(height: 16),
          Text(
            context.tr('home.no_crops_yet'),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            context.tr('home.add_first_crop'),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textHint,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FieldsScreen()),
              );
            },
            icon: const Icon(Icons.add),
            label: Text(context.tr('field.add_field')),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingAlerts(BuildContext context) {
    // TODO: Replace with actual alerts from database
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 48,
            color: AppColors.success,
          ),
          const SizedBox(height: 12),
          Text(
            'No upcoming alerts',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'You\'re all caught up!',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
