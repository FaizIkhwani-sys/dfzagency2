import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfilState(),
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
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    final state = context.read<ProfilState>();
    await Future.delayed(const Duration(milliseconds: 1000));
    // state.getProfileUserData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    initState();

    _refreshController.loadComplete();
  }

  @override
  void initState() {
    final state = context.read<ProfilState>();
    // state.getProfileUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      header: const WaterDropHeader(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: Consumer<ProfilState>(
        builder: (context, state, child) {
          return state.isLoading == true
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                        primaryColor,
                        secondaryColor,
                      ])),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const _TopHeader(),
                      _ProfilCard(
                        title: "Maklumat Peribadi",
                        subtitle: "Anda boleh menyunting maklumat peribadi "
                            "anda seperti Nama, No. Telephone,"
                            " Alamat dan lain-lain.",
                        onTap: () =>
                            AppRoute.push(context, const MaklumatPeribadi()),
                      ),
                      _ProfilCard(
                        title: "Daftar Keluar",
                        subtitle:  "Log Keluar sekarang.",
                        onTap: () =>{}
                            // AppRoute.pushAndRemoveUntil(context, const GettingStartedPage2()),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class _TopHeader extends StatelessWidget {
  const _TopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _ProfilePicture(),
        _Name(),
        _QrCode(),
        // _Content(),
      ],
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilState>(
      builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 4.0, top: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: AppSize.mainStart,
            crossAxisAlignment: AppSize.crossCenter,
            children: [
              SizedBox(
                width: AppSize.widthScreen(context) * 0.70,
                child: const TextManrope(
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  text: "Faiz Ikhwani",
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: AppSize.widthScreen(context) * 0.70,
                child: const TextManrope(
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  text: "P016, Baling ",
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilState>(
      builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 2.0, top: 30.0),
          child: InkWell(
            onTap: () {
              // if (state.profilUserData![0].gambar != '') {
              //   Navigator.of(context).push(PageRouteBuilder(
              //     pageBuilder: (context, animation, secondaryAnimation) =>
              //         _Image(image: '${state.profilUserData![0].gambar}'),
              //     transitionsBuilder:
              //         (context, animation, secondaryAnimation, child) {
              //       const begin = Offset(0.0, 1.0);
              //       const end = Offset.zero;
              //       const curve = Curves.ease;
              //
              //       final tween = Tween(begin: begin, end: end);
              //       final curvedAnimation = CurvedAnimation(
              //         parent: animation,
              //         curve: curve,
              //       );
              //
              //       return SlideTransition(
              //         position: tween.animate(curvedAnimation),
              //         child: child,
              //       );
              //     },
              //   ));
              // } else {
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const _ImageAsset(image: 'assets/image/profil_pic.jpg'),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  final tween = Tween(begin: begin, end: end);
                  final curvedAnimation = CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  );

                  return SlideTransition(
                    position: tween.animate(curvedAnimation),
                    child: child,
                  );
                },
              ));
              // }
            },
            child: Row(
              mainAxisAlignment: AppSize.mainCenter,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: AppSize.heightScreen(context) * 0.14,
                      width: AppSize.widthScreen(context) * 0.3,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                    state.isLoading == false
                        ? Container(
                            height: AppSize.heightScreen(context) * 0.13,
                            width: AppSize.widthScreen(context) * 0.3,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/profil_pic.png"),
                                  fit: BoxFit.cover,
                                )),
                          )
                        : Container(
                            height: AppSize.heightScreen(context) * 0.13,
                            width: AppSize.widthScreen(context) * 0.3,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: MemoryImage(
                                      base64Decode(
                                        " ",
                                      ),
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ImageAsset extends StatelessWidget {
  final String image;

  const _ImageAsset({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      gaplessPlayback: true,
      backgroundDecoration: const BoxDecoration(
        color: Colors.black,
      ),
      imageProvider: AssetImage(image),
    );
  }
}

class _ProfilCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ProfilCard(
      {required this.title,
      required this.subtitle,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: AppSize.widthScreen(context),
          // height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  primaryColor,
                  secondaryColor,
                ]),
          ),
          child: Row(
            mainAxisAlignment: AppSize.mainSpaceEvenly,
            children: [
              Column(
                mainAxisAlignment: AppSize.mainStart,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 18.0, 18.0, 8.0),
                    child: SizedBox(
                      width: AppSize.widthScreen(context) * 0.6,
                      child: TextManrope(
                        text: title,
                        fontSize: AppSize.fontSize(context) * 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 18.0, 18.0),
                    child: SizedBox(
                      width: AppSize.widthScreen(context) * 0.6,
                      child: TextManrope(
                        text: subtitle,
                        color: Colors.white,
                        maxLines: 5,
                        textAlign: TextAlign.start,
                        fontSize: AppSize.fontSize(context) * 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileTab extends StatefulWidget {
  const _ProfileTab({Key? key}) : super(key: key);

  @override
  State<_ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<_ProfileTab>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 12),
      child: Container(
        width: AppSize.widthScreen(context),
        height: AppSize.heightScreen(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: primaryColor,
                ),
                labelColor: secondaryColor,
                unselectedLabelColor: darkColor,
                tabs: const [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Maklumat Peribadi',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Maklumat Mengundi',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  MaklumatPeribadi(),
                  Container(),

                  // second tab bar view widget
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QrCode extends StatelessWidget {
  const _QrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var base64;
    var encrypted;
    var statusBayaran;
    return Consumer<ProfilState>(
      builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            width: 100,
            child: QrImage(
              foregroundColor: lightColor,
              data: state.dataConvert,
              version: QrVersions.auto,
              size: 100,
            ),
          ),
        );
      },
    );
    //   Image.asset(
    //   'assets/dummy/qr_code.png',
    //   width: 60.0,
    // );
  }
}
