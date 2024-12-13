import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
            );
          }),
    );
  }
}
