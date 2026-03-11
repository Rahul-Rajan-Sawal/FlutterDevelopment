import 'package:flutter/material.dart';

class LeadSummary extends StatefulWidget {
  final Map<String, dynamic> lead;

  const LeadSummary({Key? key, required this.lead}) : super(key: key);

  @override
  State<LeadSummary> createState() => _LeadSummaryState();
}

class _LeadSummaryState extends State<LeadSummary> {


  @override
  void initState() {
    super.initState();

    debugPrint("Lead Summary Loaded for leadId");
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
        title: const Text("Leads Summary"),
        elevation: 0,
         backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
         flexibleSpace: Container
         (
         decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF090979), 
            Color(0xFF00D4FF),                 
            ],
            ),
          ),
         ),
      ),





      body:SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(height:50),
                                    const Text(
                                      "Customer Detail",
                                      style: TextStyle(
                                        color: Color(0xFF17479E),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                   
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(
                                                vertical: 5),
                                        child: Text(
                                          "Customer Name",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                     Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(
                                                vertical: 5),
                                        child: Text(
                                          ": Rahul Sawal",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color:
                                                Color(0xFF17479E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(
                                                0, 8, 0, 5),
                                        child: Text(
                                          "Customer Type",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                     Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(
                                                0, 8, 0, 5),
                                        child: Text(
                                          ": Not Available",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color:
                                                Color(0xFF17479E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Customer Contact Number",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ": 89504938948",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "Customer Priority",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ": Premier",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                                ),                            
                              ],
                            ),
                          ),
            ),
            const SizedBox(height: 16),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(height:50),
                                    const Text(
                                      "Product Lead Detail",
                                      style: TextStyle(
                                        color: Color(0xFF17479E),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                   
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(
                                                vertical: 5),
                                        child: Text(
                                          "Line of Business",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                     Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(
                                                vertical: 5),
                                        child: Text(
                                          ": Motor",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color:
                                                Color(0xFF17479E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(
                                                0, 8, 0, 5),
                                        child: Text(
                                          "Product",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                     Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(
                                                0, 8, 0, 5),
                                        child: Text(
                                          ": HDFC ERGO Motor Insurance",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color:
                                                Color(0xFF17479E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Lead Type",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,5),
                                      child:Text(
                                        ": Contact",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Sale Type",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,5),
                                      child:Text(
                                        ": Not Available",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                                ),

                              Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Policy Number",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,5),
                                      child:Text(
                                        ": 642438736248264772",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),

                            Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Lead Amount",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,5),
                                      child:Text(
                                        ": 83749483.00",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),

                              Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Lead Owner",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,5),
                                      child:Text(
                                        ": 707(dvbbfbsd)",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),

                            Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Lead Assigned To",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,5),
                                      child:Text(
                                        ": Not Available",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),
                            Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Lead Channel",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,5),
                                      child:Text(
                                        ": Existing Customer/Renewal Data",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),
                            Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Lead Source",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,5),
                                      child:Text(
                                        ": Renewal Retention",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),
                            Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Lead Sub Source",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,5),
                                      child:Text(
                                        ": Apr 2026",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),
                            Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Lead Aging",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,5),
                                      child:Text(
                                        ": Created 2 week 5 days 8 hours,20 minutes ago.",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),


                              ],
                            ),
                          ),
            ),
            const SizedBox(height: 16),


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
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(height:50),
                                    const Text(
                                      "Other Details",
                                      style: TextStyle(
                                        color: Color(0xFF17479E),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                   
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(
                                                vertical: 5),
                                        child: Text(
                                          "Business Type",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                     Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(
                                                vertical: 5),
                                        child: Text(
                                          ": Renewal",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color:
                                                Color(0xFF17479E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(
                                                0, 8, 0, 5),
                                        child: Text(
                                          "Lead Rating",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      
                                    ),
                                     Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(
                                                0, 8, 0, 5),
                                        child: Text(
                                          ": Not Available",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color:
                                                Color(0xFF17479E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Breaking",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,5),
                                      child:Text(
                                        ": Not Available",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Previous policy Number",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,5),
                                      child:Text(
                                        ": 749856483892738467",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                                ),

                              Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,5),
                                        child:Text(
                                          "Website Quotes",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,5),
                                      child:Text(
                                        ": Not Available",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),
                          
                              ],
                            ),
                          ),
            ),
            const SizedBox(height: 16),
          ],
        )
      )
    );
  }
}
