import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_password_saver/initializer/theme_util.dart';
import 'package:flutter_password_saver/presentation/page/info/list/info_page.dart';
import 'package:flutter_password_saver/presentation/page/password/list/password_page.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  }

  @override
  void dispose() {
    _pageController.dispose();
    _segmentedController.dispose();
    super.dispose();
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
          color: isDarkMode()
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
