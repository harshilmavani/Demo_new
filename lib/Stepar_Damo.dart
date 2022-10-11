import 'package:flutter/material.dart';

class SteparDamo extends StatefulWidget {
  const SteparDamo({Key? key}) : super(key: key);

  @override
  State<SteparDamo> createState() => _SteparDamoState();
}

class _SteparDamoState extends State<SteparDamo> {
  List isExpandedList = [
    true,
    false,
    false,
  ];
  int currentActiveState = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        currentStep: currentActiveState,
        steps: [
          Step(
            title: Text('title'),
            content: Text('content'),
            isActive: currentActiveState == 0,
            state: currentActiveState < 0
                ? StepState.disabled
                : currentActiveState == 0
                    ? StepState.indexed
                    : StepState.complete,
          ),
          Step(
            title: Text('title1'),
            content: Text('content1'),
            isActive: currentActiveState == 1,
            state: currentActiveState < 1
                ? StepState.disabled
                : currentActiveState == 1
                    ? StepState.indexed
                    : StepState.complete,
          ),
          Step(
            title: Text('title2'),
            content: Text('content2'),
            isActive: currentActiveState == 2,
            state: currentActiveState < 2
                ? StepState.disabled
                : currentActiveState == 2
                    ? StepState.indexed
                    : StepState.complete,
          ),
        ],
        onStepTapped: (index) {
          setState(() {
            currentActiveState = index;
          });
        },
        onStepContinue: () {
          setState(() {
            if (currentActiveState < 2) {
              currentActiveState++;
            }
          });
        },
        onStepCancel: () {
          if (currentActiveState > 0) {
            currentActiveState--;
          }
        },
      ),
    );
  }
}
