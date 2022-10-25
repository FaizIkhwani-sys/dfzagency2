import 'package:dfzagency/dfz.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class StatusRepairPage extends StatelessWidget {
  const StatusRepairPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppSecondaryBar(title: "Status Repair", body: _Body());
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  int activeStep = 0;
  // Initial step set to 5.
  int upperBound = 2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconStepper(
            icons: [
              Icon(Icons.car_crash),
              Icon(Icons.car_repair),
              Icon(Icons.done),
            ],
            activeStepColor: activeStep == 0
                ? primaryColor
                : activeStep == 1
                    ? Colors.amber
                    : Colors.green,

            // activeStep property set to activeStep variable defined above.
            activeStep: activeStep,

            // This ensures step-tapping updates the activeStep.
            onStepReached: (index) {
              setState(() {
                activeStep = index;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          if (activeStep == 0)
            AppTransactionCard(
              id: 'PKB 4338 - Lamboghini Galardo',
              dateTime: '${DateTime.now()}',
              status: "0",
              title: "Waiting...",
            ),
          if (activeStep == 1)
            AppTransactionCard(
              id: 'PKB 4338 - Lamboghini Galardo',
              dateTime: '${DateTime.now()}',
              status: "1",
              title: "Repair In Progress..",
            ),
          if (activeStep == 2)
            AppTransactionCard(
              id: 'PKB 4338 - Lamboghini Galardo',
              dateTime: '${DateTime.now()}',
              status: "2",
              title: "Repair Complete...",
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // previousButton(),
              // nextButton(),
            ],
          ),
        ],
      ),
    );
  }
}
