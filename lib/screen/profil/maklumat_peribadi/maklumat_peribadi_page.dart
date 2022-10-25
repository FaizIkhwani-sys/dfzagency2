import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';


late FocusNode _nameNode;
late FocusNode _phoneNode;
late FocusNode _emailNode;
late FocusNode _address1Node;
late FocusNode _address2Node;
late FocusNode _address3Node;
late FocusNode _postcodeNode;

class MaklumatPeribadi extends StatelessWidget {
  const MaklumatPeribadi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfilState(),
      child: const AppSecondaryBar(
          title: "Maklumat Peribadi",
          body: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 18.0, 18.0, 8.0),
        child: Column(
          children: const [
            _NameField(),
            _UserNameField(),
            _PhoneField(),
            _EmailField(),
            _JobTypeField(),
            _AddressField1(),
            _AddressField2(),
            _AddressField3(),
            _SubmitButton(),
          ],
        ),
      ),
    );
  }
}

class _NameField extends StatefulWidget {
  const _NameField({Key? key}) : super(key: key);

  @override
  __NameFieldState createState() => __NameFieldState();
}

class __NameFieldState extends State<_NameField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfilState>();

    _nameNode = FocusNode();
    _controller.text = nama;
    //testdata

    SchedulerBinding.instance.addPostFrameCallback((_) {
      state.name = nama;
    });
  }

  @override
  void dispose() {
    _nameNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.name;
        }
        return AppTextField(
          hint: "Nama Penuh Anda",
          controller: _controller,
          focusNode: _nameNode,
          label: 'Nama Penuh',
          errorText: state.nameHasError ? state.nameError : null,
          onChange: (v) => state.name = v,
          onSubmitted: (v) => state.name = v,
        );
      },
    );
  }
}

class _UserNameField extends StatefulWidget {
  const _UserNameField({Key? key}) : super(key: key);

  @override
  __UserNameFieldState createState() => __UserNameFieldState();
}

class __UserNameFieldState extends State<_UserNameField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = noKP;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: _controller,
      label: 'No. Kad Pengenalan',
      enabled: false,
      readOnly: true,
    );
  }
}

class _PhoneField extends StatefulWidget {
  const _PhoneField({Key? key}) : super(key: key);

  @override
  __PhoneFieldState createState() => __PhoneFieldState();
}

class __PhoneFieldState extends State<_PhoneField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfilState>();

    _phoneNode = FocusNode();
    _controller.text = noPhone;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      state.phone = noPhone;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _phoneNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.phone;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _phoneNode,
          label: 'No. Telefon',
          keyboardType: TextInputType.number,
          inputFormatter: [FilteringTextInputFormatter.digitsOnly],
          errorText: state.phoneHasError ? state.phoneError : null,
          onChange: (v) => state.phone = v,
          onSubmitted: (v) => state.phone = v,
        );
      },
    );
  }
}

class _EmailField extends StatefulWidget {
  const _EmailField({Key? key}) : super(key: key);

  @override
  __EmailFieldState createState() => __EmailFieldState();
}

class __EmailFieldState extends State<_EmailField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfilState>();

    _emailNode = FocusNode();
    _controller.text = emel;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      state.email = emel;
    });
  }

  @override
  void dispose() {
    _emailNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.email;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _emailNode,
          label: 'E-Mel',
          keyboardType: TextInputType.emailAddress,
          errorText: state.emailHasError ? state.emailError : null,
          onChange: (v) => state.email = v,
          onSubmitted: (v) => state.email = v,
        );
      },
    );
  }
}

class _AddressField1 extends StatefulWidget {
  const _AddressField1({Key? key}) : super(key: key);

  @override
  _AddressField1State createState() => _AddressField1State();
}

class _AddressField1State extends State<_AddressField1> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfilState>();

    _address1Node = FocusNode();
    _controller.text = alamat1;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      state.address1 = alamat1;
    });
  }

  @override
  void dispose() {
    _address1Node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.address1!;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _address1Node,
          label: 'Alamat',
          minLine: 3,
          maxLine: 5,
          errorText: state.addressHasError1 ? state.addressError1 : null,
          onChange: (v) => state.address1 = v,
          onSubmitted: (v) => state.address1 = v,
        );
      },
    );
  }
}

class _AddressField2 extends StatefulWidget {
  const _AddressField2({Key? key}) : super(key: key);

  @override
  _AddressField2State createState() => _AddressField2State();
}

class _AddressField2State extends State<_AddressField2> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfilState>();

    _address2Node = FocusNode();
    _controller.text = alamat2;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      state.address2 = alamat2;
    });
  }

  @override
  void dispose() {
    _address2Node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.address2!;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _address2Node,
          label: 'Alamat2',
          minLine: 3,
          maxLine: 3,
          errorText: state.addressHasError2 ? state.addressError2 : null,
          onChange: (v) => state.address2 = v,
          onSubmitted: (v) => state.address2 = v,
        );
      },
    );
  }
}

class _AddressField3 extends StatefulWidget {
  const _AddressField3({Key? key}) : super(key: key);

  @override
  _AddressField3State createState() => _AddressField3State();
}

class _AddressField3State extends State<_AddressField3> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfilState>();

    _address3Node = FocusNode();
    _controller.text = alamat3;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      state.address3 = alamat3;
    });
  }

  @override
  void dispose() {
    _address3Node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.address3!;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _address3Node,
          label: 'Alamat3',
          minLine: 5,
          maxLine: 5,
          errorText: state.addressHasError3 ? state.addressError3 : null,
          onChange: (v) => state.address3 = v,
          onSubmitted: (v) => state.address3 = v,
        );
      },
    );
  }
}

class _JobTypeField extends StatelessWidget {
  const _JobTypeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilState>(
      builder: (_, state, __) {
        return AppSelectField(
          label: 'Jenis Pekerjaan',
          hint: state.namaPekerjaan,
          items: _mapItems(state),
          onChange: (v) => {
            state.namaPekerjaan = v,
            // state.idPekerjaan = state.pekerjaan!.idPekerjaan!,
          },
        );
      },
    );
  }

  _mapItems(state) {
    List list = ["Sendiri", "Kerajaan", "Swasta", "Pencen", "Tidak Bekerja"];
    return ["Sendiri", "Kerajaan", "Swasta", "Pencen", "Tidak Bekerja"]
        .map((item) => appDropDownMenuItem(item, item))
        .toList();
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilState>(builder: (_, state, __) {
      return AppSubmitButton(
        onTap: () => _onSubmitted(context),
        title: 'KEMASKINI',
      );
    });
  }

  Future<void> _onSubmitted(BuildContext context) async {
    FocusScope.of(context).unfocus();

    final state = context.read<ProfilState>();

    // state.validateAll();

    if (state.nameHasError) {
      _nameNode.requestFocus();
      return;
    }
    if (state.phoneHasError) {
      _phoneNode.requestFocus();
      return;
    }
    if (state.emailHasError) {
      _emailNode.requestFocus();
      return;
    }
    if (state.postcodeHasError) {
      _postcodeNode.requestFocus();
      return;
    }

    // state.editUserProfile(context);
  }
}