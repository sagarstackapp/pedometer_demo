import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class PedometerHome extends StatefulWidget {
  @override
  PedometerHomeState createState() => PedometerHomeState();
}

class PedometerHomeState extends State<PedometerHome> {
  Stream<StepCount> streamStepCount;
  Stream<PedestrianStatus> streamPedestrianStatus;
  String todaySteps = 'Null';
  String pedestrianStatus = 'Null';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startCountingStep();
  }

  void startCountingStep() {
    streamPedestrianStatus = Pedometer.pedestrianStatusStream;
    streamPedestrianStatus.listen((event) {
      setState(() {
        pedestrianStatus = event.status;
      });
    }).onError((event) {
      setState(() {
        pedestrianStatus = 'Pedestrian Status not available';
      });
    });

    streamStepCount = Pedometer.stepCountStream;
    streamStepCount.listen((event) {
      setState(() {
        todaySteps = event.steps.toString();
      });
    }).onError((event) {
      setState(() {
        todaySteps = 'Step Count not available';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Current screen --> $runtimeType');
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Row(
              children: [
                Text('Steps : '),
                Text(todaySteps),
              ],
            ),
            Row(
              children: [
                Text('Status : '),
                Text(pedestrianStatus),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
