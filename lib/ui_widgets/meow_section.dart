import 'package:flutter/material.dart';
import '../data_models/meow_fact_model.dart';
import '../services/meow_service.dart' as meow_svc;

class MeowSection extends StatelessWidget {
  const MeowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MeowFacts>(
      future: meow_svc.fetchMeowFacts(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting ||
            snap.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) return Center(child: Text('Error: ${snap.error}'));
        final fact = snap.data;
        if (fact == null || fact.data.isEmpty) {
          return const Center(child: Text('No meow fact found.'));
        }
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                fact.data[0],
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              Text(
                fact.data[1],
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              Text(
                fact.data[2],
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }
}
