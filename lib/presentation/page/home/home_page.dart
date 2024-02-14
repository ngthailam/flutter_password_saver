import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_password_saver/domain/usecase/preference/account_preference_use_case.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/initializer/theme_util.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/modules/auth/presentation/auth/authen/authen_bottom_sheet.dart';
import 'package:flutter_password_saver/presentation/page/info/list/info_page.dart';
import 'package:flutter_password_saver/presentation/page/password/list/password_page.dart';
import 'package:flutter_password_saver/presentation/utils/ui_utils.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final PageController _pageController = PageController(initialPage: 0);
  final CustomSegmentedController<int> _segmentedController =
      CustomSegmentedController();

  final ValueNotifier<int> _segmentedIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _segmentedController.addListener(() async {
      if (_segmentedIndex.value != _segmentedController.value) {
        await Future.delayed(const Duration(milliseconds: 350));
        _segmentedIndex.value = _segmentedController.value!;
      }
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _segmentedController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        _showAuthenBottomSheetIfNeeded();
        break;
      case AppLifecycleState.paused:
        break;
      default:
        return;
    }
  }

  Future _showAuthenBottomSheetIfNeeded() async {
    if (!mounted) return;
    final isRequirePassword =
        await getIt<AccountPreferenceUseCase>().getIsRequirePassOnForeground();
    if (!isRequirePassword) return;

    // ignore: use_build_context_synchronously
    final isAuthenSuccess = await showAuthenBottomSheet(
      context,
      authenReason: S().authenReasonRequirePassOnForeground,
    );
    if (isAuthenSuccess != true) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _pages()),
            Center(child: _segmentControl()),
          ],
        ),
      ),
    );
  }

  Widget _segmentControl() {
    return ValueListenableBuilder(
      valueListenable: MyApp.themeNotifier,
      builder: (context, newValue, child) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: CustomSlidingSegmentedControl<int>(
            controller: _segmentedController,
            fromMax: true,
            initialValue: 0,
            children: {
              0: _segmentItem('Password', 0),
              1: _segmentItem('Information', 1),
            },
            decoration: BoxDecoration(
              color: newValue == ThemeMode.dark
                  ? AppColors.black300
                  : CupertinoColors.lightBackgroundGray,
              borderRadius: BorderRadius.circular(16),
            ),
            thumbDecoration: BoxDecoration(
              color: AppColors.blue400,
              borderRadius: BorderRadius.circular(16),
            ),
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInToLinear,
            onValueChanged: (int index) {
              if (index != _pageController.page) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget _segmentItem(String text, int index) {
    return ValueListenableBuilder<int>(
      valueListenable: _segmentedIndex,
      builder: (_, newValue, child) {
        return Text(
          text,
          style: TextStyle(
            color: newValue == index
                ? Colors.white
                : (isDarkMode() ? AppColors.white300 : AppColors.black300),
          ),
        );
      },
    );
  }

  Widget _pages() {
    return PageView(
      controller: _pageController,
      onPageChanged: (int index) {
        if (index != _segmentedController.value) {
          unfocus();
          _segmentedController.value = index;
        }
      },
      children: const [
        PasswordPage(),
        InfoPage(),
      ],
    );
  }
}
