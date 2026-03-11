class DashboardSummary {
  final int convertedCount;
  final double convertedAmount;

  final int lostCount;
  final double lostAmount;

  final int openCount;
  final double openAmount;

  final int salesCloseCount;
  final double salesCloseAmount;
  final int totalLeads;
  final double totalGwp;

  DashboardSummary({
    required this.totalLeads,
    required this.totalGwp,
    required this.convertedCount,
    required this.convertedAmount,
    required this.lostCount,
    required this.lostAmount,
    required this.openCount,
    required this.openAmount,
    required this.salesCloseCount,
    required this.salesCloseAmount,
  });

  double _calculate(int value) {
    if (totalLeads == 0) return 0.0;
    return (value * 100) / totalLeads;
  }

  double get convertedPercentage => _calculate(convertedCount);
  double get lostPercentage => _calculate(lostCount);
  double get openPercentage => _calculate(openCount);
  double get salesClosedPercentage => _calculate(salesCloseCount);
}
