import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageState(),
      child: const _Body(),
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
    super.initState();
    final state = context.read<HomePageState>();
    state.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return AppMainBar(
          // hasDrawer: true,
          title: page[state.selectedIndex]['title'],
          bottomNavigationBar: const _BottomNavigationBar(),
          body: const _Content(),
          actions: [
            InkWell(
              onTap: () {
                // AppRoute.push(context, CartPage());
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.homeOutline),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.briefcaseOutline),
              label: "Services",
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.qr_code_2_outlined,
                    color: Colors.black,
                  )),
              label: "QR SCAN",
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.messageSquareOutline),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.personOutline),
              label: "My Account",
            ),
          ],
          currentIndex: state.selectedIndex,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedFontSize: 12.0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: grayColor,
          selectedItemColor: primaryColor,
          onTap: (index) => state.selectedIndex = index,
        );
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return page[state.selectedIndex]['page'];
      },
    );
  }
}
