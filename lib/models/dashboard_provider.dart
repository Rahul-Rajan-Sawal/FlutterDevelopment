import 'package:flutter_bottom_nav/core/repository/dashboard_repository.dart';
import 'package:flutter_bottom_nav/models/dashboard_summary_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database_helper.dart';

final dashboardRepositoryProvider = Provider(
  (ref) => DashboardRepository(DatabaseHelper.instance),
);

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, AsyncValue<DashboardSummary>>(
      (ref) => DashboardNotifier(ref.read(dashboardRepositoryProvider)),
    );

class DashboardNotifier extends StateNotifier<AsyncValue<DashboardSummary>> {
  final DashboardRepository repository;

  DashboardNotifier(this.repository) : super(const AsyncValue.loading());

  Future<void> loadDashboard({
    required String rmCode,
    required String month,
  }) async {
    try {
      state = const AsyncValue.loading();

      final data = await repository.loadDashboard(rmCode: rmCode, month: month);

      final summary = await repository.calculateSummary(rmCode, month);
      state = AsyncValue.data(summary);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
