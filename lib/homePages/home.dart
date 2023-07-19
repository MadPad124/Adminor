import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        primary: false,
        shadowColor: Colors.green,
        automaticallyImplyLeading: false,
        elevation: 1,
        toolbarHeight: 0,
        actions: [],
      ),
      body: Container(
        child: Center(
          child: Text('HomePage'),
        ),
      ),
    );
  }
}
