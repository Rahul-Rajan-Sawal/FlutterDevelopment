import 'package:flutter_bottom_nav/common/common_util.dart';
import 'package:flutter_bottom_nav/database/database_helper.dart';

class LeadDetailsRepository {

  /// Fetch specific lead using WHERE condition
  static Future<Map<String, dynamic>?> fetchLeadDetailsById(
    String leadId, {
    List<String>? columnsToDecrypt,
  }) async {

    final db = await DatabaseHelper.instance.database;

    final rows = await db.query(
      "LeadDetails",
      where: "SrvcReqDtlCode = ?",
      whereArgs: [leadId],
    );

    if (rows.isEmpty) return null;

    final decryptedRows = _decryptRows({
      "rows": rows,
      "columns": columnsToDecrypt ??
          [
            "Name",
            "ProdName",
            "SrvcReqDtlCode",
          ]
    });

    return decryptedRows.first;
  }
}

/// Same decrypt logic reused
List<Map<String, dynamic>> _decryptRows(Map<String, dynamic> params) {

  final List<Map<String, dynamic>> rows =
      List<Map<String, dynamic>>.from(params["rows"]);

  final List<String> columns =
      List<String>.from(params["columns"]);

  return rows.map((row) {

    final Map<String, dynamic> decryptedRow = {};

    for (var key in row.keys) {

      decryptedRow[key] = columns.contains(key)
          ? CommonUtil.decryptIfNotEmpty(row[key])
          : row[key];

    }

    return decryptedRow;

  }).toList();
}