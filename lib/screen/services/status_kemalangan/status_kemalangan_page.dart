import 'package:dfzagency/dfz.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class StatusKemalanganPage extends StatelessWidget {
  const StatusKemalanganPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppSecondaryBar(title: "Status Kemalangan", body: _Body());
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
  int upperBound = 3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconStepper(
            icons: [
              Icon(Icons.assignment),
              Icon(Icons.send),
              Icon(Icons.done),
              Icon(Icons.monetization_on_outlined),
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
            SizedBox(
              child: AppSubmitButton(
                title: 'Upload Report',
                onTap: ()=>_onSubmitted(context),
              ),
            ),
          if (activeStep == 1)
            AppTransactionCard(
              id: 'Report No. 89772',
              dateTime: '${DateTime.now()}',
              status: "1",
              title: "Waiting Approval..",
            ),
          if (activeStep == 2)
            AppTransactionCard(
              id: 'Report No. 89772',
              dateTime: '${DateTime.now()}',
              status: "2",
              title: "Insurances Approve",
            ),
          if (activeStep == 3)
            AppTransactionCard(
              id: 'Report No. 89772',
              dateTime: '${DateTime.now()}',
              status: "2",
              title: "Claim Successful..",
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

Future<void> _onSubmitted(BuildContext context) async {
  showDialog(
      context: context,
      builder: (_) {
        return Material(
          color: Colors.transparent,
          child: AppAlertDialog(
            alertDialogType: AlertDialogType.success,
            title: "Report Submission",
            subtitle: 'Report has been sent to DFZ Agency',
            description: "Report No. 89772",
            actionButtons: [
              ActionButton(
                label: 'Kembali',
                color: primaryColor,
                onTap: () => AppRoute.pop(context),
              ),
            ],
          ),
        );
      });
}