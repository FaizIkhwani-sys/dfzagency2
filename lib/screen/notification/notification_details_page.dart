// import 'package:flutter/material.dart';
// import 'package:dfzagency/dfz.dart';
// import 'package:intl/intl.dart';
//
// class NotificationDetailsPage extends StatelessWidget {
//   final String? idNotification;
//
//   const NotificationDetailsPage({this.idNotification, Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (BuildContext context) => NotificationState(),
//       child: AppSecondaryBar(
//         title: 'Maklumat Notifikasi',
//         body: _Body(
//           idNotification: idNotification,
//         ),
//       ),
//     );
//   }
// }
//
// class _Body extends StatefulWidget {
//   final String? idNotification;
//
//   const _Body({this.idNotification, Key? key}) : super(key: key);
//
//   @override
//   State<_Body> createState() => _BodyState();
// }
//
// class _BodyState extends State<_Body> {
//   @override
//   void initState() {
//     super.initState();
//     // context
//     //     .read<NotificationState>()
//     //     .getNotificationbyId(widget.idNotification!);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<NotificationState>(
//       builder: (_, state, __) {
//         return state.isLoading
//             ? AppLoadingOverlay()
//             : const SingleChildScrollView(
//                 padding: EdgeInsets.all(16.0),
//                 child: _Content(),
//               );
//       },
//     );
//   }
// }
//
// class _Content extends StatelessWidget {
//   const _Content({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<NotificationState>(
//       builder: (_, state, __) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: const [
//             _Date(),
//             SizedBox(height: 16.0),
//             _Title(),
//             SizedBox(height: 8.0),
//             _Description(),
//             SizedBox(height: 8.0),
//             // state.notification![0].image == '' ||
//             //         state.notification![0].image == null
//             //     ? Container()
//             //     : _Image(),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class _Date extends StatelessWidget {
//   const _Date({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<NotificationState>(
//       builder: (_, state, __) {
//         return Text(
//           '${DateFormat('dd-MM-yyyy').format(DateTime.parse(state.notification![0].dateSend!))}  |  ${DateFormat('HH:mm').format(DateTime.parse(state.notification![0].dateSend!))}',
//           style: TextStyle(
//             color: grayColor,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _Title extends StatelessWidget {
//   const _Title({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<NotificationState>(
//       builder: (_, state, __) {
//         return Text(
//           state.notification![0].title!,
//           style: const TextStyle(
//             fontSize: 18.0,
//             fontWeight: FontWeight.w500,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _Description extends StatelessWidget {
//   const _Description({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<NotificationState>(
//       builder: (_, state, __) {
//         return Text(
//           state.notification![0].body!.capitalizeFirstofEach,
//           style: const TextStyle(
//             color: Colors.black54,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _Image extends StatelessWidget {
//   const _Image({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<NotificationState>(
//       builder: (_, state, __) {
//         return SizedBox(
//           width: AppSize.widthScreen(context),
//           height: AppSize.heightScreen(context) * 0.4,
//           child: Image.network(imageURl + state.notification![0].image!),
//         );
//       },
//     );
//   }
// }
