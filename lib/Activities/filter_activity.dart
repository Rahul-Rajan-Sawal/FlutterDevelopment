import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav/models/filter_provider.dart';
import 'package:flutter_bottom_nav/models/filter_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterActivity extends ConsumerStatefulWidget {
  const FilterActivity({super.key});
  @override
  ConsumerState<FilterActivity> createState() => _FilterActivityState();
}

class _FilterActivityState extends ConsumerState<FilterActivity> {
  int selectedIndex = 0;

  List<String> zoneList = ["North", "South", "East", "West"];
  List<String> regionList = ["Region A", "Region B", "Region C"];
  List<String> branchList = ["Branch 1", "Branch 2", "Branch 3"];

  final List<String> filterCategories = [
    "Period",
    "Zone",
    "Region",
    "Branch",
    "Sales Manager",
    "Agent",
    "Reference",
    "LOB",
    "Product Group",
    "Product",
    "Product Sub Category",
    "Renewal Year Count",
    "NCB",
    "Preferred",
  ];

  @override
  Widget build(BuildContext context) {
    final filterState = ref.watch(filterProvider);
    final filterNotifier = ref.read(filterProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Filter"),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(filterProvider.notifier).clearFilters();
            },
            child: const Text(
              "Clear Filters",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                /// LEFT CATEGORY LIST
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  color: Colors.blue,
                  child: ListView.builder(
                    itemCount: filterCategories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 12,
                          ),
                          color: selectedIndex == index
                              ? Colors.red
                              : Colors.blue,
                          child: Text(
                            filterCategories[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                /// RIGHT OPTIONS PANEL
                Expanded(
                  child: Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(12),
                    child: _buildRightPanel(filterState, filterNotifier),
                  ),
                ),
              ],
            ),
          ),

          /// BOTTOM BUTTONS
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Apply"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// TEMP RIGHT PANEL (Static UI for now)
  Widget _buildRightPanel(
    FilterState filterState,
    FilterNotifier filterNotifier,
  ) {
    String selectedCategory = filterCategories[selectedIndex];

    // PERIOD (Radio Buttons)
    if (selectedCategory == "Period") {
      List<String> months = _generateMonthList();

      return ListView(
        children: months.map((month) {
          return RadioListTile<String>(
            value: month,
            groupValue: filterState.period,
            onChanged: (value) {
              setState(() {
                filterNotifier.setPeriod(value!);
              });
            },
            title: Text(month),
          );
        }).toList(),
      );
    }
    // ZONE (Checkbox)
    else if (selectedCategory == "Zone") {
      return ListView(
        children: zoneList.map((zone) {
          return CheckboxListTile(
            value: filterState.zones.contains(zone),
            onChanged: (_) {
              filterNotifier.toggleZone(zone);
            },
            title: Text(zone),
          );
        }).toList(),
      );
    }
    // REGION (Checkbox)
    else if (selectedCategory == "Region") {
      return ListView(
        children: regionList.map((region) {
          return CheckboxListTile(
            value: filterState.regions.contains(region),
            onChanged: (_) {
              filterNotifier.toggleRegion(region);
            },
            title: Text(region),
          );
        }).toList(),
      );
    }
    // BRANCH (Radio Button)
    else if (selectedCategory == "Branch") {
      return ListView(
        children: branchList.map((branch) {
          return RadioListTile<String>(
            value: branch,
            groupValue: filterState.branch,
            onChanged: (value) {
              filterNotifier.setBranch(value!);
            },
            title: Text(branch),
          );
        }).toList(),
      );
    }
    // NO DATA AVAILABLE
    else {
      return const Center(
        child: Text(
          "No data available",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
  }

  List<String> _generateMonthList() {
    DateTime now = DateTime.now();
    List<String> months = [];

    for (int i = -2; i <= 2; i++) {
      DateTime date = DateTime(now.year, now.month + i);
      months.add("${_monthName(date.month)} ${date.year}");
    }

    return months;
  }

  String _monthName(int month) {
    const monthNames = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return monthNames[month - 1];
  }
}
