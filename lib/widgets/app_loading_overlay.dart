import 'package:flutter/material.dart';

import 'package:dfzagency/dfz.dart';


class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.heightScreen(context),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

