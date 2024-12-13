import 'package:example/modules/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flux_scaffold/flux_scaffold.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help')),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            CustomPageRoute(
                page: SettingsScreen(), transitionStyle: TransitionStyle.slide),
          );
        },
        child: Text('Go to Details'),
      )),
    );
  }
}
