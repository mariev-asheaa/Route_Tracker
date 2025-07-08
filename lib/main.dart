import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:route_tracking/presentation/views/Google_Map_View.dart';

void main() async{
  await dotenv.load();
  runApp(const RouteTracker());
}

class RouteTracker extends StatelessWidget {
  const RouteTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(child: GoogleMapView()),
      ),
    );
  }
}
