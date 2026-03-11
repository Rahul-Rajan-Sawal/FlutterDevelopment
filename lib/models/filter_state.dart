class FilterState {
  final String? period;
  final String? branch;
  final List<String> zones;
  final List<String> regions;

  const FilterState({
    this.period,
    this.branch,
    this.zones = const [],
    this.regions = const [],
  });

  FilterState copyWith({
    String? period,
    String? branch,
    List<String>? zones,
    List<String>? regions,
  }) {
    return FilterState(
      period: period ?? this.period,
      branch: branch ?? this.branch,
      zones: zones ?? this.zones,
      regions: regions ?? this.regions,
    );
  }
}
