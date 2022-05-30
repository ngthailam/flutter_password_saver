import 'package:flutter/widgets.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
    required this.description,
    required this.image,
    required this.onCtaTap,
  }) : super(key: key);

  final String description;
  final String image;
  final VoidCallback onCtaTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _mainImg(context),
          const SizedBox(height: 16),
          _description(),
          const SizedBox(height: 32),
          _cta(),
        ],
      ),
    );
  }

  Widget _mainImg(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: AppColors.blue300)),
      child: Image.asset(
        'assets/image/$image',
        height: 160,
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Widget _description() {
    return Expanded(
      child: Text(description),
    );
  }

  Widget _cta() {
    return PrimaryButton(
      text: S().textContinue,
      onPressed: onCtaTap,
      margin: EdgeInsets.zero,
    );
  }
}
