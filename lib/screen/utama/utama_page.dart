import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:dfzagency/dfz.dart';

class UtamaPage extends StatelessWidget {
  const UtamaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
        top: 8.0,
      ),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _Points(),
        // _SubMenuList(),
        _KeyHighlights(),
        _SizedBox30(),
        _ProductList1(),
        _SizedBox30(),
        _AlHaddadCorner(),
        _SizedBox30(),
        _ProductList2(),
      ],
    );
  }
}

class _ProductList1 extends StatelessWidget {
  const _ProductList1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Product 1'),
          _ViewAllButton(onTap: () => {})
        ]),
        const _ProductListItems(),
      ],
    );
  }
}

class _ProductList2 extends StatelessWidget {
  const _ProductList2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Product 2'),
          _ViewAllButton(onTap: () => {})
        ]),
        const _ProductListItems(),
      ],
    );
  }
}

class _ProductListItems extends StatelessWidget {
  const _ProductListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            1,
            (index) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductCard(
                          title: 'KYT NFJ RADAR BLUE',
                          price: 'RMXX.XX',
                          image: 'assets/productdfz/h1.jpg',
                          onTap: () => {AppRoute.push(context, KedaiWebviewPage())}),
                      _SizedBoxWidth30(),
                      ProductCard(
                          title: 'MHR BEATZ F20M GOLD WORLD CHAMPION (limited edition)',
                          price: 'RMXX.XX',
                          image: 'assets/productdfz/h2.jpg',
                          onTap: () => {AppRoute.push(context, KedaiWebviewPage())}),
                      _SizedBoxWidth30(),
                      ProductCard(
                          title: 'HYPERTECH CNC PRO – R2 ARM Y15 (SILVER)',
                          price: 'RMXX.XX',
                          image: 'assets/productdfz/h3.jpg',
                          onTap: () => {AppRoute.push(context, KedaiWebviewPage())}),
                      _SizedBoxWidth30(),
                      ProductCard(
                          title: 'RAPIDO EX – PIPE S/STEEL STD',
                          price: 'RMXX.XX',
                          image: 'assets/productdfz/h4.jpg',
                          onTap: () => {AppRoute.push(context, KedaiWebviewPage())}),
                      _SizedBoxWidth30(),
                      ProductCard(
                          title: 'HPSP FRONT FORK Y15 & Y16',
                          price: 'RMXX.XX',
                          image: 'assets/productdfz/h5.jpg',
                          onTap: () => {AppRoute.push(context, KedaiWebviewPage())}),
                    ],
                  ),
                ))
      ],
    );
  }
}

class _Points extends StatelessWidget {
  const _Points({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        // AppRoute.push(context, PointsPage())
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSize.widthScreen(context) * 0.6,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Points:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text: ' 3200',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SubMenuList extends StatelessWidget {
  const _SubMenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GridView.count(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          crossAxisSpacing: 6,
          crossAxisCount: 4,
          childAspectRatio: 0.8,
          children: <Widget>[
            FastAppIcons(
                label: 'DFZ Agency Mall',
                image: 'assets/images/Alhaddad_Marketing_2.png',
                onPressed: () => {
                  // AppRoute.push(context, HaddadMallPage())
                }),
            FastAppIcons(
                label: 'Mart',
                image: 'assets/images/Alhaddad_Marketing.png',
                onPressed: () => {
                  // AppRoute.push(context, MartsjidPage())
                }),
            FastAppIcons(
                label: 'Lokasi Stokis',
                image: 'assets/images/Alhaddad_Lokasi_Stokis.png',
                onPressed: () =>
                    {
                      // AppRoute.push(context, StokisTerdekatpage())
                    }),
            FastAppIcons(
                label: 'Jejak Parcel',
                image: 'assets/images/Alhaddad_Jejak_Parcel.png',
                onPressed: () => {
                  // AppRoute.push(context, JejakParcelPage());
                }),
            FastAppIcons(
                label: 'Wadi DFZ Agency',
                image: 'assets/images/alhaddad_wadi_cs.png',
                onPressed: () => {
                      // AppRoute.push(context, ProdukMasjidPage())
                    }),
            FastAppIcons(
                label: 'DFZ Agency Maritime',
                image: 'assets/images/alhaddad_maritime_cs.png',
                onPressed: () => {}),
            FastAppIcons(
                label: 'DFZ Agency Farm Village',
                image: 'assets/images/alhaddad_farm_cs.png',
                onPressed: () => {
                      // AppRoute.push(context, KomunitiMasjidPage())
                    }),
            FastAppIcons(
                label: 'Test Attendance',
                image: 'assets/images/Alhaddad_Farm.png',
                onPressed: () => {
                  // AppRoute.push(context, AttendanceScanPage())
                }),
            FastAppIcons(
                label: 'Try',
                image: 'assets/images/Alhaddad_Farm.png',
                onPressed: () => {
                  // AppRoute.push(context, TryPage())
                }),
          ],
        ),
      ],
    );
  }
}

class _KeyHighlights extends StatelessWidget {
  const _KeyHighlights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        const _TitleText(label: 'Key Highlights'),
        const SizedBox(height: 16.0),
        _CarouselSlideShow(),
      ],
    );
  }
}

class _TitleText extends StatelessWidget {
  final String label;

  const _TitleText({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: darkColor,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
  }
}

class _CarouselSlideShow extends StatelessWidget {
  final CarouselController carouselController = CarouselController();

  _CarouselSlideShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
          height: 200.0,
          initialPage: 1,
          disableCenter: true,
          pageSnapping: false,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          enableInfiniteScroll: false,
        ),
        items: const [
          SliderImage(image: 'assets/productdfz/p1.png'),
          SliderImage(image: 'assets/productdfz/p2.jpg'),
          SliderImage(image: 'assets/productdfz/p3.jpg'),
          SliderImage(image: 'assets/productdfz/p4.png'),
          SliderImage(image: 'assets/productdfz/p5.jpg'),
          SliderImage(image: 'assets/productdfz/p6.jpg'),
        ]);
  }
}

class _AlHaddadCorner extends StatelessWidget {
  const _AlHaddadCorner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _TitleText(label: 'DFZ Agency Corner'),
            _ViewAllButton(onTap: () {}),
          ],
        ),
        const SizedBox(height: 16.0),
        _CarouselSlideShow(),
      ],
    );
  }
}

class _ViewAllButton extends StatelessWidget {
  final VoidCallback onTap;

  const _ViewAllButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: const Text(
            "Lihat Semua",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: labelTextColor,
            ),
          ),
        ),
        const SizedBox(width: 4.0),
        const Icon(
          EvaIcons.arrowIosForward,
          size: 18.0,
          color: labelTextColor,
        )
      ],
    );
  }
}

class _SizedBox30 extends StatelessWidget {
  const _SizedBox30({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
    );
  }
}

class _SizedBoxWidth30 extends StatelessWidget {
  const _SizedBoxWidth30({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
    );
  }
}
