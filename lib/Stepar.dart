import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stepar extends StatefulWidget {
  const Stepar({Key? key}) : super(key: key);

  @override
  State<Stepar> createState() => _DemoState();
}

class _DemoState extends State<Stepar> {
  List isExpandedList = [
    true,
    false,
    false,
  ];
  int currentActiveState = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
            subtitle: Text('Subtitle'),
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
          setState(() {
            if (currentActiveState > 0) {
              currentActiveState--;
            }
          });
        },
      ),
      // body: Column(
      //   children: [
      //     SizedBox(height: 100),
      //     ExpansionPanelList(
      //       children: List.generate(
      //         isExpandedList.length,
      //         (index) => ExpansionPanel(
      //           isExpanded: isExpandedList[index],
      //           headerBuilder: (context, isExpanded) {
      //             return Container(
      //               color: Colors.red,
      //             );
      //           },
      //           body: Container(
      //             color: Colors.green,
      //             height: 300,
      //           ),
      //         ),
      //       ),
      //       expansionCallback: (index, isExpanded) {
      //         print(index);
      //         print(isExpanded);
      //         setState(() {
      //           isExpandedList[index] = !isExpanded;
      //         });
      //       },
      //     ),
      //   ],
      // ),
      // body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       expandedHeight: 200,
      //       pinned: true,
      //       floating: false,
      //       collapsedHeight: 100,
      //     ),
      //     SliverList(
      //       delegate: SliverChildListDelegate.fixed(
      //         [],
      //       ),
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.grey,
              content: Text('Romin'),
              duration: Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
