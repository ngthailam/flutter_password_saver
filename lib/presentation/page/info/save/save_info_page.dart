import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/info/save/bloc/save_info_bloc.dart';
import 'package:flutter_password_saver/presentation/page/info/save/bloc/save_info_event.dart';
import 'package:flutter_password_saver/presentation/page/info/save/bloc/save_info_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/utils/snackbar_ext.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/primary_button.dart';
import 'package:flutter_password_saver/presentation/widget/primary_text_input.dart';

class SaveInfoPageArg {
  final String? infoId;

  SaveInfoPageArg({this.infoId});
}

class SaveInfoPage extends StatefulWidget {
  const SaveInfoPage({Key? key, required this.arg}) : super(key: key);

  final SaveInfoPageArg? arg;

  @override
  State<SaveInfoPage> createState() => _SaveInfoPageState();
}

class _SaveInfoPageState extends State<SaveInfoPage> {
  final SaveInfoBloc _bloc = getIt<SaveInfoBloc>();
  late TextEditingController _nameTextEdtCtrl;
  late TextEditingController _descTextEdtCtrl;

  @override
  void initState() {
    super.initState();
    _nameTextEdtCtrl = TextEditingController()
      ..addListener(() {
        _bloc.onNameChanged(_nameTextEdtCtrl.text);
      });
    _descTextEdtCtrl = TextEditingController()
      ..addListener(() {
        _bloc.onDescChanged(_descTextEdtCtrl.text);
      });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
    _nameTextEdtCtrl.dispose();
    _descTextEdtCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SaveInfoBloc>(
        create: (ctx) =>
            _bloc..add(PrefetchInfoEvent(infoId: widget.arg?.infoId)),
        child: BlocListener<SaveInfoBloc, SaveInfoState>(
          listener: (context, state) {
            if (state.loadState == LoadState.success) {
              context.showSuccessSnackBar(S().sbEditInfoSuccess);
              Navigator.of(context).pop(_bloc.isDataChanged);
            }

            final info = state.info;
            if (info != null) {
              _nameTextEdtCtrl.text = state.info!.name;
              _descTextEdtCtrl.text = state.info!.desc;
            }
          },
          child: _primary(),
        ),
      ),
    );
  }

  Widget _primary() {
    return Stack(
      children: [
        Positioned(
          bottom: 100,
          right: -50,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              color: AppColors.blue400.withOpacity(0.8),
            ),
          ),
        ),
        Positioned(
          top: -50,
          left: -50,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(300),
              color: AppColors.blue400.withOpacity(0.6),
            ),
          ),
        ),
        Positioned(
          top: 16,
          child: IconButton(
            color: AppColors.white500,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 80, right: 16, bottom: 8),
          child: ListView(
            children: [
              _title(),
              const SizedBox(height: 16),
              _notice(),
              const SizedBox(height: 48),
              _nameTextField(),
              _descTextField(),
              const SizedBox(height: 56), // Avoid bottom button
            ],
          ),
        ),
        Positioned(bottom: 8, child: _confirmBtn()),
      ],
    );
  }

  Widget _title() {
    return Text(
      S().saveInfoTitle,
      style: const TextStyle(fontSize: 24),
    );
  }

  Widget _notice() {
    return Text(
      S().saveInfoSubTitle,
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
      ),
    );
  }

  Widget _nameTextField() {
    return PrimaryTextInput(
      icon: Icons.accessibility_sharp,
      controller: _nameTextEdtCtrl,
      hintText: S().saveInfoHintName,
      margin: const EdgeInsets.symmetric(vertical: 8),
    );
  }

  Widget _descTextField() {
    return PrimaryTextInput(
      icon: Icons.group,
      controller: _descTextEdtCtrl,
      hintText: S().saveInfoHintDesc,
      margin: const EdgeInsets.symmetric(vertical: 8),
    );
  }

  Widget _confirmBtn() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width - 32,
      child: PrimaryButton(
        margin: EdgeInsets.zero,
        onPressed: () {
          if (_nameTextEdtCtrl.text.isEmpty || _descTextEdtCtrl.text.isEmpty) {
            context.showErrorSnackBar(S().saveInfoError);
          } else {
            _bloc.add(ConfirmSaveInfoEvent());
          }
        },
        text: S().save,
      ),
    );
  }
}
