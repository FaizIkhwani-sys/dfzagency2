import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NotificationState(),
      child: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final bool flag = true;

  @override
  void initState() {
    final state = context.read<NotificationState>();

    // state.getNotification();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (context, state, child) {
        return const _Notifications();
          // state.notificationList == null ? const _NoMessage() : const _Notifications();
      },
    );
  }
}

class _NoMessage extends StatelessWidget {
  const _NoMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/no_message.png'),
          const SizedBox(height: 16.0),
          const Text(
            'Tiada sebarang notifikasi.',
            style: TextStyle(
              color: grayColor,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}

class _Notifications extends StatelessWidget {
  const _Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return ListView.separated(
          itemCount: 1,
          itemBuilder: (_, index) {
            return AppNotificationCard(
              title: notificationTitle,
              date: '20-10-2021',
              description: notificationDescription,
              onTap: () => {
              // AppRoute.push(context, const NotificationDetailsPage()
              }
            );
          },
          separatorBuilder: (_, __) => const _Divider(),
        );
        // return state.isLoading
        //     ? const AppLoadingOverlay()
        //     : SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       ...List.generate(
        //           1,
        //               (i) =>
        //               AppNotificationCard(
        //                   title: state.notificationList![i].title!,
        //                   date:
        //                   "${DateFormat('dd-MM-yyyy').format(DateTime.parse(
        //                       state.notificationList![i].dateSend!))}",
        //                   description: state.notificationList![i].body ?? '',
        //                   image: state.notificationList![i].image!,
        //                   onTap: () {
        //                     print(state.notificationList![i].idNotifikasi);
        //                     print(
        //                         state.notificationList![i].idNotifikasiSend);
        //
        //                     AppRoute.push(
        //                         context,
        //                         NotificationDetailsPage(
        //                           idNotification: state
        //                               .notificationList![i].idNotifikasi!,
        //                         ));
        //                   },
        //                   onDelete: () {
        //                     state.deleteNotification(
        //                         state.notificationList![i].idNotifikasiSend!);
        //                     state.getNotification();
        //                   })),
        //     ],
        //   ),
        // );
      },
    );
    // return ListView.separated(
    //   itemCount: 5,
    //   itemBuilder: (_, index) {
    //     return AppNotificationCard(
    //       title: notificationTitle,
    //       date: '20-10-2021',
    //       description: notificationDescription,
    //       onTap: () => AppRoute.push(context, const NotificationDetailsPage()),
    //     );
    //   },
    //   separatorBuilder: (_, __) => const _Divider(),
    // );
  }
}


class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1.0);
  }
}
