import 'package:example/main.dart';
import 'package:example/modules/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flux_scaffold/flux_scaffold.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              CustomPageRoute(
                  page: BookingScreen(),
                  transitionStyle: TransitionStyle.slide),
            );
          },
          child: Text('Go to Detail'),
        ),
      ),
    );
  }
}
