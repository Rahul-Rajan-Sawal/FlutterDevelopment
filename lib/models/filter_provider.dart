import 'package:flutter_bottom_nav/models/filter_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterNotifier extends StateNotifier<FilterState> {
  FilterNotifier() : super(const FilterState());

  void setPeriod(String value) {
    state = state.copyWith(period: value);
  }

  void setBranch(String value) {
    state = state.copyWith(branch: value);
  }

  void toggleZone(String zone) {
    final updated = [...state.zones];

    if (updated.contains(zone)) {
      updated.remove(zone);
    } else {
      updated.add(zone);
    }
    state = state.copyWith(zones: updated);
  }

  void toggleRegion(String region) {
    final updated = [...state.regions];

    if (updated.contains(region)) {
      updated.remove(region);
    } else {
      updated.add(region);
    }

    state = state.copyWith(regions: updated);
  }

  void clearFilters() {
    state = const FilterState();
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, FilterState>(
  (ref) => FilterNotifier(),
);
