import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';

FocusNode? _othersNode;
FocusNode? _reportNode;

class RunnerTowingInformer extends StatelessWidget {
  const RunnerTowingInformer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LaporKemalanganState(),
      child: const AppSecondaryBar(
        title: 'Ask a Hand',
        body: _Body(),
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    _othersNode = FocusNode();
    _reportNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LaporKemalanganState>(builder: (_, state, __) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // const _PilihBencana(),
              const _Laporan(),
              const _PilihanTempat(),
              Row(
                mainAxisAlignment: AppSize.mainCenter,
                crossAxisAlignment: AppSize.crossCenter,
                children: [
                  if (state.lat != "") const _LatLong(),
                  if (state.pilihMethodAlamat == "2") const _ButtonLocation(),
                ],
              ),
              if (state.pilihMethodAlamat == "1") const _AlamatBencana(),
              const _PilihanBantuan(),

            ],
          ),
        ),
      );
    });
  }
}

class _Laporan extends StatelessWidget {
  const _Laporan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LaporKemalanganState>(
      builder: (_, state, __) {
        return AppTextField(
          label: 'Laporan Kemalangan',
          maxLine: 3,
          onChange: (v) => state.report = v,
          onSubmitted: (v) => state.report = v,
          errorText: state.reportHasError ? state.reportError : null,
        );
      },
    );
  }
}

class _AlamatBencana extends StatelessWidget {
  const _AlamatBencana({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LaporKemalanganState>(
      builder: (_, state, __) {
        return AppTextField(
          label: 'Alamat Tempat Bencana',
          maxLine: 3,
          onChange: (v) => state.alamat = v,
          onSubmitted: (v) => state.alamat = v,
        );
      },
    );
  }
}

class _ButtonLocation extends StatelessWidget {
  const _ButtonLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LaporKemalanganState>(
      builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: primaryColor,
            ),
            child: InkWell(
              onTap: () => _getLocation(context),
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: TextManrope(
                  text: "Dapatkan Lokasi",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<void> _getLocation(BuildContext context) async {
  final state = context.read<LaporKemalanganState>();

  state.getCurrentLocation();

  if (state.isLoading == true) {
    await showDialog(
        useSafeArea: true,
        context: context,
        builder: (_) => const Center(
              child: CircularProgressIndicator(),
            ));
  }

  return;
}

class _LatLong extends StatefulWidget {
  const _LatLong({Key? key}) : super(key: key);

  @override
  State<_LatLong> createState() => _LatLongState();
}

class _LatLongState extends State<_LatLong> {
  final _controller = TextEditingController();

  @override
  void initState() {
    final state = context.read<LaporKemalanganState>();
    super.initState();
    _controller.text = "${state.lat}, ${state.long}";
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.widthScreen(context) * 0.4,
      child: AppTextField(
        controller: _controller,
        label: 'Latitud & Longitud',
        enabled: false,
        readOnly: true,
      ),
    );
  }
}

class _PilihanTempat extends StatelessWidget {
  const _PilihanTempat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LaporKemalanganState>(
      builder: (_, state, __) {
        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: AppRadioButton(
            label: 'Pilih jenis ',
            onChange: (v) => state.pilihMethodAlamat = v,
            groupValue: state.pilihMethodAlamat,
            radioList: [
              RadioListItem('1', 'Masukkan Alamat'),
              RadioListItem('2', 'Dapatkan Lokasi Anda Sekarang'),
            ],
            errorText: state.pilihMethodAlamatError,
          ),
        );
      },
    );
  }
}

class _PilihanBantuan extends StatelessWidget {
  const _PilihanBantuan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LaporKemalanganState>(
      builder: (_, state, __) {
        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: AppRadioButton(
            label: 'Pilih jenis ',
            onChange: (v) => state.pilihExtraHelp = v,
            groupValue: state.pilihExtraHelp,
            radioList: [
              RadioListItem('1', 'Runner'),
              RadioListItem('2', 'Towing'),
              RadioListItem('3', 'Informer'),
            ],
            // errorText: state.pilihMethodAlamatError,
          ),
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppSubmitButton(
        title: 'HANTAR',
        onTap: () => _onSubmitted(context),
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
          title: "Pemberitahuan",
          subtitle: 'Terima kasih atas laporan bencana yang dihantar.',
          description: "Tindakan akan segera diambil.",
          actionButtons: [
            ActionButton(
              label: 'Kembali',
              color: primaryColor,
              onTap: () => AppRoute.pop(context),
            ),
          ],
        ),
      );
    },
  );
  // final state = context.read<LaporKemalanganState>();
  //
  // FocusScope.of(context).unfocus();
  //
  // state.validateAll();
  //
  // if (state.othersHasError) {
  //   _othersNode!.requestFocus();
  //   return;
  // }
  // if (state.reportHasError) {
  //   _reportNode!.requestFocus();
  //   return;
  // }
  //
  // await state.laporBencana();
  //
  // AppRoute.pop(context);
}
