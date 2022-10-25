import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';
class ServicePage extends StatelessWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSize.spaceX16),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppMenuTileCard(
          title: "Help-Line",
          onTap: () => AppRoute.push(context, const LaporKemalanganPage()),
          // onTap: () => showModalBottomSheet(
          //     context: context, builder: (context) => _BottomSlider()),
          icon: Icons.warning,
          iconColor: Colors.black,
        ),
        AppMenuTileCard(
          title: "Runner/Towing/Informer",
          onTap: () => {
            // AppRoute.push(context, const AduanRakyatPage())
          },
          icon: Icons.feedback,
          iconColor: Colors.black,
        ),
        AppMenuTileCard(
          title: "Temujanji",
          onTap: () => {
            // AppRoute.push(context, const TemujanjiPage())
          },
          icon: Icons.task,
          iconColor: Colors.black,
        ),

      ],
    );
  }
}
//
// class _BottomSlider extends StatelessWidget {
//   const _BottomSlider({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(40),
//             topLeft: Radius.circular(40),
//           ),
//         ),
//         height: MediaQuery.of(context).size.height * 0.9,
//         width: MediaQuery.of(context).size.width * 0.9,
//         child: Center(
//             child: Column(
//           children: [
//             Text('hi'),
//           ],
//         )),
//       ),
//     );
//   }
// }
