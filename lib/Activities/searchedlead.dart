import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav/Activities/lead_summary.dart';
import 'package:flutter_bottom_nav/Activities/lead_update_activity.dart';
import 'package:flutter_bottom_nav/Activities/view_details.dart';

class SearchedLead extends StatefulWidget {
  final List<Map<String, dynamic>> leadList;

  const SearchedLead({Key? key, required this.leadList}) : super(key: key);

  @override
  State<SearchedLead> createState() => _SearchedLeadState();
}

class _SearchedLeadState extends State<SearchedLead> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Searched Leads"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF090979), // same dark blue
                Color(0xFF00D4FF), // same cyan
              ],
            ),
          ),
        ),
      ),
      body: widget.leadList.isEmpty
          ? const Center(child: Text("No records found"))
          : ListView.builder(
              itemCount: widget.leadList.length,
              itemBuilder: (context, index) {
                final lead = widget.leadList[index];
                // Print raw DB values
                print("Raw Lead: $lead");

                // Decrypt only the fields you want to show
                // final name = CommonUtil.decryptIfNotEmpty(lead['Name'] ?? '');
                // final prodName =
                //     CommonUtil.decryptIfNotEmpty(lead['ProdName'] ?? '');
                // final leadId =
                //     CommonUtil.decryptIfNotEmpty(lead['SrvcReqDtlCode'] ?? '');
                // final leadAmt =
                //     CommonUtil.decryptIfNotEmpty(lead['leadAmt'] ?? '');
                final name = lead['Name'] ?? '';
                final prodName = lead['ProdName'] ?? '';
                final leadId = lead['SrvcReqDtlCode'] ?? '';
                final leadAmt = lead['leadAmt'] ?? '';

                print("Decrypted names found : " + name);
                print("Decrypted Product Name Found : " + prodName);
                print("Decrypted Product leadId Found : " + leadId);
                print("Decrypted Product Lead Amount Found : " + leadAmt);

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF090979), Color(0xFF00D4FF)],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // --------- Name Row ---------
                            Text(
                              name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),

                            // --------- Row: Policy Name + Lead Info ---------
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Column 1 → Policy Name
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    prodName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                //const SizedBox(width: 10),

                                // Column 2 → Label + Value Columns
                                Container(
                                  //flex: 2,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // LABEL COLUMN
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Lead ID",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Lead Amount",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(width: 12),

                                      // VALUE COLUMN
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            leadId,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "₹${leadAmt}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: screenHeight * 0.08,
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.post_add,
                                    color: Colors.grey[700],
                                    size: 33,
                                  ),
                                  onPressed: () => _onUpdateActivity(lead),
                                ),
                                const Text(
                                  "Update Activity",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.article,
                                    color: Colors.grey[700],
                                    size: 33,
                                  ),
                                  onPressed: () => _onViewSummary(lead),
                                ),
                                const Text(
                                  "View Summary",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.grey[700],
                                    size: 33,
                                  ),
                                  onPressed: () => _onViewDetails(lead),
                                ),
                                const Text(
                                  "View Details",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  void _onUpdateActivity(Map<String, dynamic> lead) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LeadUpdate(lead: lead)),
    );
    print("Update Activity clicked for ${lead['leadId']}");
  }

  void _onViewSummary(Map<String, dynamic> lead) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LeadSummary(lead: lead)),
    );

    print("View Summary clicked for ${lead['leadId']}");
  }

  void _onViewDetails(Map<String, dynamic> lead) {
    print("View Details clicked for ${lead['leadId']}");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewDetails(lead: lead)),
    );
  }
}
