import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';
import 'package:permission_handler/permission_handler.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashPageState(),
      child: const Scaffold(
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {

  @override
  void initState() {
   final state= context.read<SplashPageState>();
   state.initApp(context);
   
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<SplashPageState>(
      builder: (context, state, child) {
        return Center(
          child: Container(
            height: AppSize.heightScreen(context),
            width: AppSize.widthScreen(context),
            decoration: const BoxDecoration(
              color: Color(0xFF050708),
              image: DecorationImage(
                image: AssetImage('assets/images/dfz_logo.png'),
                // fit: BoxFit.,
              ),
            ),
          ),
        );
      },
    );
  }
}
