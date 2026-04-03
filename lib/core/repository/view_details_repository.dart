import 'package:flutter_bottom_nav/database/database_helper.dart';

class ViewDetailsRepository {

  Future<Map<String, String>?> getBridgeCallTimes(String userId) async {
    try {
      final db = await DatabaseHelper.instance.database;

      final result = await db.query(
        'iUser',
        columns: [
          'BridgeCallToTime',
          'BridgeCallFromTime',
          'BridgeCallDownTime',
        ],
        where: 'UserId = ?',
        whereArgs: [userId],
       // limit: 1,
      );

      if (result.isNotEmpty) {
        final row = result.first;

        return {
          "BridgeCallToTime": row['BridgeCallToTime']?.toString() ?? "",
          "BridgeCallFromTime": row['BridgeCallFromTime']?.toString() ?? "",
          "BridgeCallDownTime": row['BridgeCallDownTime']?.toString() ?? "",
        };
      }

      return null;

    } catch (e) {
      print("ViewDetailsRepository ERROR: $e");
      return null;
    }
  }
}