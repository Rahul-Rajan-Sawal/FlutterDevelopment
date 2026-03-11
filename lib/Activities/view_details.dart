import 'package:flutter/material.dart';

class ViewDetails extends StatefulWidget {
  final Map<String, dynamic> lead;
  const ViewDetails({Key? key, required this.lead}) : super(key: key);

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  late String leadId;
  late String leadValue;
  late String name;
  late String policyName;
  late String premium;
  late String vehicleMakeModel;
  late String ncb;
  late String addOn;
  late String activityStatus;
  late String activityDoneBy;
  late String activityDate;
  late String remark;
  late String tremark;
  late String emailId;
  late String mobilenumber;
  late String leadType;
  late String policyNumber;
  late String workflowStatus;
  late String leadStatus;
  late String activity;
  late String renewalNotice;

  @override
  void initState() {
    super.initState();

    leadId = widget.lead['leadId'] ?? 'Error loading lead Id';
    leadValue = "₹${widget.lead['leadAmount'] ?? 0}";
    name = widget.lead['name'] ?? '';
    policyName = widget.lead['policyName'] ?? '';
    premium = widget.lead['premium']?.toString() ?? '0';
    vehicleMakeModel = widget.lead['vehiclemakemodel'] ?? '';
    ncb = widget.lead['ncb'] ?? '';
    addOn = widget.lead['addon'] ?? '';
    activityStatus = widget.lead['activitystatus'] ?? '';
    activityDoneBy = widget.lead['activitydoneby'] ?? '';
    activityDate = widget.lead['activitydate'] ?? '';
    remark = widget.lead['remark'] ?? '';
    tremark = widget.lead['tremark'] ?? '';
    policyNumber = widget.lead['policynumber'] ?? '';
    leadType = widget.lead['leadtype'] ?? '';
    leadStatus = widget.lead['leadstatus'] ?? '';
    workflowStatus = widget.lead['workflowstatus'] ?? '';
    activity = widget.lead['activity'] ?? '';
    emailId = widget.lead['emailid'] ?? '';
    mobilenumber = widget.lead['mobilenumber'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.blue[400],
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double top = constraints.biggest.height;
                bool isCollapsed = top <= kToolbarHeight + 20;

                return FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: const EdgeInsets.only(left: 56, bottom: 16),
                  title: const Text(
                    "Lead ID: LD12345",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  background: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF00D4FF),
                              Color(0xFF090979),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: top > kToolbarHeight + 20 ? 1.0 : 0.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.person,
                                  size: 50, color: Colors.white),
                              const SizedBox(height: 8),
                              Text(
                                "$name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "$leadType",
                                style: TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: const [
                                      Icon(Icons.call,
                                          color: Colors.white, size: 28),
                                      SizedBox(height: 4),
                                      Text("Call",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12)),
                                    ],
                                  ),
                                  const SizedBox(width: 32),
                                  Column(
                                    children: const [
                                      Icon(Icons.message,
                                          color: Colors.white, size: 28),
                                      SizedBox(height: 4),
                                      Text("Message",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12)),
                                    ],
                                  ),
                                  const SizedBox(width: 32),
                                  Column(
                                    children: const [
                                      Icon(Icons.email,
                                          color: Colors.white, size: 28),
                                      SizedBox(height: 4),
                                      Text("Email",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 200),
                                opacity: isCollapsed ? 1.0 : 0.0,
                                child: Column(
                                  children: [
                                    Text(
                                      leadId,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      leadValue,
                                      style: const TextStyle(
                                          color: Colors.white70, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          /// 🔽 SCROLL CONTENT
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Contact Details",
                                style: TextStyle(
                                  color: Color(0xFF17479E),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                iconSize: 25,
                                onPressed: () {
                                  print("Icon Clicked");
                                },
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      child: const Text(
                                        "Mobile Number",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      child: Text(
                                        ": $mobilenumber",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF17479E),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 8, 0, 15),
                                      child: const Text(
                                        "Email Id",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                      child: Text(
                                        ":$emailId",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF17479E),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // CARD 2
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Last Activity",
                                style: TextStyle(
                                  color: Color(0xFF17479E),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                iconSize: 25,
                                onPressed: () {
                                  print("icon edit card 2 tapped");
                                },
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "Activity Status",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    ": $activityStatus",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    "Remark",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    ": $remark",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // CARD 3
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Lead Detail",
                                style: TextStyle(
                                  color: Color(0xFF17479E),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.note),
                                iconSize: 25,
                                onPressed: () {
                                  print("icon edit card 2 tapped");
                                },
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "Product",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    ": $policyName",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    "Policy Number",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    ": $policyNumber",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    "Lead Type",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                child: Text(": $leadType",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    )),
                              ))
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    "Premium",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                child: Text(": $premium",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    )),
                              ))
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    "Vehicle Make & Model",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                child: Text(": $vehicleMakeModel",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    )),
                              ))
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    "NCB",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                child: Text(": $ncb",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    )),
                              ))
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    "Add-On",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                child: Text(": $addOn",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    )),
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  //Card 4
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 50),
                              const Text(
                                "Telesales Disposition",
                                style: TextStyle(
                                  color: Color(0xFF17479E),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "Activity",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    ": $activityStatus",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    "Activity Done By",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    ": $activityDoneBy",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    "Activity Date",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                child: Text(": $activityDate",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    )),
                              ))
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    "Remark",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                child: Text(": $tremark",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    )),
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  //Card 5
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 50),
                              const Text(
                                "Lead Status",
                                style: TextStyle(
                                  color: Color(0xFF17479E),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "Lead Status",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    ": $leadStatus",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    "Work Flow Status",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                  child: Text(
                                    ": $workflowStatus",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF17479E),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),

                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          const SizedBox(height: 8),
                          //iconss
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text("Renewal Notice",
                                    style: TextStyle(
                                      color: Color(0xFF17479E),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ]),
                          const SizedBox(height: 5),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(children: [
                                  IconButton(
                                    icon: const Icon(Icons.send),
                                    iconSize: 30,
                                    onPressed: () {
                                      print("icon edit card 2 tapped");
                                    },
                                  ),
                                  Text("Mail"),
                                ]),
                                Column(children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_red_eye),
                                    iconSize: 30,
                                    onPressed: () {
                                      print("icon edit card 2 tapped");
                                    },
                                  ),
                                  Text("View"),
                                ]),
                                Column(children: [
                                  IconButton(
                                    icon: const Icon(Icons.share),
                                    iconSize: 30,
                                    onPressed: () {
                                      print("icon edit card 2 tapped");
                                    },
                                  ),
                                  Text("Share"),
                                ]),
                              ]),

                          const SizedBox(height: 8),
                          const Divider(color: Colors.grey, thickness: 1),

                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Log",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF17479E),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text("Date & Time"), Text("Mode")]),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
