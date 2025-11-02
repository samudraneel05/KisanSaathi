import 'package:flutter/material.dart';
import 'package:kisan_saathi/core/constants/app_colors.dart';
import 'package:kisan_saathi/core/localization/app_localizations.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('journal.crop_journal')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.menu_book,
                size: 80,
                color: AppColors.textHint,
              ),
              const SizedBox(height: 16),
              Text(
                'No journal entries yet',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Start documenting your farming journey',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textHint,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to add journal entry screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
