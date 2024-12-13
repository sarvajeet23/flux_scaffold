import 'package:example/modules/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flux_scaffold/flux_scaffold.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              CustomPageRoute(
                  page: DetailScreen(),
                  transitionStyle: TransitionStyle.zoomOut),
            );
          },
          child: Text('Go to Settings'),
        ),
      ),
    );
  }
}
