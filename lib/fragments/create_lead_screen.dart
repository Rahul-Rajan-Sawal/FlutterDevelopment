import 'package:flutter/material.dart';

class CreateLeadScreen extends StatefulWidget {
  const CreateLeadScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CreateLeadScreenState();
}

class _CreateLeadScreenState extends State<CreateLeadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Cfeate Lead")));
  }
}
