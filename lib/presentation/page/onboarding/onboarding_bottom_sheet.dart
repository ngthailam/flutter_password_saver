import 'package:flutter/material.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/presentation/page/onboarding/onboarding_page_widget.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';

Future showOnboardingBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (context) {
      return const Wrap(
        children: [OnboardingBottomSheet()],
      );
    },
  );
}

class OnboardingBottomSheet extends StatefulWidget {
  const OnboardingBottomSheet({Key? key}) : super(key: key);

  @override
  State<OnboardingBottomSheet> createState() => _OnboardingBottomSheetState();
}

class _OnboardingBottomSheetState extends State<OnboardingBottomSheet> {
  PageController? _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      padding: MediaQuery.of(context).viewInsets,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _pageView(),
          _indicators(),
        ],
      ),
    );
  }

  Widget _pageView() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int pageIdx) {
          setState(() {
            _selectedIndex = pageIdx;
          });
        },
        children: [
          OnboardingPage(
            image: 'onboard_create.png',
            description: S().onboard_desc_create,
            onCtaTap: _animateToNextPage,
          ),
          OnboardingPage(
            image: 'onboard_reorder.png',
            description: S().onboard_desc_reorder,
            onCtaTap: _animateToNextPage,
          ),
          OnboardingPage(
            image: 'onboard_swipe_setting.png',
            description: S().onboard_desc_swipe,
            onCtaTap: _animateToNextPage,
          ),
          OnboardingPage(
            image: 'onboard_settings.png',
            description: S().onboard_desc_settings,
            onCtaTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _animateToNextPage() => _animateToPage(_selectedIndex + 1);
  // ignore: unused_element
  void _animateToPrevPage() => _animateToPage(_selectedIndex - 1);

  void _animateToPage(int pageIndex) {
    _pageController?.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _indicators() {
    return Positioned(
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _PageIndicator(isActive: _selectedIndex == 0),
            _PageIndicator(isActive: _selectedIndex == 1),
            _PageIndicator(isActive: _selectedIndex == 2),
            _PageIndicator(isActive: _selectedIndex == 3),
          ],
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({Key? key, required this.isActive}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 12 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            _boxShadow,
          ],
          shape: BoxShape.circle,
          color: isActive ? AppColors.blue500 : AppColors.ink300,
        ),
      ),
    );
  }

  BoxShadow get _boxShadow {
    if (isActive) {
      return BoxShadow(
        color: const Color(0XFF2FB7B2).withOpacity(0.72),
        blurRadius: 4.0,
        spreadRadius: 1.0,
        offset: const Offset(0.0, 0.0),
      );
    }

    return const BoxShadow(color: Colors.transparent);
  }
}
