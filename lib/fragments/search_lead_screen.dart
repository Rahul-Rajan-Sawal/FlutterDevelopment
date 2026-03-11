import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav/Activities/searchedlead.dart';
import 'package:flutter_bottom_nav/common/common_util.dart';
import 'package:flutter_bottom_nav/core/apicall/getsearchdata.dart';
import 'package:flutter_bottom_nav/core/repository/lead_repository.dart';
import 'package:flutter_bottom_nav/core/static_variables.dart';
import 'package:flutter_bottom_nav/database/database_helper.dart';
import 'package:path/path.dart';
//import androidx.appcompat.app.AppCompatActivity;
import 'dart:convert';

import 'package:sqflite_sqlcipher/sqflite.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({Key? key}) : super(key: key);

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class SizeConfig {
  static late double screenHeight;
  static late double screenWidth;

  static void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }
}

class _SearchFragmentState extends State<SearchFragment> {
  final TextEditingController prosp1Crtl = TextEditingController();
  final TextEditingController PolNoCrtl = new TextEditingController();
  final TextEditingController MobNoCrtl = new TextEditingController();
  final TextEditingController PolEndDateFrm = new TextEditingController();
  final TextEditingController PolEndDateTo = new TextEditingController();

  String? LOB;
  String? AllProd;
  String? AllAgents;
  String? AllVerticalCode;

  List<String> dropdownData = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadDropdownData();
    checkTables();
  }

  Future<void> loadDropdownData() async {
    setState(() {
      dropdownData = [
        'Option 1',
        'Option 2',
        'Option 3',
        'Option 4',
        'Option 5',
      ];
      loading = false;
    });
  }

  //for date controlls
  Future<void> pickDate(
    BuildContext context,
    TextEditingController dtcontroller,
  ) async {
    DateTime? date = await showDatePicker(
      //this will open native date picker iin phone
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );

    if (date != null) {
      dtcontroller.text = "${date.day}-${date.month}-${date.year}";
    }
  }

  List<String> lobOptions = ["Life", "Health", "Motor", "General"];
  List<String> productOptions = ["Prod A", "Prod B", "Prod C"];
  List<String> agentOptions = ["Agent 1", "Agent 2", "Agent 3"];
  List<String> verticalOptions = ["V1", "V2", "V3"];

  void cleanForm() {
    prosp1Crtl.clear();
    PolNoCrtl.clear();
    MobNoCrtl.clear();
    PolEndDateFrm.clear();
    PolEndDateTo.clear();

    setState(() {
      LOB = null;
      AllProd = null;
      AllAgents = null;
      AllVerticalCode = null;
    });
  }

  void onSearch() {
    print("Lead/Prosp No  : ${prosp1Crtl.text}");
    print("Policy Number  : ${PolNoCrtl.text}");
    print("Mobile No      : ${MobNoCrtl.text} ");
    print("LOB Selected   : ${LOB} ");
    print("Prod Selected  : ${AllProd}");
    print("Agent Selected : ${AllAgents}");
    print("VerticalCode   : ${AllVerticalCode}");
    print("Start Date   : ${PolEndDateFrm}");
    print("End Date   : ${PolEndDateTo}");
  }

  //---------------------------
  //Api call save start
  Future<void> saveLeadFromApi(Map<String, dynamic> json) async {
    print("Db creating inserting function called here");
    final db = await DatabaseHelper.instance.database;

    String srvcReqCode = json["SrvcReqDtlCode"].toString();

    //test
    Map<String, dynamic> leadDetails = {
      "SrvcReqDtlCode": CommonUtil.encryptIfNotEmpty(srvcReqCode),
      "SrvcGrpCode": CommonUtil.encryptIfNotEmpty(
        json["SrvcGrpCode"]?.toString() ?? "",
      ),
      "CltCode": CommonUtil.encryptIfNotEmpty(
        json["CltCode"]?.toString() ?? "",
      ),
      "AgentCode": CommonUtil.encryptIfNotEmpty(
        json["AgentCode"]?.toString() ?? "",
      ),
      "UserId": CommonUtil.encryptIfNotEmpty(json["UserId"]?.toString() ?? ""),
      "ReqChannelId": CommonUtil.encryptIfNotEmpty(
        json["ReqChannelId"]?.toString() ?? "",
      ),
      "ReqChannel": CommonUtil.encryptIfNotEmpty(
        json["ReqChannel"]?.toString() ?? "",
      ),
      "LOBCode": CommonUtil.encryptIfNotEmpty(
        json["LOBCode"]?.toString() ?? "",
      ),
      "LOB": CommonUtil.encryptIfNotEmpty(json["LOB"]?.toString() ?? ""),
      "ProdCode": CommonUtil.encryptIfNotEmpty(
        json["ProdCode"]?.toString() ?? "",
      ),
      "ProdName": CommonUtil.encryptIfNotEmpty(
        json["ProdName"]?.toString() ?? "",
      ),
      "CRMStatus": CommonUtil.encryptIfNotEmpty(
        json["CRMStatus"]?.toString() ?? "",
      ),
      "LMSStatusDesc": CommonUtil.encryptIfNotEmpty(
        json["LMSStatusDesc"]?.toString() ?? "",
      ),
      "WFStatus": CommonUtil.encryptIfNotEmpty(
        json["WFStatus"]?.toString() ?? "",
      ),
      "WFStatDesc": CommonUtil.encryptIfNotEmpty(
        json["WFStatDesc"]?.toString() ?? "",
      ),
      "LeadSource": CommonUtil.encryptIfNotEmpty(
        json["LeadSource"]?.toString() ?? "",
      ),
      "LeadSourceDesc": CommonUtil.encryptIfNotEmpty(
        json["LeadSourceDesc"]?.toString() ?? "",
      ),
      "LeadSubSource": CommonUtil.encryptIfNotEmpty(
        json["LeadSubSource"]?.toString() ?? "",
      ),
      "LeadSubSourceDesc": CommonUtil.encryptIfNotEmpty(
        json["LeadSubSourceDesc"]?.toString() ?? "",
      ),
      "BusinessType": CommonUtil.encryptIfNotEmpty(
        json["BusinessType"]?.toString() ?? "",
      ),
      "BusinessTypeDesc": CommonUtil.encryptIfNotEmpty(
        json["BusinessTypeDesc"]?.toString() ?? "",
      ),
      "LeadQueue": CommonUtil.encryptIfNotEmpty(
        json["LeadQueue"]?.toString() ?? "",
      ),
      "LeadQueueDesc": CommonUtil.encryptIfNotEmpty(
        json["LeadQueueDesc"]?.toString() ?? "",
      ),
      "leadAmt": CommonUtil.encryptIfNotEmpty(
        json["leadAmt"]?.toString() ?? "",
      ),
      "TypeFlag": CommonUtil.encryptIfNotEmpty(
        json["TypeFlag"]?.toString() ?? "",
      ),
      "LeadTypeDesc": CommonUtil.encryptIfNotEmpty(
        json["LeadTypeDesc"]?.toString() ?? "",
      ),
      "LeadStatusCode": CommonUtil.encryptIfNotEmpty(
        json["LeadStatusCode"]?.toString() ?? "",
      ),
      "ActivityStatus": CommonUtil.encryptIfNotEmpty(
        json["ActivityStatus"]?.toString() ?? "",
      ),
      "CustPriority": CommonUtil.encryptIfNotEmpty(
        json["CustPriority"]?.toString() ?? "",
      ),
      "CustPriorityDesc": CommonUtil.encryptIfNotEmpty(
        json["CustPriorityDesc"]?.toString() ?? "",
      ),
      "SaleType": CommonUtil.encryptIfNotEmpty(
        json["SaleType"]?.toString() ?? "",
      ),
      "SaleTypeDesc": CommonUtil.encryptIfNotEmpty(
        json["SaleTypeDesc"]?.toString() ?? "",
      ),
      "CreatedBy": CommonUtil.encryptIfNotEmpty(
        json["CreatedBy"]?.toString() ?? "",
      ),
      "CreateDTim": CommonUtil.encryptIfNotEmpty(
        json["CreateDTim"]?.toString() ?? "",
      ),
      "UpdatedBy": CommonUtil.encryptIfNotEmpty(
        json["UpdatedBy"]?.toString() ?? "",
      ),
      "UpdateDTim": CommonUtil.encryptIfNotEmpty(
        json["UpdateDTim"]?.toString() ?? "",
      ),
      "Remark": CommonUtil.encryptIfNotEmpty(json["Remark"]?.toString() ?? ""),
      "ProposalNo": CommonUtil.encryptIfNotEmpty(
        json["ProposalNo"]?.toString() ?? "",
      ),
      "PolicyNo": CommonUtil.encryptIfNotEmpty(
        json["PolicyNo"]?.toString() ?? "",
      ),
      "PolicyStatus": CommonUtil.encryptIfNotEmpty(
        json["PolicyStatus"]?.toString() ?? "",
      ),
      "PolicyStartDate": CommonUtil.encryptIfNotEmpty(
        json["PolicyStartDate"]?.toString() ?? "",
      ),
      "PolicyEndDate": CommonUtil.encryptIfNotEmpty(
        json["PolicyEndDate"]?.toString() ?? "",
      ),
      "RegistrationNo": CommonUtil.encryptIfNotEmpty(
        json["RegistrationNo"]?.toString() ?? "",
      ),
      "Make": CommonUtil.encryptIfNotEmpty(json["Make"]?.toString() ?? ""),
      "Model": CommonUtil.encryptIfNotEmpty(json["Model"]?.toString() ?? ""),
      "Name": CommonUtil.encryptIfNotEmpty(json["Name"]?.toString() ?? ""),
      "MobileTel": CommonUtil.encryptIfNotEmpty(
        json["MobileTel"]?.toString() ?? "",
      ),
      "Email": CommonUtil.encryptIfNotEmpty(json["Email"]?.toString() ?? ""),
      "StateCode": CommonUtil.encryptIfNotEmpty(
        json["StateCode"]?.toString() ?? "",
      ),
      "PinCode": CommonUtil.encryptIfNotEmpty(
        json["PinCode"]?.toString() ?? "",
      ),
      "Zone": CommonUtil.encryptIfNotEmpty(json["Zone"]?.toString() ?? ""),
      "Region": CommonUtil.encryptIfNotEmpty(json["Region"]?.toString() ?? ""),
      "VehicleType": CommonUtil.encryptIfNotEmpty(
        json["VehicleType"]?.toString() ?? "",
      ),
      "FuelType": CommonUtil.encryptIfNotEmpty(
        json["FuelType"]?.toString() ?? "",
      ),
      "Amount": CommonUtil.encryptIfNotEmpty(json["Amount"]?.toString() ?? ""),
      //"SyncStatus": CommonUtil.encryptIfNotEmpty("0"),
    };

    //tbl 2
    Map<String, dynamic> activityTracker = {
      "CltCode": CommonUtil.encryptIfNotEmpty(
        json["CltCode"]?.toString() ?? "",
      ),
      "SrvcReqDtlCode": CommonUtil.encryptIfNotEmpty(srvcReqCode),
      "ActivityCode": CommonUtil.encryptIfNotEmpty(
        json["ActivityCode"]?.toString() ?? "",
      ),
      "SubActivityCode": CommonUtil.encryptIfNotEmpty(
        json["SubActivityCode"]?.toString() ?? "",
      ),
      "AppointmentDate": CommonUtil.encryptIfNotEmpty(
        json["AppointmentDate"]?.toString() ?? "",
      ),
      "Hour": CommonUtil.encryptIfNotEmpty(json["Hour"]?.toString() ?? ""),
      "Minute": CommonUtil.encryptIfNotEmpty(json["Minute"]?.toString() ?? ""),
      "AppointmentAddrss": CommonUtil.encryptIfNotEmpty(
        json["AppointmentAddrss"]?.toString() ?? "",
      ),
      "AppThrough": CommonUtil.encryptIfNotEmpty(
        json["AppThrough"]?.toString() ?? "",
      ),
      "ResThrough": CommonUtil.encryptIfNotEmpty(
        json["ResThrough"]?.toString() ?? "",
      ),
      "RescheduleDate": CommonUtil.encryptIfNotEmpty(
        json["RescheduleDate"]?.toString() ?? "",
      ),
      "RescheduleAddrss": CommonUtil.encryptIfNotEmpty(
        json["RescheduleAddrss"]?.toString() ?? "",
      ),
      "ParkedLead": CommonUtil.encryptIfNotEmpty(
        json["ParkedLead"]?.toString() ?? "",
      ),
      "ProposalNo": CommonUtil.encryptIfNotEmpty(
        json["ProposalNo"]?.toString() ?? "",
      ),
      "IssuedPolicyNo": CommonUtil.encryptIfNotEmpty(
        json["IssuedPolicyNo"]?.toString() ?? "",
      ),
      "PremiumCollected": CommonUtil.encryptIfNotEmpty(
        json["PremiumCollected"]?.toString() ?? "",
      ),
      "AppReason": CommonUtil.encryptIfNotEmpty(
        json["AppReason"]?.toString() ?? "",
      ),
      "SubReason": CommonUtil.encryptIfNotEmpty(
        json["SubReason"]?.toString() ?? "",
      ),
      "DuplicateLeadId": CommonUtil.encryptIfNotEmpty(
        json["DuplicateLeadId"]?.toString() ?? "",
      ),
      "ComptitorID": CommonUtil.encryptIfNotEmpty(
        json["ComptitorID"]?.toString() ?? "",
      ),
      "LocationDtls": CommonUtil.encryptIfNotEmpty(
        json["LocationDtls"]?.toString() ?? "",
      ),
      "NonContble": CommonUtil.encryptIfNotEmpty(
        json["NonContble"]?.toString() ?? "",
      ),
      "NotIntrest": CommonUtil.encryptIfNotEmpty(
        json["NotIntrest"]?.toString() ?? "",
      ),
      "PhoneNumber": CommonUtil.encryptIfNotEmpty(
        json["PhoneNumber"]?.toString() ?? "",
      ),
      "CreateBy": CommonUtil.encryptIfNotEmpty(
        json["CreateBy"]?.toString() ?? "",
      ),
      "CreateDTim": CommonUtil.encryptIfNotEmpty(
        json["CreateDTim"]?.toString() ?? "",
      ),
      "UpdateBy": CommonUtil.encryptIfNotEmpty(
        json["UpdateBy"]?.toString() ?? "",
      ),
      "UpdateDTim": CommonUtil.encryptIfNotEmpty(
        json["UpdateDTim"]?.toString() ?? "",
      ),
      "IsActive": CommonUtil.encryptIfNotEmpty(
        json["IsActive"]?.toString() ?? "",
      ),
      "oriPREMCOL": CommonUtil.encryptIfNotEmpty(
        json["oriPREMCOL"]?.toString() ?? "",
      ),
      "MakenModel": CommonUtil.encryptIfNotEmpty(
        json["MakenModel"]?.toString() ?? "",
      ),
      "ExpiryDate": CommonUtil.encryptIfNotEmpty(
        json["ExpiryDate"]?.toString() ?? "",
      ),
      "CallBackDate": CommonUtil.encryptIfNotEmpty(
        json["CallBackDate"]?.toString() ?? "",
      ),
      "TelesaleActivity": CommonUtil.encryptIfNotEmpty(
        json["TelesaleActivity"]?.toString() ?? "",
      ),
      "TelesaleActivityDate": CommonUtil.encryptIfNotEmpty(
        json["TelesaleActivityDate"]?.toString() ?? "",
      ),
      "InfectionID": CommonUtil.encryptIfNotEmpty(
        json["InfectionID"]?.toString() ?? "",
      ),
      "TicketNo": CommonUtil.encryptIfNotEmpty(
        json["TicketNo"]?.toString() ?? "",
      ),
      "QuoteNo": CommonUtil.encryptIfNotEmpty(
        json["QuoteNo"]?.toString() ?? "",
      ),
      "LcReason": CommonUtil.encryptIfNotEmpty(
        json["LcReason"]?.toString() ?? "",
      ),
      "LcSubReason": CommonUtil.encryptIfNotEmpty(
        json["LcSubReason"]?.toString() ?? "",
      ),
      "Age": CommonUtil.encryptIfNotEmpty(json["Age"]?.toString() ?? ""),
      "RtoLoc": CommonUtil.encryptIfNotEmpty(json["RtoLoc"]?.toString() ?? ""),
      "Price": CommonUtil.encryptIfNotEmpty(json["Price"]?.toString() ?? ""),
      "YOM": CommonUtil.encryptIfNotEmpty(json["YOM"]?.toString() ?? ""),
      "PED": CommonUtil.encryptIfNotEmpty(json["PED"]?.toString() ?? ""),
      "Feature": CommonUtil.encryptIfNotEmpty(
        json["Feature"]?.toString() ?? "",
      ),
      "Area": CommonUtil.encryptIfNotEmpty(json["Area"]?.toString() ?? ""),
      "PHC_NO": CommonUtil.encryptIfNotEmpty(json["PHC_NO"]?.toString() ?? ""),
      "ProductType": CommonUtil.encryptIfNotEmpty(
        json["ProductType"]?.toString() ?? "",
      ),
      "Lan": CommonUtil.encryptIfNotEmpty(json["Lan"]?.toString() ?? ""),
      "PostPQuery": CommonUtil.encryptIfNotEmpty(
        json["PostPQuery"]?.toString() ?? "",
      ),
      "NotEligible": CommonUtil.encryptIfNotEmpty(
        json["NotEligible"]?.toString() ?? "",
      ),
      "Reason": CommonUtil.encryptIfNotEmpty(json["Reason"]?.toString() ?? ""),
      "RsReason": CommonUtil.encryptIfNotEmpty(
        json["RsReason"]?.toString() ?? "",
      ),
      "ModelValue": CommonUtil.encryptIfNotEmpty(
        json["ModelValue"]?.toString() ?? "",
      ),
      "NonContactableDtm": CommonUtil.encryptIfNotEmpty(
        json["NonContactableDtm"]?.toString() ?? "",
      ),
      "CallBackDateRenewal": CommonUtil.encryptIfNotEmpty(
        json["CallBackDateRenewal"]?.toString() ?? "",
      ),
      "NonConRes": CommonUtil.encryptIfNotEmpty(
        json["NonConRes"]?.toString() ?? "",
      ),
      "ChequeNo": CommonUtil.encryptIfNotEmpty(
        json["ChequeNo"]?.toString() ?? "",
      ),
      "ChequeDate": CommonUtil.encryptIfNotEmpty(
        json["ChequeDate"]?.toString() ?? "",
      ),
      "ChequeBankName": CommonUtil.encryptIfNotEmpty(
        json["ChequeBankName"]?.toString() ?? "",
      ),
      "RegistrationNo": CommonUtil.encryptIfNotEmpty(
        json["RegistrationNo"]?.toString() ?? "",
      ),
      "RenewalLeadLostReason": CommonUtil.encryptIfNotEmpty(
        json["RenewalLeadLostReason"]?.toString() ?? "",
      ),
      "PolicyAlreadyRenewedReason": CommonUtil.encryptIfNotEmpty(
        json["PolicyAlreadyRenewedReason"]?.toString() ?? "",
      ),
      "ParkedLeadDateTime": CommonUtil.encryptIfNotEmpty(
        json["ParkedLeadDateTime"]?.toString() ?? "",
      ),
      "FollowupDt": CommonUtil.encryptIfNotEmpty(
        json["FollowupDt"]?.toString() ?? "",
      ),
      "QutationDt": CommonUtil.encryptIfNotEmpty(
        json["QutationDt"]?.toString() ?? "",
      ),
      "ddlAct16Subreason": CommonUtil.encryptIfNotEmpty(
        json["ddlAct16Subreason"]?.toString() ?? "",
      ),
      "txt416": CommonUtil.encryptIfNotEmpty(json["txt416"]?.toString() ?? ""),
      "txtAD16": CommonUtil.encryptIfNotEmpty(
        json["txtAD16"]?.toString() ?? "",
      ),
      "txtPN16": CommonUtil.encryptIfNotEmpty(
        json["txtPN16"]?.toString() ?? "",
      ),
      "txt316": CommonUtil.encryptIfNotEmpty(json["txt316"]?.toString() ?? ""),
      "ddlMakeModel516": CommonUtil.encryptIfNotEmpty(
        json["ddlMakeModel516"]?.toString() ?? "",
      ),
      "ddlModel616": CommonUtil.encryptIfNotEmpty(
        json["ddlModel616"]?.toString() ?? "",
      ),
      "txt716": CommonUtil.encryptIfNotEmpty(json["txt716"]?.toString() ?? ""),
      "txt816": CommonUtil.encryptIfNotEmpty(json["txt816"]?.toString() ?? ""),
      "ddlAppReasonTrack5": CommonUtil.encryptIfNotEmpty(
        json["ddlAppReasonTrack5"]?.toString() ?? "",
      ),
      "ddlSubReason": CommonUtil.encryptIfNotEmpty(
        json["ddlSubReason"]?.toString() ?? "",
      ),
      "txtDuplicateLeadId": CommonUtil.encryptIfNotEmpty(
        json["txtDuplicateLeadId"]?.toString() ?? "",
      ),
      "ddlCompetitorList": CommonUtil.encryptIfNotEmpty(
        json["ddlCompetitorList"]?.toString() ?? "",
      ),
      "txtLocationDtls": CommonUtil.encryptIfNotEmpty(
        json["txtLocationDtls"]?.toString() ?? "",
      ),
      "txtTctNoact5": CommonUtil.encryptIfNotEmpty(
        json["txtTctNoact5"]?.toString() ?? "",
      ),
      "txtAge": CommonUtil.encryptIfNotEmpty(json["txtAge"]?.toString() ?? ""),
      "txtArea2": CommonUtil.encryptIfNotEmpty(
        json["txtArea2"]?.toString() ?? "",
      ),
      "ddlRTOLoc": CommonUtil.encryptIfNotEmpty(
        json["ddlRTOLoc"]?.toString() ?? "",
      ),
      "txtPhcNo": CommonUtil.encryptIfNotEmpty(
        json["txtPhcNo"]?.toString() ?? "",
      ),
      "txtPrice": CommonUtil.encryptIfNotEmpty(
        json["txtPrice"]?.toString() ?? "",
      ),
      "txtPrdType": CommonUtil.encryptIfNotEmpty(
        json["txtPrdType"]?.toString() ?? "",
      ),
      "txtYOM": CommonUtil.encryptIfNotEmpty(json["txtYOM"]?.toString() ?? ""),
      "txtPed2": CommonUtil.encryptIfNotEmpty(
        json["txtPed2"]?.toString() ?? "",
      ),
      "txtLanguage": CommonUtil.encryptIfNotEmpty(
        json["txtLanguage"]?.toString() ?? "",
      ),
      "ddlMakeModelact5": CommonUtil.encryptIfNotEmpty(
        json["ddlMakeModelact5"]?.toString() ?? "",
      ),
      "txtReason5": CommonUtil.encryptIfNotEmpty(
        json["txtReason5"]?.toString() ?? "",
      ),
      "txtCallBakDateTime19": CommonUtil.encryptIfNotEmpty(
        json["txtCallBakDateTime19"]?.toString() ?? "",
      ),
      "txtPN19": CommonUtil.encryptIfNotEmpty(
        json["txtPN19"]?.toString() ?? "",
      ),
      "txt319": CommonUtil.encryptIfNotEmpty(json["txt319"]?.toString() ?? ""),
      "txtRMSAppointmentDate": CommonUtil.encryptIfNotEmpty(
        json["txtRMSAppointmentDate"]?.toString() ?? "",
      ),
      "txtRMSCallBackDate": CommonUtil.encryptIfNotEmpty(
        json["txtRMSCallBackDate"]?.toString() ?? "",
      ),
      "ddlRMSNonContactableReason": CommonUtil.encryptIfNotEmpty(
        json["ddlRMSNonContactableReason"]?.toString() ?? "",
      ),
      "txtRMSChequeNo": CommonUtil.encryptIfNotEmpty(
        json["txtRMSChequeNo"]?.toString() ?? "",
      ),
      "ddlRMSRenewalLeadLostReason": CommonUtil.encryptIfNotEmpty(
        json["ddlRMSRenewalLeadLostReason"]?.toString() ?? "",
      ),
      "ddlRMSPolicyAlreadyRenewedReason": CommonUtil.encryptIfNotEmpty(
        json["ddlRMSPolicyAlreadyRenewedReason"]?.toString() ?? "",
      ),
      "txtRMSMobileNo": CommonUtil.encryptIfNotEmpty(
        json["txtRMSMobileNo"]?.toString() ?? "",
      ),
      "txtAppointmentDate27": CommonUtil.encryptIfNotEmpty(
        json["txtAppointmentDate27"]?.toString() ?? "",
      ),
      "txtRescheduletDate28": CommonUtil.encryptIfNotEmpty(
        json["txtRescheduletDate28"]?.toString() ?? "",
      ),
      "ddlAppReasonTrack29": CommonUtil.encryptIfNotEmpty(
        json["ddlAppReasonTrack29"]?.toString() ?? "",
      ),
      "txtPolicyNo30": CommonUtil.encryptIfNotEmpty(
        json["txtPolicyNo30"]?.toString() ?? "",
      ),
      "txtParkedLead31": CommonUtil.encryptIfNotEmpty(
        json["txtParkedLead31"]?.toString() ?? "",
      ),
      "txtFollowup32": CommonUtil.encryptIfNotEmpty(
        json["txtFollowup32"]?.toString() ?? "",
      ),
      "txtQutation33": CommonUtil.encryptIfNotEmpty(
        json["txtQutation33"]?.toString() ?? "",
      ),
      "nInstrumentType": CommonUtil.encryptIfNotEmpty(
        json["nInstrumentType"]?.toString() ?? "",
      ),
      "nLcPolicyNumber": CommonUtil.encryptIfNotEmpty(
        json["nLcPolicyNumber"]?.toString() ?? "",
      ),
      "nScPolicyNumber": CommonUtil.encryptIfNotEmpty(
        json["nScPolicyNumber"]?.toString() ?? "",
      ),
      "nScInstrumentNo": CommonUtil.encryptIfNotEmpty(
        json["nScInstrumentNo"]?.toString() ?? "",
      ),
      "nScInstrumentAmt": CommonUtil.encryptIfNotEmpty(
        json["nScInstrumentAmt"]?.toString() ?? "",
      ),
      "nCallBackDate": CommonUtil.encryptIfNotEmpty(
        json["nCallBackDate"]?.toString() ?? "",
      ),
      "nExpectedClosureDate": CommonUtil.encryptIfNotEmpty(
        json["nExpectedClosureDate"]?.toString() ?? "",
      ),
      "nLostCompDueTo": CommonUtil.encryptIfNotEmpty(
        json["nLostCompDueTo"]?.toString() ?? "",
      ),
      "nLlPolicyNoCompetition": CommonUtil.encryptIfNotEmpty(
        json["nLlPolicyNoCompetition"]?.toString() ?? "",
      ),
      "nCmpNameCompetition": CommonUtil.encryptIfNotEmpty(
        json["nCmpNameCompetition"]?.toString() ?? "",
      ),
      "nNewPolEndDate": CommonUtil.encryptIfNotEmpty(
        json["nNewPolEndDate"]?.toString() ?? "",
      ),
      "internalcomment": CommonUtil.encryptIfNotEmpty(
        json["internalcomment"]?.toString() ?? "",
      ),
      "SyncStatus": CommonUtil.encryptIfNotEmpty(
        json["SyncStatus"]?.toString() ?? "0",
      ),
      "InstType": CommonUtil.encryptIfNotEmpty(
        json["InstType"]?.toString() ?? "",
      ),
      "LstComDueTo": CommonUtil.encryptIfNotEmpty(
        json["LstComDueTo"]?.toString() ?? "",
      ),
      "NewPolEndDate": CommonUtil.encryptIfNotEmpty(
        json["NewPolEndDate"]?.toString() ?? "",
      ),
      "Remark": CommonUtil.encryptIfNotEmpty(json["Remark"]?.toString() ?? ""),
      "TempSrvcReqDtlCode": CommonUtil.encryptIfNotEmpty(
        json["TempSrvcReqDtlCode"]?.toString() ?? "",
      ),
    };

    print("Saving Lead: ${json["SrvcReqDtlCode"]}");

    // LeadDetails
    await db.insert(
      "LeadDetails",
      leadDetails,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("Saving Lead: ${json["SrvcReqDtlCode"]}");

    try {
      await db.insert(
        "LMSLeadActivityTracker",
        activityTracker,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Error 2nd insertion : $e");
    } // LMSLeadActivityTracker

    print("records inserted into LMSLEADACTIVITY table");
    print("Db creating inserting function called here");
  }

  //Api call save end
  //--------------------------
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // initialize once

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            buildTextField(prosp1Crtl, "Lead / Prosp Number"),
            const SizedBox(height: 15),
            buildTextField(PolNoCrtl, "Policy Number "),
            const SizedBox(height: 10),
            buildTextField(MobNoCrtl, "Mobile Number "),
            const SizedBox(height: 10),
            buildDropdown("LOB", LOB, (v) => setState(() => LOB = v)),
            const SizedBox(height: 10),
            buildDropdown(
              "All Products",
              AllProd,
              (v) => setState(() => AllProd = v),
            ),
            const SizedBox(height: 10),
            buildDropdown(
              "All Agents",
              AllAgents,
              (v) => setState(() => AllAgents = v),
            ),
            const SizedBox(height: 10),
            buildDropdown(
              "All Vertical Code",
              AllVerticalCode,
              (v) => setState(() => AllVerticalCode = v),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: cleanForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(color: Colors.blue[400]),
                      elevation: 4,
                    ),
                    child: const Text("Clear"),
                  ),
                ),
                const SizedBox(width: 15),
                const SizedBox(height: 25),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(color: Colors.white),
                      elevation: 4,
                    ),
                    onPressed: () async {
                      // Show a loading popup
                      CommonUtil.show(
                        context,
                        message: "Searching Leads On Server. Please wait..",
                      );

                      // Initialize the list outside try so it can be used later
                      List<Map<String, dynamic>> decryptedLeads = [];

                      try {
                        // Fetch leads data from API
                        final response = await GetSearchData.getdata(
                          SAPCode: StaticVariables.mSAPCode,
                        );

                        // Pretty print the JSON for debugging
                        final prettyJson = const JsonEncoder.withIndent(
                          '  ',
                        ).convert(response);
                        print(prettyJson);

                        // Get the lead list from the response
                        List leads = response["Table"];

                        // Loop through each lead and save it to SQLite
                        for (var lead in leads) {
                          await saveLeadFromApi(lead);
                          print(
                            "Lead ${lead["SrvcReqDtlCode"]} saved successfully",
                          );
                        }

                        // Fetch decrypted leads for the next screen
                        decryptedLeads =
                            await LeadRepository.fetchDecryptedLeads(
                              columnsToDecrypt: [
                                "Name",
                                "ProdName",
                                "SrvcReqDtlCode",
                                "leadAmt",
                              ],
                            );
                      } catch (e) {
                        // Show an error message if something goes wrong
                        CommonUtil.show(
                          context,
                          message: "Unable To Fetch data...",
                        );
                        print("Error fetching leads: $e");
                      } finally {
                        // Hide the loader in any case
                        CommonUtil.hide(context);
                      }

                      // Navigate to SearchedLead screen with the decrypted leads
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchedLead(leadList: decryptedLeads),
                        ),
                      );
                    },
                    child: const Text("Search"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            buildDateField(context, "Policy End Date From", PolEndDateFrm),
            const SizedBox(height: 10),
            buildDateField(context, "Policy End Date To", PolEndDateTo),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: cleanForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(color: Colors.blue[400]),
                      elevation: 4,
                    ),
                    child: const Text("Clear"),
                  ),
                ),
                const SizedBox(width: 15),
                const SizedBox(height: 25),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(color: Colors.white),
                      elevation: 4,
                    ),
                    onPressed: () async {
                      // Show a loading popup
                      CommonUtil.show(
                        context,
                        message: "Searching Leads On Server. Please wait..",
                      );

                      // Initialize the list outside try so it can be used later
                      List<Map<String, dynamic>> decryptedLeads = [];

                      try {
                        // Fetch leads data from API
                        final response = await GetSearchData.getdata(
                          SAPCode: StaticVariables.mSAPCode,
                        );

                        // Pretty print the JSON for debugging
                        final prettyJson = const JsonEncoder.withIndent(
                          '  ',
                        ).convert(response);
                        print(prettyJson);

                        // Get the lead list from the response
                        List leads = response["Table"];

                        // Loop through each lead and save it to SQLite
                        for (var lead in leads) {
                          await saveLeadFromApi(lead);
                          print(
                            "Lead ${lead["SrvcReqDtlCode"]} saved successfully",
                          );
                        }

                        // Fetch decrypted leads for the next screen
                        decryptedLeads =
                            await LeadRepository.fetchDecryptedLeads(
                              columnsToDecrypt: [
                                "Name",
                                "ProdName",
                                "SrvcReqDtlCode",
                                "leadAmt",
                              ],
                            );
                      } catch (e) {
                        // Show an error message if something goes wrong
                        CommonUtil.show(
                          context,
                          message: "Unable To Fetch data...",
                        );
                        print("Error fetching leads: $e");
                      } finally {
                        // Hide the loader in any case
                        CommonUtil.hide(context);
                      }

                      // Navigate to SearchedLead screen with the decrypted leads
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchedLead(leadList: decryptedLeads),
                        ),
                      );
                    },
                    child: const Text("Search"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String labelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        elevation: 4,
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.05,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding: const EdgeInsets.fromLTRB(14, 20, 14, 16),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }

  //----------------
  Widget buildDropdown(
    String labelText,
    String? value,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        elevation: 4,
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.05,
          child: DropdownButtonFormField<String>(
            value: value,
            isExpanded: true,
            isDense: true,
            items: dropdownData
                .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                .toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: labelText,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.fromLTRB(12, 18, 12, 14),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDateField(
    BuildContext context,
    String labelText,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        elevation: 4,
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.05,
          child: TextField(
            controller: controller,
            readOnly: true,
            onTap: () => pickDate(context, controller),
            decoration: InputDecoration(
              hintText: labelText,
              suffixIcon: const Icon(Icons.calendar_today),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.fromLTRB(14, 16, 14, 14),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkTables() async {
    final db = await DatabaseHelper.instance.database;

    var tables = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table'",
    );

    print("TABLES IN DATABASE = $tables");
  }
}
